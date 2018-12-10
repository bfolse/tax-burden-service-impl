package com.ttb.service.taxburden;

import com.ttb.service.taxburden.domain.MonetaryAmount;
import com.ttb.service.taxburden.domain.PoliticalDivision;
import com.ttb.service.taxburden.domain.TaxBurdenReport;
import com.ttb.service.taxburden.domain.TaxPayerProfile;

import java.util.List;

public interface TaxBurdenService {
	public List<PoliticalDivision> findAllPoliticalDivisionsByPostalCode(String postalCode);
	public List<PoliticalDivision> findAllPoliticalDivisionsByLatitudeLongitude(String latitude, String longitude);
	public TaxBurdenReport createReport(TaxPayerProfile taxPayerProfile);
	public TaxPayerProfile createTaxPayerProfile(String postalCode, List<String> politicalDivisionKeys, MonetaryAmount annualIncome, MonetaryAmount mortgageInterest, MonetaryAmount realPropertyMarketValue);
	public TaxPayerProfile findTaxPayerProfileByKey(String taxPayerProfileKey);
}
