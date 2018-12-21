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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class IncomeTaxBracketedMarginalRateCalculator extends MarginalTaxRateCalculator implements TaxCalculator {
	private static final Logger logger = LoggerFactory.getLogger(IncomeTaxBracketedMarginalRateCalculator.class);

	@Autowired
	TaxRateSetRepository taxRateSetRepository;
	@Autowired
    IncomeTaxDefinitionRepository incomeTaxDefinitionRepository;

	// Map<taxDefinitionKey, Map<taxFilingStatus, taxRateSet>>
	Map<String, Map<TaxFilingStatus, List<TaxRateEntity>>> taxRateSets;
	Map<String, IncomeTaxDefinitionEntity> incomeTaxDefinitions;

	public IncomeTaxBracketedMarginalRateCalculator() {
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

		incomeTaxDefinitions = new HashMap<String, IncomeTaxDefinitionEntity>();
		Iterable<IncomeTaxDefinitionEntity> incomeTaxDefinitionEntityIterable = incomeTaxDefinitionRepository.findAll();
		for (IncomeTaxDefinitionEntity incomeTaxDefinitionEntity : incomeTaxDefinitionEntityIterable) {
		    if (incomeTaxDefinitionEntity != null) {
		        incomeTaxDefinitions.put(incomeTaxDefinitionEntity.getTaxDefinitionKey(), incomeTaxDefinitionEntity);
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
		taxableIncome = calculateTaxableIncome(taxPayerProfile, incomeTaxDefinitions.get(taxDefinition.getTaxDefinitionKey()));

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
        BigDecimal incomeTax = calculateMarginalTax(taxableIncome, taxRateSet);

		MonetaryAmountEntity calculatedTax = new MonetaryAmountEntity(annualIncome.getCurrency(), incomeTax);
		logger.debug("End tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition + " calculatedTax: " + calculatedTax);
		return calculatedTax;
	}

    private BigDecimal calculateTaxableIncome(TaxPayerProfileEntity taxPayerProfile, IncomeTaxDefinitionEntity incomeTaxDefinitionEntity) throws TaxCalculationException {
        BigDecimal annualIncome = taxPayerProfile.getAnnualIncome().getAmount();
        BigDecimal taxableIncome;

        switch (taxPayerProfile.getTaxFilingStatus()) {
            case SINGLE : {
                taxableIncome = annualIncome.subtract(BigDecimal.valueOf(incomeTaxDefinitionEntity.getPersonalExemptionSingle()))
                        .subtract(BigDecimal.valueOf(incomeTaxDefinitionEntity.getStandardDeductionSingle()));
                break;
            }
            case JOINT : {
                taxableIncome = annualIncome.subtract(BigDecimal.valueOf(incomeTaxDefinitionEntity.getPersonalExemptionJoint()))
                        .subtract(BigDecimal.valueOf(incomeTaxDefinitionEntity.getStandardDeductionJoint()));
                break;
            }
            default : {
                String errorMessage = "Invalid tax filing status: " + taxPayerProfile.getTaxFilingStatus();
                logger.error(errorMessage);
                throw new TaxCalculationException(errorMessage);
            }
        }
        // Dependents
        taxableIncome = taxableIncome.subtract(BigDecimal.valueOf(incomeTaxDefinitionEntity.getDependentExemption() * taxPayerProfile.getDependents()));

        // Itemized Deductions
        if (incomeTaxDefinitionEntity.isDeductItemized()) {
            taxableIncome = taxableIncome.subtract(taxPayerProfile.getMortgageInterest().getAmount())
                    .subtract(taxPayerProfile.getOtherItemizedDeductions().getAmount());
        }
        // Pre-tax Contribution Deductions
        if (incomeTaxDefinitionEntity.isDeductPreTaxContributions()) {
            taxableIncome = taxableIncome.subtract(taxPayerProfile.getPreTaxContributions().getAmount());
        }
        if (taxableIncome.compareTo(BigDecimal.ZERO) < 0) {
            taxableIncome = BigDecimal.ZERO;
        }
	    return taxableIncome;
    }

    public void setTaxRateSetRepository(TaxRateSetRepository taxRateSetRepository) {
		this.taxRateSetRepository = taxRateSetRepository;
	}

    public void setIncomeTaxDefinitionRepository(IncomeTaxDefinitionRepository incomeTaxDefinitionRepository) {
        this.incomeTaxDefinitionRepository = incomeTaxDefinitionRepository;
    }

}
