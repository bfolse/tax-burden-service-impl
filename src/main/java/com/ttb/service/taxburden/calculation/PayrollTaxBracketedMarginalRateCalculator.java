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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class PayrollTaxBracketedMarginalRateCalculator extends MarginalTaxRateCalculator implements TaxCalculator {
	private static final Logger logger = LoggerFactory.getLogger(PayrollTaxBracketedMarginalRateCalculator.class);

	@Autowired
	TaxRateSetRepository taxRateSetRepository;

	// Map<taxDefinitionKey, Map<taxFilingStatus, taxRateSet>>
	Map<String, Map<TaxFilingStatus, List<TaxRateEntity>>> taxRateSets;

	public PayrollTaxBracketedMarginalRateCalculator() {
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

		MonetaryAmountEntity annualIncome = taxPayerProfile.getAnnualIncome();
		if (annualIncome == null || annualIncome.getAmount().compareTo(BigDecimal.ZERO) < 0) {
			annualIncome = new MonetaryAmountEntity(0.0);
		}

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
        BigDecimal payrollTax = calculateMarginalTax(annualIncome.getAmount(), taxRateSet);

		MonetaryAmountEntity calculatedTax = new MonetaryAmountEntity(annualIncome.getCurrency(), payrollTax);
		logger.debug("End tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition + " calculatedTax: " + calculatedTax);
		return calculatedTax;
	}

    public void setTaxRateSetRepository(TaxRateSetRepository taxRateSetRepository) {
		this.taxRateSetRepository = taxRateSetRepository;
	}
}
