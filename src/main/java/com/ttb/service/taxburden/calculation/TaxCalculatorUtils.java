package com.ttb.service.taxburden.calculation;

import com.ttb.service.taxburden.domain.TaxType;
import com.ttb.service.taxburden.entities.TaxBurdenReportEntity;
import com.ttb.service.taxburden.entities.TaxEntryEntity;
import com.ttb.service.taxburden.entities.TaxPayerProfileEntity;

import java.math.BigDecimal;

public class TaxCalculatorUtils {
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
}

