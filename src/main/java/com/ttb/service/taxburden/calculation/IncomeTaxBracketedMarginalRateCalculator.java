package com.ttb.service.taxburden.calculation;

import com.ttb.service.taxburden.domain.TaxFilingStatus;
import com.ttb.service.taxburden.entities.*;
import com.ttb.service.taxburden.repositories.IncomeTaxDefinitionRepository;
import com.ttb.service.taxburden.repositories.TaxRateSetRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class IncomeTaxBracketedMarginalRateCalculator extends IncomeTaxCalculator {
	private static final Logger logger = LoggerFactory.getLogger(IncomeTaxBracketedMarginalRateCalculator.class);

    @Autowired
    TaxRateSetRepository taxRateSetRepository;

    Map<String, Map<TaxFilingStatus, List<TaxRateEntity>>> taxRateSets;

    public IncomeTaxBracketedMarginalRateCalculator() {
		super();
	}

    @PostConstruct
    public void init() {
        super.init();
        taxRateSets = new HashMap<String, Map<TaxFilingStatus, List<TaxRateEntity>>>();
        Iterable<TaxRateSetEntity> taxRateSetIterable = taxRateSetRepository.findAll();
        for (TaxRateSetEntity taxRateSet : taxRateSetIterable) {
            if (taxRateSet != null) {
                Map<TaxFilingStatus, List<TaxRateEntity>> taxRateSetForFilingStatus = taxRateSets.get(taxRateSet.getTaxDefinitionKey());
                if (taxRateSetForFilingStatus == null) {
                    taxRateSetForFilingStatus = new HashMap<TaxFilingStatus, List<TaxRateEntity>>();
                }
                taxRateSetForFilingStatus.put(taxRateSet.getTaxFilingStatus() == null ? TaxFilingStatus.NONE : taxRateSet.getTaxFilingStatus(), taxRateSet.getTaxRates());
                taxRateSets.put(taxRateSet.getTaxDefinitionKey(), taxRateSetForFilingStatus);
            }
        }
    }

    @Override
	public MonetaryAmountEntity calculate(TaxPayerProfileEntity taxPayerProfile, PoliticalDivisionEntity politicalDivision, TaxDefinitionEntity taxDefinition, TaxBurdenReportEntity taxBurdenReport) throws TaxCalculationException {
		logger.debug("Begin tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition);

		MonetaryAmountEntity annualIncome = taxPayerProfile.getAnnualIncome();
		if (annualIncome == null || annualIncome.getAmount().compareTo(BigDecimal.ZERO) < 0) {
			annualIncome = new MonetaryAmountEntity(0.0);
		}

		// Calculate taxable income
        BigDecimal taxableIncome = null;
		taxableIncome = calculateTaxableIncome(taxPayerProfile, incomeTaxDefinitions.get(taxDefinition.getTaxDefinitionKey()), taxBurdenReport);

		// Determine taxRateSet to use
        List<TaxRateEntity> taxRateSet;
        if (taxRateSets.get(taxDefinition.getTaxDefinitionKey()).size() == 1) {
            // Only one rate set for this tax definition
            taxRateSet = taxRateSets.get(taxDefinition.getTaxDefinitionKey()).get(TaxFilingStatus.NONE);
        } else {
            // Use the taxRateSet for the taxFilingStatus from the taxPayerProfile
            taxRateSet = taxRateSets.get(taxDefinition.getTaxDefinitionKey()).get(taxPayerProfile.getTaxFilingStatus());
        }
        if (taxRateSet == null) {
            String msg = "Could not determine a tax rate set for taxDefinition: " + taxDefinition.getTaxDefinitionKey() + " taxFilingStatus: " + taxPayerProfile.getTaxFilingStatus();
            logger.error(msg);
            throw new TaxCalculationException(msg);
        }

        // Calculate income tax using bracketed marginal rates
        BigDecimal incomeTax = TaxCalculatorUtils.calculateMarginalTax(taxableIncome, taxRateSet);

        // Tax Credits
        // TODO

		MonetaryAmountEntity calculatedTax = new MonetaryAmountEntity(annualIncome.getCurrency(), incomeTax.setScale(2, RoundingMode.UP));
		logger.debug("End tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition + " calculatedTax: " + calculatedTax);
		return calculatedTax;
	}

    public void setTaxRateSetRepository(TaxRateSetRepository taxRateSetRepository) {
		this.taxRateSetRepository = taxRateSetRepository;
	}
}
