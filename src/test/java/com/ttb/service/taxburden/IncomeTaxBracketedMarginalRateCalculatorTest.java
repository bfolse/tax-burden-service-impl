package com.ttb.service.taxburden;

import com.ttb.service.taxburden.calculation.IncomeTaxBracketedMarginalRateCalculator;
import com.ttb.service.taxburden.calculation.TaxCalculationException;
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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;
import static org.mockito.BDDMockito.given;

@RunWith(SpringRunner.class)
public class IncomeTaxBracketedMarginalRateCalculatorTest {

	public static final String TEST_INCOME_TAX_ONE = "TEST_PAYROLL_TAX_ONE";
	public static final String TEST_INCOME_TAX_TWO = "TEST_PAYROLL_TAX_TWO";

	private IncomeTaxBracketedMarginalRateCalculator incomeTaxBracketedMarginalRateCalculator;

	@MockBean
	TaxRateSetRepository mockTaxRateSetRepository;
	@MockBean
	IncomeTaxDefinitionRepository mockIncomeTaxDefinitionRepository;

	@Before
	public void setup() {
		ArrayList<TaxRateSetEntity> taxRateSets = new ArrayList<TaxRateSetEntity>();

		// Setup TaxRateSet for default (NONE) TaxFilingStatus
		TaxRateEntity taxRateOne = new TaxRateEntity(TEST_INCOME_TAX_ONE, BigDecimal.valueOf(0.05), BigInteger.valueOf(0), BigInteger.valueOf(10000));
		TaxRateEntity taxRateTwo = new TaxRateEntity(TEST_INCOME_TAX_ONE, BigDecimal.valueOf(0.10), BigInteger.valueOf(10000), BigInteger.valueOf(40000));
		TaxRateEntity taxRateThree = new TaxRateEntity(TEST_INCOME_TAX_ONE, BigDecimal.valueOf(0.15), BigInteger.valueOf(40000), BigInteger.valueOf(60000));
		TaxRateEntity taxRateFour = new TaxRateEntity(TEST_INCOME_TAX_ONE, BigDecimal.valueOf(0.20), BigInteger.valueOf(60000), BigInteger.valueOf(100000));
		TaxRateEntity taxRateFive = new TaxRateEntity(TEST_INCOME_TAX_ONE, BigDecimal.valueOf(0.30), BigInteger.valueOf(100000), BigInteger.valueOf(150000));
		TaxRateEntity taxRateSix = new TaxRateEntity(TEST_INCOME_TAX_ONE, BigDecimal.valueOf(0.35), BigInteger.valueOf(150000), null);
		ArrayList<TaxRateEntity> taxRateList = new ArrayList<TaxRateEntity>();
		taxRateList.add(taxRateOne);
		taxRateList.add(taxRateTwo);
		taxRateList.add(taxRateThree);
		taxRateList.add(taxRateFour);
		taxRateList.add(taxRateFive);
		taxRateList.add(taxRateSix);
		TaxRateSetEntity taxRateSetEntity = new TaxRateSetEntity(TEST_INCOME_TAX_ONE, taxRateList);
		taxRateSets.add(taxRateSetEntity);

		// Setup TaxRateSet for multiple TaxFilingStatus
		TaxRateEntity taxRateOneSINGLE = new TaxRateEntity(TEST_INCOME_TAX_TWO, BigDecimal.valueOf(0.05), BigInteger.valueOf(0), BigInteger.valueOf(10000));
		TaxRateEntity taxRateTwoSINGLE = new TaxRateEntity(TEST_INCOME_TAX_TWO, BigDecimal.valueOf(0.10), BigInteger.valueOf(10000), BigInteger.valueOf(40000));
		TaxRateEntity taxRateThreeSINGLE = new TaxRateEntity(TEST_INCOME_TAX_TWO, BigDecimal.valueOf(0.15), BigInteger.valueOf(40000), BigInteger.valueOf(60000));
		TaxRateEntity taxRateFourSINGLE = new TaxRateEntity(TEST_INCOME_TAX_TWO, BigDecimal.valueOf(0.20), BigInteger.valueOf(60000), BigInteger.valueOf(100000));
		TaxRateEntity taxRateFiveSINGLE = new TaxRateEntity(TEST_INCOME_TAX_TWO, BigDecimal.valueOf(0.30), BigInteger.valueOf(100000), BigInteger.valueOf(150000));
		TaxRateEntity taxRateSixSINGLE = new TaxRateEntity(TEST_INCOME_TAX_TWO, BigDecimal.valueOf(0.35), BigInteger.valueOf(150000), null);
		ArrayList<TaxRateEntity> taxRateListSINGLE = new ArrayList<TaxRateEntity>();
		taxRateListSINGLE.add(taxRateOneSINGLE);
		taxRateListSINGLE.add(taxRateTwoSINGLE);
		taxRateListSINGLE.add(taxRateThreeSINGLE);
		taxRateListSINGLE.add(taxRateFourSINGLE);
		taxRateListSINGLE.add(taxRateFiveSINGLE);
		taxRateListSINGLE.add(taxRateSixSINGLE);
		TaxRateSetEntity taxRateSetSINGLE = new TaxRateSetEntity(TEST_INCOME_TAX_TWO, TaxFilingStatus.SINGLE, taxRateListSINGLE);
		taxRateSets.add(taxRateSetSINGLE);

		TaxRateEntity taxRateOneJOINT = new TaxRateEntity(TEST_INCOME_TAX_TWO, BigDecimal.valueOf(0.05), BigInteger.valueOf(0), BigInteger.valueOf(15000));
		TaxRateEntity taxRateTwoJOINT = new TaxRateEntity(TEST_INCOME_TAX_TWO, BigDecimal.valueOf(0.10), BigInteger.valueOf(15000), BigInteger.valueOf(40000));
		TaxRateEntity taxRateThreeJOINT = new TaxRateEntity(TEST_INCOME_TAX_TWO, BigDecimal.valueOf(0.15), BigInteger.valueOf(40000), BigInteger.valueOf(70000));
		TaxRateEntity taxRateFourJOINT = new TaxRateEntity(TEST_INCOME_TAX_TWO, BigDecimal.valueOf(0.20), BigInteger.valueOf(70000), BigInteger.valueOf(160000));
		TaxRateEntity taxRateFiveJOINT = new TaxRateEntity(TEST_INCOME_TAX_TWO, BigDecimal.valueOf(0.30), BigInteger.valueOf(160000), BigInteger.valueOf(250000));
		TaxRateEntity taxRateSixJOINT = new TaxRateEntity(TEST_INCOME_TAX_TWO, BigDecimal.valueOf(0.35), BigInteger.valueOf(250000), null);
		ArrayList<TaxRateEntity> taxRateListJOINT = new ArrayList<TaxRateEntity>();
		taxRateListJOINT.add(taxRateOneJOINT);
		taxRateListJOINT.add(taxRateTwoJOINT);
		taxRateListJOINT.add(taxRateThreeJOINT);
		taxRateListJOINT.add(taxRateFourJOINT);
		taxRateListJOINT.add(taxRateFiveJOINT);
		taxRateListJOINT.add(taxRateSixJOINT);
		TaxRateSetEntity taxRateSetJOINT = new TaxRateSetEntity(TEST_INCOME_TAX_TWO, TaxFilingStatus.JOINT, taxRateListJOINT);
		taxRateSets.add(taxRateSetJOINT);

        given(this.mockTaxRateSetRepository.findAll())
				.willReturn(taxRateSets);

        // Setup IncomeTaxDefinition
		ArrayList<IncomeTaxDefinitionEntity> incomeTaxDefinitions = new ArrayList<IncomeTaxDefinitionEntity>();
		IncomeTaxDefinitionEntity incomeTaxDefinitionEntityOne = new IncomeTaxDefinitionEntity(TEST_INCOME_TAX_ONE, Integer.valueOf(2000), Integer.valueOf(3000), Integer.valueOf(1000), Integer.valueOf(2000), Integer.valueOf(3000));
		incomeTaxDefinitions.add(incomeTaxDefinitionEntityOne);
		IncomeTaxDefinitionEntity incomeTaxDefinitionEntityTwo = new IncomeTaxDefinitionEntity(TEST_INCOME_TAX_TWO, Integer.valueOf(2000), Integer.valueOf(3000), Integer.valueOf(1000), Integer.valueOf(2000), Integer.valueOf(3000));
		incomeTaxDefinitions.add(incomeTaxDefinitionEntityTwo);
		given(this.mockIncomeTaxDefinitionRepository.findAll())
				.willReturn(incomeTaxDefinitions);
	}
	
