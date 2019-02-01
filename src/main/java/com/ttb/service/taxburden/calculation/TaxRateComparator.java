package com.ttb.service.taxburden.calculation;

import com.ttb.service.taxburden.entities.TaxRateEntity;

import java.util.Comparator;

public class TaxRateComparator implements Comparator<TaxRateEntity> {
    @Override
    public int compare(TaxRateEntity o1, TaxRateEntity o2) {
        return o1.getRangeLow().subtract(o2.getRangeLow()).intValue();
    }
}
