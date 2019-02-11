package com.ttb.service.taxburden;

import com.ttb.service.taxburden.calculation.PayrollTaxBracketedMarginalRateCalculator;
import com.ttb.service.taxburden.calculation.TaxCalculationException;
import com.ttb.service.taxburden.domain.PoliticalDivisionType;
import com.ttb.service.taxburden.domain.TaxFilingStatus;
import com.ttb.service.taxburden.domain.TaxType;
import com.ttb.service.taxburden.entities.*;
import com.ttb.service.taxburden.repositories.IncomeTaxDefinitionRepository;
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
public class PayrollTaxBracketedMarginalRateCalculatorTest {

	public static final String TEST_PAYROLL_TAX_ONE = "TEST_PAYROLL_TAX_ONE";
	public static final String TEST_PAYROLL_TAX_TWO = "TEST_PAYROLL_TAX_TWO";

	private PayrollTaxBracketedMarginalRateCalculator payrollTaxBracketedMarginalRateCalculator;

	@MockBean
	TaxRateSetRepository mockTaxRateSetRepository;
	@MockBean
	IncomeTaxDefinitionRepository mockIncomeTaxDefinitionRepository;

	@Before
	public void setup() {
		ArrayList<TaxRateSetEntity> taxRateSets = new ArrayList<TaxRateSetEntity>();

		// Setup TaxRateSet for default (NONE) TaxFilingStatus
		TaxRateEntity taxRateOne = new TaxRateEntity(TEST_PAYROLL_TAX_ONE, BigDecimal.valueOf(0.062), BigInteger.valueOf(0), BigInteger.valueOf(127200));
		ArrayList<TaxRateEntity> taxRateList = new ArrayList<TaxRateEntity>();
		taxRateList.add(taxRateOne);
		TaxRateSetEntity taxRateSetEntity = new TaxRateSetEntity(TEST_PAYROLL_TAX_ONE, taxRateList);
		taxRateSets.add(taxRateSetEntity);

		// Setup TaxRateSet for multiple TaxFilingStatus
		TaxRateEntity taxRateOneSINGLE = new TaxRateEntity(TEST_PAYROLL_TAX_TWO, BigDecimal.valueOf(0.062), BigInteger.valueOf(0), BigInteger.valueOf(127200));
		ArrayList<TaxRateEntity> taxRateListSINGLE = new ArrayList<TaxRateEntity>();
		taxRateListSINGLE.add(taxRateOneSINGLE);
		TaxRateSetEntity taxRateSetSINGLE = new TaxRateSetEntity(TEST_PAYROLL_TAX_TWO, TaxFilingStatus.SINGLE, taxRateListSINGLE);
		taxRateSets.add(taxRateSetSINGLE);

		TaxRateEntity taxRateOneJOINT = new TaxRateEntity(TEST_PAYROLL_TAX_TWO, BigDecimal.valueOf(0.05), BigInteger.valueOf(0), BigInteger.valueOf(15000));
		TaxRateEntity taxRateTwoJOINT = new TaxRateEntity(TEST_PAYROLL_TAX_TWO, BigDecimal.valueOf(0.10), BigInteger.valueOf(15000), BigInteger.valueOf(127200));
		ArrayList<TaxRateEntity> taxRateListJOINT = new ArrayList<TaxRateEntity>();
		taxRateListJOINT.add(taxRateOneJOINT);
		taxRateListJOINT.add(taxRateTwoJOINT);
		TaxRateSetEntity taxRateSetJOINT = new TaxRateSetEntity(TEST_PAYROLL_TAX_TWO, TaxFilingStatus.JOINT, taxRateListJOINT);
		taxRateSets.add(taxRateSetJOINT);

        given(this.mockTaxRateSetRepository.findAll())
				.willReturn(taxRateSets);
	}
	