	@Test
	public void calculateDefaultTaxFilingStatusTest() {
		incomeTaxBracketedMarginalRateCalculator = new IncomeTaxBracketedMarginalRateCalculator();
		incomeTaxBracketedMarginalRateCalculator.setTaxRateSetRepository(mockTaxRateSetRepository);
		incomeTaxBracketedMarginalRateCalculator.setIncomeTaxDefinitionRepository(mockIncomeTaxDefinitionRepository);
		incomeTaxBracketedMarginalRateCalculator.init();
		TaxBurdenReportEntity taxBurdenReport = new TaxBurdenReportEntity();
		PoliticalDivisionEntity politicalDivisionUS = new PoliticalDivisionEntity("US", "US", "United States", "FEDERAL");
		PoliticalDivisionEntity politicalDivisionGA = new PoliticalDivisionEntity("13", "GA", "Georgia", "STATE");
		List<PoliticalDivisionEntity> politicalDivisions = new ArrayList<PoliticalDivisionEntity>();
		politicalDivisions.add(politicalDivisionUS);
		politicalDivisions.add(politicalDivisionGA);
		TaxDefinitionEntity taxDefinition = new TaxDefinitionEntity(TaxType.INCOME_STATE, politicalDivisionGA.getFips(), "incomeTaxBracketedMarginalRateCalculator", TEST_INCOME_TAX_ONE, "test description", 1);

		TaxEntryEntity taxEntry = new TaxEntryEntity(TaxType.INCOME_FEDERAL, politicalDivisionUS, new MonetaryAmountEntity(5000.00));
		taxBurdenReport.addTaxEntry(taxEntry);

		TaxPayerProfileEntity taxPayerProfile = new TaxPayerProfileEntity("30306", politicalDivisions, new MonetaryAmountEntity(BigDecimal.valueOf(100000)), new MonetaryAmountEntity(BigDecimal.valueOf(0)),
				new MonetaryAmountEntity(BigDecimal.valueOf(200000)), TaxFilingStatus.JOINT, new MonetaryAmountEntity(BigDecimal.valueOf(15000)), new MonetaryAmountEntity(BigDecimal.valueOf(5000)), Integer.valueOf(3));
		MonetaryAmountEntity result = null;
		try {
			result = incomeTaxBracketedMarginalRateCalculator.calculate(taxPayerProfile, politicalDivisionGA, taxDefinition, taxBurdenReport);
		} catch (TaxCalculationException e) {
			fail("Unexpected TaxCalculationException");
		}
		assertNotNull(result);
		assertEquals(11700, result.getAmount().longValue());
	}

