package com.ttb.service.taxburden.calculation;

import com.ttb.service.taxburden.domain.TaxFilingStatus;
import com.ttb.service.taxburden.entities.*;
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
public class CapitalGainsTaxBracketedRateCalculator implements TaxCalculator {
	private static final Logger logger = LoggerFactory.getLogger(CapitalGainsTaxBracketedRateCalculator.class);

    @Autowired
    TaxRateSetRepository taxRateSetRepository;

    Map<String, Map<TaxFilingStatus, List<TaxRateEntity>>> taxRateSets;

    public CapitalGainsTaxBracketedRateCalculator() {
		super();
	}

    @PostConstruct
    public void init() {
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

		BigDecimal capitalGainsTax = BigDecimal.ZERO;

		MonetaryAmountEntity capitalGainsIncomeMA = taxPayerProfile.getCapitalGainsIncome();
		if (capitalGainsIncomeMA == null || capitalGainsIncomeMA.getAmount().compareTo(BigDecimal.ZERO) < 0) {
            capitalGainsIncomeMA = new MonetaryAmountEntity(0.0);
        }

		BigDecimal capitalGainsIncome = capitalGainsIncomeMA.getAmount();

		if (capitalGainsIncome.compareTo(BigDecimal.ZERO) > 0) {
            // Get taxable income
            BigDecimal taxableIncome = taxBurdenReport.getTaxableIncome();
            if (taxableIncome == null) {
                logger.error("taxableIncome not available in taxBurdenReport, needed for capital gains tax calculation");
                throw new TaxCalculationException("taxableIncome not available in taxBurdenReport, needed for capital gains tax calculation");
            }
            // Use sum of taxableIncome and capitalGainsIncome to determine tax bracket
            BigDecimal bracketAmount = taxableIncome.add(capitalGainsIncome);

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

            // Calculate income tax using bracketed simple rates
            capitalGainsTax = TaxCalculatorUtils.calculateBracketedTax(bracketAmount, capitalGainsIncome, taxRateSet);
        }
		MonetaryAmountEntity calculatedTax = new MonetaryAmountEntity(capitalGainsIncomeMA.getCurrency(), capitalGainsTax.setScale(2, RoundingMode.UP));
		logger.debug("End tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition + " calculatedTax: " + calculatedTax);
		return calculatedTax;
	}

    public void setTaxRateSetRepository(TaxRateSetRepository taxRateSetRepository) {
		this.taxRateSetRepository = taxRateSetRepository;
	}
}
