package com.ttb.service.taxburden.controllers;

import com.ttb.service.taxburden.domain.InvalidTaxPayerProfileException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class InvalidTaxPayerProfileAdvice {
    @ResponseBody
    @ExceptionHandler(InvalidTaxPayerProfileException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    String invalidTaxPayerProfileHandler(InvalidTaxPayerProfileException ex) {
        return ex.getMessage();
    }
}
