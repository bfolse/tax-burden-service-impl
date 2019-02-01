package com.ttb.service.taxburden.calculation;

import com.ttb.service.taxburden.domain.TaxType;
import com.ttb.service.taxburden.entities.TaxBurdenReportEntity;
import com.ttb.service.taxburden.entities.TaxEntryEntity;
import com.ttb.service.taxburden.entities.TaxPayerProfileEntity;
import com.ttb.service.taxburden.entities.TaxRateEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.util.Comparator;
import java.util.List;

public class TaxCalculatorUtils {
    private static final Logger logger = LoggerFactory.getLogger(TaxCalculatorUtils.class);
    /**
     * Calculate Adjusted Gross Income from Annual Income by subtracting payroll taxes from the
     * provided Tax Burden Report (if not null) and other pre-tax contributions
     * @param taxPayerProfile
     * @param taxBurdenReport
     */
    public static BigDecimal calculateAdjustedGrossIncome(TaxPayerProfileEntity taxPayerProfile, TaxBurdenReportEntity taxBurdenReport) {
        // Start with annualIncome
        BigDecimal adjustedGrossIncome = taxPayerProfile.getAnnualIncome().getAmount();
        // Subtract payroll taxes
        if (taxBurdenReport != null) {
            for (TaxEntryEntity taxEntry : taxBurdenReport.getTaxEntries()) {
                if (taxEntry.getTaxType() == TaxType.PAYROLL_FEDERAL) {
                    adjustedGrossIncome = adjustedGrossIncome.subtract(taxEntry.getAmount().getAmount());
                }
            }
        }
        // Subtract other pre-tax contributions
        adjustedGrossIncome = adjustedGrossIncome.subtract(taxPayerProfile.getPreTaxContributions().getAmount());
        return adjustedGrossIncome;
    }

    /**
     * Use a simple method to calculate estimated income tax based solely on adjustedGrossIncome.
     * This method should be used in tax calculators that need an income tax estimate as an input,
     * but must be executed prior to more accurate income tax calculation.
     * @param adjustedGrossIncome
     */
    public static BigDecimal calculateEstimatedSimpleIncomeTax(BigDecimal adjustedGrossIncome) {
        BigDecimal estimatedIncomeTax = BigDecimal.ZERO;
        if (adjustedGrossIncome.compareTo(BigDecimal.valueOf(25000)) >= 0 && adjustedGrossIncome.compareTo(BigDecimal.valueOf(50000)) < 0) {
            estimatedIncomeTax = adjustedGrossIncome.multiply(BigDecimal.valueOf(0.07));
        }
        if (adjustedGrossIncome.compareTo(BigDecimal.valueOf(50000)) >= 0 && adjustedGrossIncome.compareTo(BigDecimal.valueOf(100000)) < 0) {
            estimatedIncomeTax = adjustedGrossIncome.multiply(BigDecimal.valueOf(0.10));
        }
        if (adjustedGrossIncome.compareTo(BigDecimal.valueOf(100000)) >= 0 && adjustedGrossIncome.compareTo(BigDecimal.valueOf(200000)) < 0) {
            estimatedIncomeTax = adjustedGrossIncome.multiply(BigDecimal.valueOf(0.14));
        }
        if (adjustedGrossIncome.compareTo(BigDecimal.valueOf(200000)) >= 0 && adjustedGrossIncome.compareTo(BigDecimal.valueOf(500000)) < 0) {
            estimatedIncomeTax = adjustedGrossIncome.multiply(BigDecimal.valueOf(0.21));
        }
        if (adjustedGrossIncome.compareTo(BigDecimal.valueOf(500000)) >= 0 && adjustedGrossIncome.compareTo(BigDecimal.valueOf(1000000)) < 0) {
            estimatedIncomeTax = adjustedGrossIncome.multiply(BigDecimal.valueOf(0.28));
        }
        if (adjustedGrossIncome.compareTo(BigDecimal.valueOf(1000000)) >= 0 && adjustedGrossIncome.compareTo(BigDecimal.valueOf(10000000)) < 0) {
            estimatedIncomeTax = adjustedGrossIncome.multiply(BigDecimal.valueOf(0.31));
        }
        if (adjustedGrossIncome.compareTo(BigDecimal.valueOf(10000000)) >= 0) {
            estimatedIncomeTax = adjustedGrossIncome.multiply(BigDecimal.valueOf(0.28));
        }
        return estimatedIncomeTax;
    }

    public static BigDecimal calculateMarginalTax(BigDecimal taxableIncome, List<TaxRateEntity> rates) {
        BigDecimal tax = BigDecimal.ZERO;
        if (!(taxableIncome.compareTo(BigDecimal.ZERO) <= 0)) {
            // Sort tax rates low to high
            rates.sort(new TaxRateComparator());
            logger.debug("Sorted tax rates: {}" + rates);
            // Rate list
            for (TaxRateEntity rate : rates) {
                BigDecimal rangeHigh;
                if (rate.getRangeHigh() == null) {
                    // Null rangeHigh signifies open ended range, substitute with max value
                    rangeHigh = BigDecimal.valueOf(Double.MAX_VALUE);
                } else {
                    rangeHigh = new BigDecimal(rate.getRangeHigh());
                }
                BigDecimal rangeLow = new BigDecimal(rate.getRangeLow());
                if (taxableIncome.compareTo(rangeHigh) >= 0) {
                    // taxableIncome >= high end of range for this rate
                    tax = tax.add(rangeHigh.subtract(rangeLow).multiply(rate.getRate()));
                } else {
                    // taxableIncome < high end of range for this rate
                    tax = tax.add(taxableIncome.subtract(rangeLow).multiply(rate.getRate()));
                    break;
                }
            }
        }
        return tax;
    }
}

