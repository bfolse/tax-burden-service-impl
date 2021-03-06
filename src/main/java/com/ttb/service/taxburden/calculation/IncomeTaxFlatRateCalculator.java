package com.ttb.service.taxburden.calculation;

import com.ttb.service.taxburden.entities.*;
import com.ttb.service.taxburden.repositories.TaxRateFlatRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.Map;

@Component
public class IncomeTaxFlatRateCalculator extends IncomeTaxCalculator {
	private static final Logger logger = LoggerFactory.getLogger(IncomeTaxFlatRateCalculator.class);
	
	@Autowired
	TaxRateFlatRepository taxRateFlatRepository;

	Map<String, BigDecimal> taxRates;

	IncomeTaxDefinitionEntity defaultIncomeTaxDefinitionEntity;
	
	public IncomeTaxFlatRateCalculator() {
		super();
	}

	@PostConstruct
	public void init() {
		super.init();
		taxRates = new HashMap<String, BigDecimal>();
		Iterable<TaxRateEntity> taxRateFlatIterable = taxRateFlatRepository.findAll();
		for (TaxRateEntity taxRateFlat : taxRateFlatIterable) {
			if (taxRateFlat != null) {
				taxRates.put(taxRateFlat.getTaxDefinitionKey(), taxRateFlat.getRate());
			}
		}
		// Create default Income Tax Definition with no standard deductions or exemptions
		defaultIncomeTaxDefinitionEntity = new IncomeTaxDefinitionEntity("DEFAULT", Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), true, true);
	}
	
	@Override
	public MonetaryAmountEntity calculate(TaxPayerProfileEntity taxPayerProfile, PoliticalDivisionEntity politicalDivision, TaxDefinitionEntity taxDefinition, TaxBurdenReportEntity taxBurdenReport) throws TaxCalculationException {
		logger.debug("Begin tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition);
		BigDecimal rate = taxRates.get(taxDefinition.getTaxDefinitionKey());

		// Use default if no Income Tax Definition is found
		IncomeTaxDefinitionEntity incomeTaxDefinitionEntity = incomeTaxDefinitions.get(taxDefinition.getTaxDefinitionKey());
		if (incomeTaxDefinitionEntity == null) {
			incomeTaxDefinitionEntity = defaultIncomeTaxDefinitionEntity;
		}

		// Calculate taxable income
		BigDecimal taxableIncome = calculateTaxableIncome(taxPayerProfile, incomeTaxDefinitionEntity, taxBurdenReport);

		MonetaryAmountEntity calculatedTax = new MonetaryAmountEntity(taxPayerProfile.getAnnualIncome().getCurrency(), taxableIncome.multiply(rate).setScale(2, RoundingMode.UP));
		logger.debug("End tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition + " calculatedTax: " + calculatedTax);
		return calculatedTax;
	}

	/**
	 * @param taxRateFlatRepository the taxRateFlatRepository to set
	 */
	public void setTaxRateFlatRepository(TaxRateFlatRepository taxRateFlatRepository) {
		this.taxRateFlatRepository = taxRateFlatRepository;
	}

}
