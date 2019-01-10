package com.ttb.service.taxburden.calculation;

import com.ttb.service.taxburden.entities.*;
import com.ttb.service.taxburden.repositories.ConsumerExpenditureProfileRepository;
import com.ttb.service.taxburden.repositories.TaxRateFlatRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.Map;

@Component
public class FuelTaxCalculator implements TaxCalculator {
	private static final Logger logger = LoggerFactory.getLogger(FuelTaxCalculator.class);

	@Autowired
	TaxRateFlatRepository taxRateFlatRepository;

	@Autowired
	ConsumerExpenditureProfileRepository consumerExpenditureProfileRepository;

	public static String TRANSPORTATION_FUEL = "TRANSPORTATION_FUEL";

	// TODO Make this dynamic !!
	private static BigDecimal AVERAGE_FUEL_PRICE_PER_GALLON = new BigDecimal(2.55, MathContext.DECIMAL32);

	Map<String, BigDecimal> taxRates;

	public FuelTaxCalculator() {
		super();
	}

	@PostConstruct
	public void init() {
		taxRates = new HashMap<String, BigDecimal>();
		Iterable<TaxRateEntity> taxRateFlatIterable = taxRateFlatRepository.findAll();
		for (TaxRateEntity taxRateFlat : taxRateFlatIterable) {
			if (taxRateFlat != null) {
				taxRates.put(taxRateFlat.getTaxDefinitionKey(), taxRateFlat.getRate());
			}
		}
	}
	
	@Override
	public MonetaryAmountEntity calculate(TaxPayerProfileEntity taxPayerProfile, PoliticalDivisionEntity politicalDivision, TaxDefinitionEntity taxDefinition, TaxBurdenReportEntity taxBurdenReport) {
		logger.debug("Begin tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition);
		BigDecimal taxPerGallon = taxRates.get(taxDefinition.getTaxDefinitionKey());
		
		BigDecimal adjustedGrossIncome = TaxCalculatorUtils.calculateAdjustedGrossIncome(taxPayerProfile, taxBurdenReport);
		// Get consumer expenditure profile
		ConsumerExpenditureProfileEntity consumerExpenditureProfile = consumerExpenditureProfileRepository.findByConsumerExpenditureProfileKey(taxPayerProfile.getConsumerExpenditureProfileKey());
		// Calculate fuel expenditure
		BigDecimal fuelExpenditure = consumerExpenditureProfile.getConsumerExpenditureProfileEntries().get(TRANSPORTATION_FUEL).multiply(adjustedGrossIncome);
		// Determine gallons of fuel used based on fuel expenditure and fuel price per gallon
		BigDecimal gallons = fuelExpenditure.divide(AVERAGE_FUEL_PRICE_PER_GALLON, MathContext.DECIMAL32);
		BigDecimal calculatedTax = gallons.multiply(taxPerGallon, MathContext.DECIMAL32).setScale(2, RoundingMode.HALF_UP);
		MonetaryAmountEntity returnTax = new MonetaryAmountEntity(taxPayerProfile.getAnnualIncome().getCurrency(), calculatedTax);
		logger.debug("End tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition + " returnTax: " + returnTax);
		return returnTax;
	}

	/**
	 * @param taxRateFlatRepository the taxRateFlatRepository to set
	 */
	public void setTaxRateFlatRepository(TaxRateFlatRepository taxRateFlatRepository) {
		this.taxRateFlatRepository = taxRateFlatRepository;
	}

	public void setConsumerExpenditureProfileRepository(ConsumerExpenditureProfileRepository consumerExpenditureProfileRepository) {
		this.consumerExpenditureProfileRepository = consumerExpenditureProfileRepository;
	}

}