	@Test
	public void calculateJointTaxFilingStatusTest() {
		incomeTaxBracketedMarginalRateCalculator = new IncomeTaxBracketedMarginalRateCalculator();
		incomeTaxBracketedMarginalRateCalculator.setTaxRateSetRepository(mockTaxRateSetRepository);
		incomeTaxBracketedMarginalRateCalculator.setIncomeTaxDefinitionRepository(mockIncomeTaxDefinitionRepository);
		incomeTaxBracketedMarginalRateCalculator.init();
		TaxBurdenReportEntity taxBurdenReport = new TaxBurdenReportEntity();
		PoliticalDivisionEntity politicalDivisionUS = new PoliticalDivisionEntity("US", "US", "United States", "FEDERAL");
		PoliticalDivisionEntity politicalDivisionGA = new PoliticalDivisionEntity("13", "GA", "Georgia", "STATE");
		List<PoliticalDivisionEntity> politicalDivisions = new ArrayList<PoliticalDivisionEntity>();
		politicalDivisions.add(politicalDivisionUS);
		politicalDivisions.add(politicalDivisionGA);
		TaxDefinitionEntity taxDefinition = new TaxDefinitionEntity(TaxType.INCOME_STATE, politicalDivisionGA.getFips(), "incomeTaxBracketedMarginalRateCalculator", TEST_INCOME_TAX_TWO, "test description", 1);

		TaxEntryEntity taxEntry = new TaxEntryEntity(TaxType.INCOME_FEDERAL, politicalDivisionUS, new MonetaryAmountEntity(5000.00));
		taxBurdenReport.addTaxEntry(taxEntry);

		TaxPayerProfileEntity taxPayerProfile = new TaxPayerProfileEntity("30306", politicalDivisions, new MonetaryAmountEntity(BigDecimal.valueOf(100000)), new MonetaryAmountEntity(BigDecimal.valueOf(0)),
				new MonetaryAmountEntity(BigDecimal.valueOf(200000)), TaxFilingStatus.JOINT, new MonetaryAmountEntity(BigDecimal.valueOf(15000)), new MonetaryAmountEntity(BigDecimal.valueOf(5000)), Integer.valueOf(3));
		MonetaryAmountEntity result = null;
		try {
			result = incomeTaxBracketedMarginalRateCalculator.calculate(taxPayerProfile, politicalDivisionGA, taxDefinition, taxBurdenReport);
		} catch (TaxCalculationException e) {
			fail("Unexpected TaxCalculationException");
		}
		assertNotNull(result);
		assertEquals(10950, result.getAmount().longValue());
	}
}
