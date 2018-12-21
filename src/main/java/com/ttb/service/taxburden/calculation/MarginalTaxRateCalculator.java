package com.ttb.service.taxburden.calculation;

import com.ttb.service.taxburden.entities.TaxRateEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.util.Comparator;
import java.util.List;

public abstract class MarginalTaxRateCalculator {
    private static final Logger logger = LoggerFactory.getLogger(MarginalTaxRateCalculator.class);

    protected BigDecimal calculateMarginalTax(BigDecimal taxableIncome, List<TaxRateEntity> rates) {
        BigDecimal tax = BigDecimal.ZERO;
        if (!(taxableIncome.compareTo(BigDecimal.ZERO) <= 0)) {
            // Sort tax rates low to high
            rates.sort(new MarginalTaxRateCalculator.TaxRateComparator());
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

    private class TaxRateComparator implements Comparator<TaxRateEntity> {
        @Override
        public int compare(TaxRateEntity o1, TaxRateEntity o2) {
            return o1.getRangeLow().subtract(o2.getRangeLow()).intValue();
        }
    }
}
