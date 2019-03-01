package com.ttb.service.taxburden;

import com.ttb.service.taxburden.calculation.PayrollTaxBracketedMarginalRateCalculator;
import com.ttb.service.taxburden.calculation.PayrollTaxFlatRateCalculator;
import com.ttb.service.taxburden.calculation.TaxCalculationException;
import com.ttb.service.taxburden.domain.PoliticalDivisionType;
import com.ttb.service.taxburden.domain.TaxFilingStatus;
import com.ttb.service.taxburden.domain.TaxType;
import com.ttb.service.taxburden.entities.*;
import com.ttb.service.taxburden.repositories.IncomeTaxDefinitionRepository;
import com.ttb.service.taxburden.repositories.TaxRateFlatRepository;
import com.ttb.service.taxburden.repositories.TaxRateSetRepository;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.BDDMockito.given;

@RunWith(SpringRunner.class)
public class PayrollTaxFlatRateCalculatorTest {

	public static final String TEST_PAYROLL_TAX_ONE = "TEST_PAYROLL_TAX_ONE";

	private PayrollTaxFlatRateCalculator payrollTaxFlatRateCalculator;

	@MockBean
	private TaxRateFlatRepository mockTaxRateFlatRepository;

	@Before
	public void setup() {
		TaxRateEntity taxRateFlat = new TaxRateEntity(TEST_PAYROLL_TAX_ONE, BigDecimal.valueOf(0.05));
		ArrayList<TaxRateEntity> taxRateFlatList = new ArrayList<TaxRateEntity>();
		taxRateFlatList.add(taxRateFlat);
		given(this.mockTaxRateFlatRepository.findAll())
				.willReturn(taxRateFlatList);
	}
	
	@Test
	public void calculateTest() {
		payrollTaxFlatRateCalculator = new PayrollTaxFlatRateCalculator();
		payrollTaxFlatRateCalculator.setTaxRateFlatRepository(mockTaxRateFlatRepository);
		payrollTaxFlatRateCalculator.init();
		TaxBurdenReportEntity taxBurdenReport = new TaxBurdenReportEntity();
		PoliticalDivisionEntity politicalDivisionUS = new PoliticalDivisionEntity("US", "US", "United States", PoliticalDivisionType.FEDERAL);
		PoliticalDivisionEntity politicalDivisionGA = new PoliticalDivisionEntity("13", "GA", "Georgia", PoliticalDivisionType.STATE);
		PoliticalDivisionEntity politicalDivisionTestCity = new PoliticalDivisionEntity("9999999", "Test City", "Test City", PoliticalDivisionType.CITY);
		List<PoliticalDivisionEntity> politicalDivisions = new ArrayList<PoliticalDivisionEntity>();
		politicalDivisions.add(politicalDivisionUS);
		politicalDivisions.add(politicalDivisionGA);
		politicalDivisions.add(politicalDivisionTestCity);
		TaxDefinitionEntity taxDefinition = new TaxDefinitionEntity(TaxType.PAYROLL_CITY, politicalDivisionTestCity.getFips(), "payrollTaxFlatRateCalculator", TEST_PAYROLL_TAX_ONE, "test description", 1);

		TaxEntryEntity taxEntry = new TaxEntryEntity(TaxType.INCOME_FEDERAL, politicalDivisionUS, taxDefinition.getDescription(), new MonetaryAmountEntity(5000.00));
		taxBurdenReport.addTaxEntry(taxEntry);

		TaxPayerProfileEntity taxPayerProfile = new TaxPayerProfileEntity(politicalDivisions, new MonetaryAmountEntity(BigDecimal.valueOf(100000)), new MonetaryAmountEntity(BigDecimal.valueOf(0)),
				new MonetaryAmountEntity(BigDecimal.valueOf(200000)), TaxFilingStatus.JOINT, new MonetaryAmountEntity(BigDecimal.valueOf(15000)), new MonetaryAmountEntity(BigDecimal.valueOf(5000)), Integer.valueOf(3));
		MonetaryAmountEntity result = null;
		try {
			result = payrollTaxFlatRateCalculator.calculate(taxPayerProfile, politicalDivisionTestCity, taxDefinition, taxBurdenReport);
		} catch (TaxCalculationException e) {
			fail("Unexpected TaxCalculationException");
		}
		assertNotNull(result);
		assertEquals(5000, result.getAmount().longValue());
	}

}
