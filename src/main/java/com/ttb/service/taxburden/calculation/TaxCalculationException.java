package com.ttb.service.taxburden.calculation;

public class TaxCalculationException extends Exception {
    public TaxCalculationException() {
        super();
    }

    public TaxCalculationException(String message) {
        super(message);
    }

    public TaxCalculationException(String message, Throwable cause) {
        super(message, cause);
    }

    public TaxCalculationException(Throwable cause) {
        super(cause);
    }
}
