package com.ttb.service.taxburden;

import com.ttb.service.taxburden.calculation.CapitalGainsTaxBracketedRateCalculator;
import com.ttb.service.taxburden.calculation.IncomeTaxBracketedMarginalRateCalculator;
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
public class CapitalGainsTaxBracketedRateCalculatorTest {

	public static final String TEST_CAPITAL_GAINS_TAX_ONE = "TEST_CAPITAL_GAINS_TAX_ONE";
	public static final String TEST_CAPITAL_GAINS_TAX_TWO = "TEST_CAPITAL_GAINS_TAX_TWO";
    public static final String TEST_CAPITAL_GAINS_TAX_THREE = "TEST_CAPITAL_GAINS_TAX_THREE";

	private CapitalGainsTaxBracketedRateCalculator capitalGainsTaxBracketedRateCalculator;

	@MockBean
	TaxRateSetRepository mockTaxRateSetRepository;

	@Before
	public void setup() {
		ArrayList<TaxRateSetEntity> taxRateSets = new ArrayList<TaxRateSetEntity>();

		// Setup TaxRateSet for default (NONE) TaxFilingStatus
		TaxRateEntity taxRateOne = new TaxRateEntity(TEST_CAPITAL_GAINS_TAX_ONE, BigDecimal.valueOf(0.00), BigInteger.valueOf(0), BigInteger.valueOf(39375));
		TaxRateEntity taxRateTwo = new TaxRateEntity(TEST_CAPITAL_GAINS_TAX_ONE, BigDecimal.valueOf(0.15), BigInteger.valueOf(39375), BigInteger.valueOf(434550));
		TaxRateEntity taxRateThree = new TaxRateEntity(TEST_CAPITAL_GAINS_TAX_ONE, BigDecimal.valueOf(0.20), BigInteger.valueOf(434550), null);
		ArrayList<TaxRateEntity> taxRateList = new ArrayList<TaxRateEntity>();
		taxRateList.add(taxRateOne);
		taxRateList.add(taxRateTwo);
		taxRateList.add(taxRateThree);
		TaxRateSetEntity taxRateSetEntity = new TaxRateSetEntity(TEST_CAPITAL_GAINS_TAX_ONE, taxRateList);
		taxRateSets.add(taxRateSetEntity);

		// Setup TaxRateSet for multiple TaxFilingStatus
		TaxRateEntity taxRateOneSINGLE = new TaxRateEntity(TEST_CAPITAL_GAINS_TAX_TWO, BigDecimal.valueOf(0.00), BigInteger.valueOf(0), BigInteger.valueOf(39375));
		TaxRateEntity taxRateTwoSINGLE = new TaxRateEntity(TEST_CAPITAL_GAINS_TAX_TWO, BigDecimal.valueOf(0.15), BigInteger.valueOf(39375), BigInteger.valueOf(434550));
		TaxRateEntity taxRateThreeSINGLE = new TaxRateEntity(TEST_CAPITAL_GAINS_TAX_TWO, BigDecimal.valueOf(0.20), BigInteger.valueOf(434550), null);
		ArrayList<TaxRateEntity> taxRateListSINGLE = new ArrayList<TaxRateEntity>();
		taxRateListSINGLE.add(taxRateOneSINGLE);
		taxRateListSINGLE.add(taxRateTwoSINGLE);
		taxRateListSINGLE.add(taxRateThreeSINGLE);
		TaxRateSetEntity taxRateSetSINGLE = new TaxRateSetEntity(TEST_CAPITAL_GAINS_TAX_TWO, TaxFilingStatus.SINGLE, taxRateListSINGLE);
		taxRateSets.add(taxRateSetSINGLE);

		TaxRateEntity taxRateOneJOINT = new TaxRateEntity(TEST_CAPITAL_GAINS_TAX_TWO, BigDecimal.valueOf(0.00), BigInteger.valueOf(0), BigInteger.valueOf(78750));
		TaxRateEntity taxRateTwoJOINT = new TaxRateEntity(TEST_CAPITAL_GAINS_TAX_TWO, BigDecimal.valueOf(0.15), BigInteger.valueOf(78750), BigInteger.valueOf(488850));
		TaxRateEntity taxRateThreeJOINT = new TaxRateEntity(TEST_CAPITAL_GAINS_TAX_TWO, BigDecimal.valueOf(0.20), BigInteger.valueOf(488850), null);
		ArrayList<TaxRateEntity> taxRateListJOINT = new ArrayList<TaxRateEntity>();
		taxRateListJOINT.add(taxRateOneJOINT);
		taxRateListJOINT.add(taxRateTwoJOINT);
		taxRateListJOINT.add(taxRateThreeJOINT);
		TaxRateSetEntity taxRateSetJOINT = new TaxRateSetEntity(TEST_CAPITAL_GAINS_TAX_TWO, TaxFilingStatus.JOINT, taxRateListJOINT);
		taxRateSets.add(taxRateSetJOINT);

        TaxRateEntity taxRateOneHOH = new TaxRateEntity(TEST_CAPITAL_GAINS_TAX_THREE, BigDecimal.valueOf(0.00), BigInteger.valueOf(0), BigInteger.valueOf(52750));
        TaxRateEntity taxRateTwoHOH = new TaxRateEntity(TEST_CAPITAL_GAINS_TAX_THREE, BigDecimal.valueOf(0.15), BigInteger.valueOf(52750), BigInteger.valueOf(461700));
        TaxRateEntity taxRateThreeHOH = new TaxRateEntity(TEST_CAPITAL_GAINS_TAX_THREE, BigDecimal.valueOf(0.20), BigInteger.valueOf(461700), null);
        ArrayList<TaxRateEntity> taxRateListHOH = new ArrayList<TaxRateEntity>();
        taxRateListHOH.add(taxRateOneHOH);
        taxRateListHOH.add(taxRateTwoHOH);
        taxRateListHOH.add(taxRateThreeHOH);
        TaxRateSetEntity taxRateSetHOH = new TaxRateSetEntity(TEST_CAPITAL_GAINS_TAX_THREE, TaxFilingStatus.NONE, taxRateListHOH);
        taxRateSets.add(taxRateSetHOH);

        given(this.mockTaxRateSetRepository.findAll())
				.willReturn(taxRateSets);
	}
	
