package com.ttb.service.taxburden;

import com.ttb.service.taxburden.calculation.FuelTaxCalculator;
import com.ttb.service.taxburden.calculation.IncomeTaxFlatRateCalculator;
import com.ttb.service.taxburden.domain.TaxType;
import com.ttb.service.taxburden.entities.*;
import com.ttb.service.taxburden.repositories.ConsumerExpenditureProfileRepository;
import com.ttb.service.taxburden.repositories.TaxRateFlatRepository;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.math.MathContext;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.BDDMockito.given;

@RunWith(SpringRunner.class)
public class FuelTaxCalculatorTest {

	private FuelTaxCalculator fuelTaxCalculator;
	
	@MockBean
	private TaxRateFlatRepository mockTaxRateFlatRepository;
	@MockBean
	private ConsumerExpenditureProfileRepository mockConsumerExpenditureProfileRepository;

	@Before
	public void setup() {
		// mockTaxRateFlatRepository
		// set tax per gallon
		TaxRateEntity taxRate = new TaxRateEntity("TEST", new BigDecimal(0.184, MathContext.DECIMAL32));
		ArrayList<TaxRateEntity> taxRateList = new ArrayList<TaxRateEntity>();
		taxRateList.add(taxRate);
        given(this.mockTaxRateFlatRepository.findAll())
        		.willReturn(taxRateList);

        // mockConsumerExpenditureProfileRepository
		Map<String, BigDecimal> consumerExpenditureProfileEntries = new HashMap<String, BigDecimal>();
		// set percentage of annual income spent on fuel
		consumerExpenditureProfileEntries.put(FuelTaxCalculator.TRANSPORTATION_FUEL, new BigDecimal(0.037, MathContext.DECIMAL32));
		ConsumerExpenditureProfileEntity cepe = new ConsumerExpenditureProfileEntity("testKey", "test description",
				consumerExpenditureProfileEntries);
		given(this.mockConsumerExpenditureProfileRepository.findByConsumerExpenditureProfileKey("testKey"))
				.willReturn(cepe);
	}
	
	@Test
	public void calculateTest() {
		fuelTaxCalculator = new FuelTaxCalculator();
		fuelTaxCalculator.setTaxRateFlatRepository(mockTaxRateFlatRepository);
		fuelTaxCalculator.setConsumerExpenditureProfileRepository(mockConsumerExpenditureProfileRepository);
		fuelTaxCalculator.init();
		TaxBurdenReportEntity taxBurdenReport = new TaxBurdenReportEntity();
		PoliticalDivisionEntity politicalDivision = new PoliticalDivisionEntity("0", "US", "United States", "FEDERAL");
		List<PoliticalDivisionEntity> politicalDivisions = new ArrayList<PoliticalDivisionEntity>();
		politicalDivisions.add(politicalDivision);
		TaxEntryEntity taxEntry = new TaxEntryEntity(TaxType.INCOME_FEDERAL, politicalDivision, new MonetaryAmountEntity(0.00));
		taxBurdenReport.addTaxEntry(taxEntry);
		TaxPayerProfileEntity taxPayerProfile = new TaxPayerProfileEntity("30306", politicalDivisions, new MonetaryAmountEntity(BigDecimal.valueOf(100000)), new MonetaryAmountEntity(BigDecimal.valueOf(0)),"testKey");
		TaxDefinitionEntity taxDefinition = new TaxDefinitionEntity(TaxType.FUEL_FEDERAL, "0", "fuelTaxCalculator", "TEST", "test description", 1);
		MonetaryAmountEntity result = fuelTaxCalculator.calculate(taxPayerProfile, null, taxDefinition, taxBurdenReport);
		assertNotNull(result);
		assertEquals(BigDecimal.valueOf(266.98), result.getAmount());
	}
	
}
