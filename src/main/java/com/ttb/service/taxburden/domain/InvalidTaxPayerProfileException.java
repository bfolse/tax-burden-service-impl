package com.ttb.service.taxburden.domain;

public class InvalidTaxPayerProfileException extends RuntimeException {
    public InvalidTaxPayerProfileException() {
        super("Missing required attributes in TaxPayerProfile");
    }

    public InvalidTaxPayerProfileException(String message) {
        super(message);
    }
}