	@Test
	public void calculateDefaultTaxFilingStatusTest() {
		payrollTaxBracketedMarginalRateCalculator = new PayrollTaxBracketedMarginalRateCalculator();
		payrollTaxBracketedMarginalRateCalculator.setTaxRateSetRepository(mockTaxRateSetRepository);
		payrollTaxBracketedMarginalRateCalculator.init();
		TaxBurdenReportEntity taxBurdenReport = new TaxBurdenReportEntity();
		PoliticalDivisionEntity politicalDivisionUS = new PoliticalDivisionEntity("US", "US", "United States", PoliticalDivisionType.FEDERAL);
		PoliticalDivisionEntity politicalDivisionGA = new PoliticalDivisionEntity("13", "GA", "Georgia", PoliticalDivisionType.STATE);
		List<PoliticalDivisionEntity> politicalDivisions = new ArrayList<PoliticalDivisionEntity>();
		politicalDivisions.add(politicalDivisionUS);
		politicalDivisions.add(politicalDivisionGA);
		TaxDefinitionEntity taxDefinition = new TaxDefinitionEntity(TaxType.INCOME_STATE, politicalDivisionGA.getFips(), "payrollTaxBracketedMarginalRateCalculator", TEST_PAYROLL_TAX_ONE, "test description", 1);

		TaxEntryEntity taxEntry = new TaxEntryEntity(TaxType.INCOME_FEDERAL, politicalDivisionUS, taxDefinition.getDescription(), new MonetaryAmountEntity(5000.00));
		taxBurdenReport.addTaxEntry(taxEntry);

		TaxPayerProfileEntity taxPayerProfile = new TaxPayerProfileEntity(politicalDivisions, new MonetaryAmountEntity(BigDecimal.valueOf(100000)), new MonetaryAmountEntity(BigDecimal.valueOf(0)),
				new MonetaryAmountEntity(BigDecimal.valueOf(200000)), TaxFilingStatus.JOINT, new MonetaryAmountEntity(BigDecimal.valueOf(15000)), new MonetaryAmountEntity(BigDecimal.valueOf(5000)), Integer.valueOf(3));
		MonetaryAmountEntity result = null;
		try {
			result = payrollTaxBracketedMarginalRateCalculator.calculate(taxPayerProfile, politicalDivisionGA, taxDefinition, taxBurdenReport);
		} catch (TaxCalculationException e) {
			fail("Unexpected TaxCalculationException");
		}
		assertNotNull(result);
		assertEquals(6200, result.getAmount().longValue());
	}

	@Test
	public void calculateJointTaxFilingStatusTest() {
		payrollTaxBracketedMarginalRateCalculator = new PayrollTaxBracketedMarginalRateCalculator();
		payrollTaxBracketedMarginalRateCalculator.setTaxRateSetRepository(mockTaxRateSetRepository);
		payrollTaxBracketedMarginalRateCalculator.init();
		TaxBurdenReportEntity taxBurdenReport = new TaxBurdenReportEntity();
		PoliticalDivisionEntity politicalDivisionUS = new PoliticalDivisionEntity("US", "US", "United States", PoliticalDivisionType.FEDERAL);
		PoliticalDivisionEntity politicalDivisionGA = new PoliticalDivisionEntity("13", "GA", "Georgia", PoliticalDivisionType.STATE);
		List<PoliticalDivisionEntity> politicalDivisions = new ArrayList<PoliticalDivisionEntity>();
		politicalDivisions.add(politicalDivisionUS);
		politicalDivisions.add(politicalDivisionGA);
		TaxDefinitionEntity taxDefinition = new TaxDefinitionEntity(TaxType.INCOME_STATE, politicalDivisionGA.getFips(), "payrollTaxBracketedMarginalRateCalculator", TEST_PAYROLL_TAX_TWO, "test description", 1);

		TaxEntryEntity taxEntry = new TaxEntryEntity(TaxType.INCOME_FEDERAL, politicalDivisionUS, taxDefinition.getDescription(), new MonetaryAmountEntity(5000.00));
		taxBurdenReport.addTaxEntry(taxEntry);

		TaxPayerProfileEntity taxPayerProfile = new TaxPayerProfileEntity(politicalDivisions, new MonetaryAmountEntity(BigDecimal.valueOf(100000)), new MonetaryAmountEntity(BigDecimal.valueOf(0)),
				new MonetaryAmountEntity(BigDecimal.valueOf(200000)), TaxFilingStatus.JOINT, new MonetaryAmountEntity(BigDecimal.valueOf(15000)), new MonetaryAmountEntity(BigDecimal.valueOf(5000)), Integer.valueOf(3));
		MonetaryAmountEntity result = null;
		try {
			result = payrollTaxBracketedMarginalRateCalculator.calculate(taxPayerProfile, politicalDivisionGA, taxDefinition, taxBurdenReport);
		} catch (TaxCalculationException e) {
			fail("Unexpected TaxCalculationException");
		}
		assertNotNull(result);
		assertEquals(9250, result.getAmount().longValue());
	}
}