	@Test
	public void calculateDefaultTaxFilingStatusTest() {
		capitalGainsTaxBracketedRateCalculator = new CapitalGainsTaxBracketedRateCalculator();
		capitalGainsTaxBracketedRateCalculator.setTaxRateSetRepository(mockTaxRateSetRepository);
		capitalGainsTaxBracketedRateCalculator.init();
		TaxBurdenReportEntity taxBurdenReport = new TaxBurdenReportEntity();
		PoliticalDivisionEntity politicalDivisionUS = new PoliticalDivisionEntity("US", "US", "United States", PoliticalDivisionType.FEDERAL);
		List<PoliticalDivisionEntity> politicalDivisions = new ArrayList<PoliticalDivisionEntity>();
		politicalDivisions.add(politicalDivisionUS);
		TaxDefinitionEntity taxDefinition = new TaxDefinitionEntity(TaxType.CAPITAL_GAINS_FEDERAL, politicalDivisionUS.getFips(), "capitalGainsTaxBracketedRateCalculator", TEST_CAPITAL_GAINS_TAX_ONE, "test description", 1);

		taxBurdenReport.setTaxableIncome(BigDecimal.valueOf(75000));

		TaxPayerProfileEntity taxPayerProfile = new TaxPayerProfileEntity(politicalDivisions, new MonetaryAmountEntity(BigDecimal.valueOf(100000)), new MonetaryAmountEntity(BigDecimal.valueOf(0)),
				new MonetaryAmountEntity(BigDecimal.valueOf(200000)), TaxFilingStatus.JOINT, new MonetaryAmountEntity(BigDecimal.valueOf(15000)), new MonetaryAmountEntity(BigDecimal.valueOf(5000)), Integer.valueOf(3));
		taxPayerProfile.setCapitalGainsIncome(new MonetaryAmountEntity(BigDecimal.valueOf(10000)));
		MonetaryAmountEntity result = null;
		try {
			result = capitalGainsTaxBracketedRateCalculator.calculate(taxPayerProfile, politicalDivisionUS, taxDefinition, taxBurdenReport);
		} catch (TaxCalculationException e) {
			fail("Unexpected TaxCalculationException");
		}
		assertNotNull(result);
		assertEquals(1500, result.getAmount().longValue());
	}

	@Test
	public void calculateJointTaxFilingStatusTest() {
		capitalGainsTaxBracketedRateCalculator = new CapitalGainsTaxBracketedRateCalculator();
		capitalGainsTaxBracketedRateCalculator.setTaxRateSetRepository(mockTaxRateSetRepository);
		capitalGainsTaxBracketedRateCalculator.init();
		TaxBurdenReportEntity taxBurdenReport = new TaxBurdenReportEntity();
		PoliticalDivisionEntity politicalDivisionUS = new PoliticalDivisionEntity("US", "US", "United States", PoliticalDivisionType.FEDERAL);
		List<PoliticalDivisionEntity> politicalDivisions = new ArrayList<PoliticalDivisionEntity>();
		politicalDivisions.add(politicalDivisionUS);
		TaxDefinitionEntity taxDefinition = new TaxDefinitionEntity(TaxType.CAPITAL_GAINS_FEDERAL, politicalDivisionUS.getFips(), "capitalGainsTaxBracketedRateCalculator", TEST_CAPITAL_GAINS_TAX_TWO, "test description", 1);

		taxBurdenReport.setTaxableIncome(BigDecimal.valueOf(488850));
		TaxPayerProfileEntity taxPayerProfile = new TaxPayerProfileEntity(politicalDivisions, new MonetaryAmountEntity(BigDecimal.valueOf(100000)), new MonetaryAmountEntity(BigDecimal.valueOf(0)),
				new MonetaryAmountEntity(BigDecimal.valueOf(200000)), TaxFilingStatus.JOINT, new MonetaryAmountEntity(BigDecimal.valueOf(15000)), new MonetaryAmountEntity(BigDecimal.valueOf(5000)), Integer.valueOf(3));
		taxPayerProfile.setCapitalGainsIncome(new MonetaryAmountEntity(BigDecimal.valueOf(100000)));
		MonetaryAmountEntity result = null;
		try {
			result = capitalGainsTaxBracketedRateCalculator.calculate(taxPayerProfile, politicalDivisionUS, taxDefinition, taxBurdenReport);
		} catch (TaxCalculationException e) {
			fail("Unexpected TaxCalculationException");
		}
		assertNotNull(result);
		assertEquals(20000, result.getAmount().longValue());
	}
}
