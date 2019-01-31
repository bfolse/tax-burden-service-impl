package com.ttb.service.taxburden.calculation;

import com.ttb.service.taxburden.domain.TaxEntry;
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
        BigDecimal incomeTax = calculateMarginalTax(taxableIncome, taxRateSet);

        // Tax Credits
        // TODO

		MonetaryAmountEntity calculatedTax = new MonetaryAmountEntity(annualIncome.getCurrency(), incomeTax.setScale(2, RoundingMode.UP));
		logger.debug("End tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition + " calculatedTax: " + calculatedTax);
		return calculatedTax;
	}

    private BigDecimal calculateTaxableIncome(TaxPayerProfileEntity taxPayerProfile, IncomeTaxDefinitionEntity incomeTaxDefinitionEntity, TaxBurdenReportEntity taxBurdenReportEntity) throws TaxCalculationException {
        BigDecimal taxableIncome = TaxCalculatorUtils.calculateAdjustedGrossIncome(taxPayerProfile, taxBurdenReportEntity);
        BigDecimal exemptionAmount = BigDecimal.ZERO;
        BigDecimal standardDeduction = BigDecimal.ZERO;

        switch (taxPayerProfile.getTaxFilingStatus()) {
            case SINGLE: {
                exemptionAmount = BigDecimal.valueOf(incomeTaxDefinitionEntity.getPersonalExemptionSingle());
                standardDeduction = BigDecimal.valueOf(incomeTaxDefinitionEntity.getStandardDeductionSingle());
                break;
            }
            case JOINT: {
                exemptionAmount = BigDecimal.valueOf(incomeTaxDefinitionEntity.getPersonalExemptionJoint());
                standardDeduction = BigDecimal.valueOf(incomeTaxDefinitionEntity.getStandardDeductionJoint());
                break;
            }
            case MARRIED_SEPARATE: {
                exemptionAmount = BigDecimal.valueOf(incomeTaxDefinitionEntity.getPersonalExemptionMarriedFilingSeparate());
                standardDeduction = BigDecimal.valueOf(incomeTaxDefinitionEntity.getStandardDeductionMarriedFilingSeparate());
                break;
            }
            case HEAD_OF_HOUSEHOLD: {
                exemptionAmount = BigDecimal.valueOf(incomeTaxDefinitionEntity.getPersonalExemptionHeadOfHousehold());
                standardDeduction = BigDecimal.valueOf(incomeTaxDefinitionEntity.getStandardDeductionHeadOfHousehold());
                break;
            }
            default: {
                String errorMessage = "Invalid tax filing status: " + taxPayerProfile.getTaxFilingStatus();
                logger.error(errorMessage);
                throw new TaxCalculationException(errorMessage);
            }
        }

        // Exemptions
        taxableIncome = taxableIncome.subtract(exemptionAmount);

        // Dependents
        taxableIncome = taxableIncome.subtract(BigDecimal.valueOf(incomeTaxDefinitionEntity.getDependentExemption() * taxPayerProfile.getDependents()));

        // Standard or Itemized Deductions
        BigDecimal deductionAmount = standardDeduction;
        if (incomeTaxDefinitionEntity.isDeductItemized()) {
            // State and Local taxes
            BigDecimal stateAndLocalTaxes = determineStateAndLocalTaxes(taxBurdenReportEntity);
            // Use greater of totalItemizedDeductions or standardDeduction
            BigDecimal totalItemizedDeductions = taxPayerProfile.getMortgageInterest().getAmount()
                    .add(taxPayerProfile.getOtherItemizedDeductions().getAmount()
                    .add(stateAndLocalTaxes));
            if (totalItemizedDeductions.compareTo(standardDeduction) > 0) {
                deductionAmount = totalItemizedDeductions;
            }
        }
        taxableIncome = taxableIncome.subtract(deductionAmount);

        // Pre-tax Contribution Deductions
        if (incomeTaxDefinitionEntity.isDeductPreTaxContributions()) {
            taxableIncome = taxableIncome.subtract(taxPayerProfile.getPreTaxContributions().getAmount());
        }
        if (taxableIncome.compareTo(BigDecimal.ZERO) < 0) {
            taxableIncome = BigDecimal.ZERO;
        }
	    return taxableIncome;
    }

    /*
     * Determine deduction for state and local taxes paid. Also known as the SALT deduction, it allows taxpayers
     * to deduct the entirety of any state and local property taxes plus the entirety of either income or generalized sales
     * taxes that they paid that tax year.
     */
    private BigDecimal determineStateAndLocalTaxes(TaxBurdenReportEntity taxBurdenReportEntity) {
	    BigDecimal stateAndLocalTaxes = BigDecimal.ZERO;
        BigDecimal propertyTaxes = BigDecimal.ZERO;
	    BigDecimal incomeTaxes = BigDecimal.ZERO;
	    BigDecimal salesTaxes = BigDecimal.ZERO;
	    for (TaxEntryEntity taxEntry : taxBurdenReportEntity.getTaxEntries()) {
            switch (taxEntry.getTaxType()) {
                case PROPERTY_STATE:
                case PROPERTY_COUNTY:
                case PROPERTY_CITY: {
                    propertyTaxes = propertyTaxes.add(taxEntry.getAmount().getAmount());
                    break;
                }
                case INCOME_STATE:
                case INCOME_CITY: {
                    incomeTaxes = incomeTaxes.add(taxEntry.getAmount().getAmount());
                    break;
                }
                case SALES_STATE:
                case SALES_COUNTY:
                case SALES_CITY: {
                    salesTaxes = salesTaxes.add(taxEntry.getAmount().getAmount());
                    break;
                }
                default: {
                    break;
                }
            }
        }
        stateAndLocalTaxes = stateAndLocalTaxes.add(propertyTaxes);
        if (incomeTaxes.compareTo(salesTaxes) > 0) {
            stateAndLocalTaxes = stateAndLocalTaxes.add(incomeTaxes);
        } else {
            stateAndLocalTaxes = stateAndLocalTaxes.add(salesTaxes);
        }
	    return stateAndLocalTaxes;
    }

    public void setTaxRateSetRepository(TaxRateSetRepository taxRateSetRepository) {
		this.taxRateSetRepository = taxRateSetRepository;
	}

    public void setIncomeTaxDefinitionRepository(IncomeTaxDefinitionRepository incomeTaxDefinitionRepository) {
        this.incomeTaxDefinitionRepository = incomeTaxDefinitionRepository;
    }

}
