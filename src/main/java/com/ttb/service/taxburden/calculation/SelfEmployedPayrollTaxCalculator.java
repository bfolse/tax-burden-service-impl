package com.ttb.service.taxburden.calculation;

import com.ttb.service.taxburden.domain.TaxFilingStatus;
import com.ttb.service.taxburden.entities.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@Component
public class SelfEmployedPayrollTaxCalculator extends PayrollTaxBracketedMarginalRateCalculator {
	private static final Logger logger = LoggerFactory.getLogger(SelfEmployedPayrollTaxCalculator.class);

	public SelfEmployedPayrollTaxCalculator() {
		super();
	}

	@PostConstruct
	public void init() {
		super.init();
	}
	
	@Override
	public MonetaryAmountEntity calculate(TaxPayerProfileEntity taxPayerProfile, PoliticalDivisionEntity politicalDivision, TaxDefinitionEntity taxDefinition, TaxBurdenReportEntity taxBurdenReport) throws TaxCalculationException {
		logger.debug("Begin tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition);

		MonetaryAmountEntity calculatedTax= new MonetaryAmountEntity(0.0);
		MonetaryAmountEntity selfEmployedIncome = taxPayerProfile.getSelfEmployedIncome();
		if (selfEmployedIncome != null && selfEmployedIncome.getAmount().compareTo(BigDecimal.ZERO) > 0) {
			// Determine taxRateSet to use
			List<TaxRateEntity> taxRateSet;
			if (taxRateSets.get(taxDefinition.getTaxDefinitionKey()).size() == 1) {
				// Only one rate set for this tax definition
				taxRateSet = taxRateSets.get(taxDefinition.getTaxDefinitionKey()).get(TaxFilingStatus.NONE);
			} else {
				// Use the taxRateSet for the taxFilingStatus from the taxPayerProfile
				taxRateSet = taxRateSets.get(taxDefinition.getTaxDefinitionKey()).get(taxPayerProfile.getTaxFilingStatus());
			}
			// Calculate income tax using bracketed marginal rates
			BigDecimal payrollTax = TaxCalculatorUtils.calculateMarginalTax(selfEmployedIncome.getAmount(), taxRateSet);

			calculatedTax = new MonetaryAmountEntity(selfEmployedIncome.getCurrency(), payrollTax.setScale(2, RoundingMode.UP));
		}
		logger.debug("End tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition + " calculatedTax: " + calculatedTax);
		return calculatedTax;
	}
}
