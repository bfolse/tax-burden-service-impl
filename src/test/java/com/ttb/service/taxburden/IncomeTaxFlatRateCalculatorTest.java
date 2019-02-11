package com.ttb.service.taxburden;

import com.ttb.service.taxburden.calculation.IncomeTaxFlatRateCalculator;
import com.ttb.service.taxburden.calculation.TaxCalculationException;
import com.ttb.service.taxburden.domain.PoliticalDivisionType;
import com.ttb.service.taxburden.domain.TaxFilingStatus;
import com.ttb.service.taxburden.domain.TaxType;
import com.ttb.service.taxburden.entities.*;
import com.ttb.service.taxburden.repositories.IncomeTaxDefinitionRepository;
import com.ttb.service.taxburden.repositories.TaxRateFlatRepository;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.BDDMockito.given;

@RunWith(SpringRunner.class)
public class IncomeTaxFlatRateCalculatorTest {

	private IncomeTaxFlatRateCalculator incomeTaxFlatRateCalculator;

	@MockBean
	IncomeTaxDefinitionRepository mockIncomeTaxDefinitionRepository;
	@MockBean
	private TaxRateFlatRepository mockTaxRateFlatRepository;
	
	@Before
	public void setup() {
		TaxRateEntity taxRateFlat = new TaxRateEntity("TEST", BigDecimal.valueOf(0.05));
		ArrayList<TaxRateEntity> taxRateFlatList = new ArrayList<TaxRateEntity>();
		taxRateFlatList.add(taxRateFlat);
        given(this.mockTaxRateFlatRepository.findAll())
        .willReturn(taxRateFlatList);

		// Setup IncomeTaxDefinition
		ArrayList<IncomeTaxDefinitionEntity> incomeTaxDefinitions = new ArrayList<IncomeTaxDefinitionEntity>();
		IncomeTaxDefinitionEntity incomeTaxDefinitionEntityOne = new IncomeTaxDefinitionEntity("TEST", Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), false, false);
		incomeTaxDefinitions.add(incomeTaxDefinitionEntityOne);
		given(this.mockIncomeTaxDefinitionRepository.findAll())
				.willReturn(incomeTaxDefinitions);

	}
	
	@Test
	public void calculateTest() {
		incomeTaxFlatRateCalculator = new IncomeTaxFlatRateCalculator();
		incomeTaxFlatRateCalculator.setTaxRateFlatRepository(mockTaxRateFlatRepository);
		incomeTaxFlatRateCalculator.setIncomeTaxDefinitionRepository(mockIncomeTaxDefinitionRepository);
		incomeTaxFlatRateCalculator.init();
		TaxBurdenReportEntity taxBurdenReport = new TaxBurdenReportEntity();
		PoliticalDivisionEntity politicalDivision = new PoliticalDivisionEntity("0", "US", "United States Federal", PoliticalDivisionType.FEDERAL);
		TaxEntryEntity taxEntry = new TaxEntryEntity(TaxType.INCOME_FEDERAL, politicalDivision, "test description", new MonetaryAmountEntity(5000.00));
		taxBurdenReport.addTaxEntry(taxEntry);
		List<PoliticalDivisionEntity> politicalDivisions = new ArrayList<>();
		politicalDivisions.add(politicalDivision);
		TaxPayerProfileEntity taxPayerProfile = new TaxPayerProfileEntity(politicalDivisions, new MonetaryAmountEntity(BigDecimal.valueOf(10000)), new MonetaryAmountEntity(BigDecimal.valueOf(4000)), new MonetaryAmountEntity(BigDecimal.valueOf(400000)), TaxFilingStatus.SINGLE, new MonetaryAmountEntity(BigDecimal.valueOf(0)), new MonetaryAmountEntity(BigDecimal.valueOf(0)), Integer.valueOf(0));
		TaxDefinitionEntity taxDefinition = new TaxDefinitionEntity(TaxType.INCOME_STATE, null, "incomeTaxFlatRateCalculator", "TEST", "test description", 1);
		MonetaryAmountEntity result = null;
		try {
			result = incomeTaxFlatRateCalculator.calculate(taxPayerProfile, null, taxDefinition, taxBurdenReport);
		} catch (TaxCalculationException e) {
			fail("Unexpected TaxCalculationException");
		}
		assertNotNull(result);
		assertEquals(500, result.getAmount().longValue());
	}
	
}
