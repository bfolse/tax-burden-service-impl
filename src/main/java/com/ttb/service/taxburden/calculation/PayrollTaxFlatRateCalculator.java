package com.ttb.service.taxburden.calculation;

import com.ttb.service.taxburden.domain.TaxFilingStatus;
import com.ttb.service.taxburden.entities.*;
import com.ttb.service.taxburden.repositories.TaxRateFlatRepository;
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
public class PayrollTaxFlatRateCalculator implements TaxCalculator {
	private static final Logger logger = LoggerFactory.getLogger(PayrollTaxFlatRateCalculator.class);

	@Autowired
	TaxRateFlatRepository taxRateFlatRepository;

	Map<String, BigDecimal> taxRates;

	public PayrollTaxFlatRateCalculator() {
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
	public MonetaryAmountEntity calculate(TaxPayerProfileEntity taxPayerProfile, PoliticalDivisionEntity politicalDivision, TaxDefinitionEntity taxDefinition, TaxBurdenReportEntity taxBurdenReport) throws TaxCalculationException {
		logger.debug("Begin tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition);

		MonetaryAmountEntity annualIncome = taxPayerProfile.getAnnualIncome();
		if (annualIncome == null || annualIncome.getAmount().compareTo(BigDecimal.ZERO) < 0) {
			annualIncome = new MonetaryAmountEntity(0.0);
		}

		BigDecimal rate = taxRates.get(taxDefinition.getTaxDefinitionKey());
		if (rate == null) {
			throw new TaxCalculationException("No tax rate found for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition);
		}

		MonetaryAmountEntity calculatedTax = new MonetaryAmountEntity(taxPayerProfile.getAnnualIncome().getCurrency(), annualIncome.getAmount().multiply(rate).setScale(2, RoundingMode.UP));

		logger.debug("End tax calculation for politicalDivision: " + politicalDivision + " taxDefinition: " + taxDefinition + " calculatedTax: " + calculatedTax);
		return calculatedTax;
	}

	public void setTaxRateFlatRepository(TaxRateFlatRepository taxRateFlatRepository) {
		this.taxRateFlatRepository = taxRateFlatRepository;
	}

}
