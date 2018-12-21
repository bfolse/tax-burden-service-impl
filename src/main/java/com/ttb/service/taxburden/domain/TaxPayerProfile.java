package com.ttb.service.taxburden.domain;


import com.ttb.service.taxburden.impl.TaxBurdenServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

public class TaxPayerProfile {
	private static final Logger logger = LoggerFactory.getLogger(TaxBurdenServiceImpl.class);
	public static final String BASIC_CONSUMER_EXPENDITURE_PROFILE_KEY = "BASIC";
	
	private String taxPayerProfileKey = UUID.randomUUID().toString();
	private Date timestamp = new Date();
	private String postalCode;
	private List<PoliticalDivision> politicalDivisions;
	private MonetaryAmount annualIncome;
	private MonetaryAmount mortgageInterest = new MonetaryAmount(BigDecimal.ZERO);
	private MonetaryAmount realPropertyMarketValue = new MonetaryAmount(BigDecimal.ZERO);
	private String consumerExpenditureProfileKey = BASIC_CONSUMER_EXPENDITURE_PROFILE_KEY;
	private TaxFilingStatus taxFilingStatus = TaxFilingStatus.SINGLE;
	private MonetaryAmount preTaxContributions = new MonetaryAmount(BigDecimal.ZERO);
	private MonetaryAmount otherItemizedDeductions = new MonetaryAmount(BigDecimal.ZERO);
	private Integer dependents = 0;

	/**
	 * 
	 */
	public TaxPayerProfile() {
		super();
	}

	/**
	 * @param postalCode
	 * @param politicalDivisions
	 * @param annualIncome
	 * @param mortgageInterest
	 */
	public TaxPayerProfile(String postalCode, List<PoliticalDivision> politicalDivisions, MonetaryAmount annualIncome, MonetaryAmount mortgageInterest, MonetaryAmount realPropertyMarketValue) {
		super();
		this.postalCode = postalCode;
		this.politicalDivisions = politicalDivisions;
		if (annualIncome != null) { this.annualIncome = annualIncome; }
		if (mortgageInterest != null) { this.mortgageInterest = mortgageInterest; }
		if (realPropertyMarketValue != null) { this.realPropertyMarketValue = realPropertyMarketValue; }
	}

	/**
	 * @param postalCode
	 * @param politicalDivisions
	 * @param annualIncome
	 * @param mortgageInterest
	 */
	public TaxPayerProfile(String postalCode, List<PoliticalDivision> politicalDivisions, MonetaryAmount annualIncome, MonetaryAmount mortgageInterest, MonetaryAmount realPropertyMarketValue, String consumerExpenditureProfileKey) {
		super();
		this.postalCode = postalCode;
		this.politicalDivisions = politicalDivisions;
		if (annualIncome != null) { this.annualIncome = annualIncome; }
		if (mortgageInterest != null) { this.mortgageInterest = mortgageInterest; }
		if (realPropertyMarketValue != null) { this.realPropertyMarketValue = realPropertyMarketValue; }
		if (consumerExpenditureProfileKey != null) { this.consumerExpenditureProfileKey = consumerExpenditureProfileKey; }
	}

	/**
	 * @param taxPayerProfileKey
	 * @param timestamp
	 * @param postalCode
	 * @param politicalDivisions
	 * @param annualIncome
	 * @param mortgageInterest
	 */
	public TaxPayerProfile(String taxPayerProfileKey, Date timestamp, String postalCode,
						   List<PoliticalDivision> politicalDivisions, MonetaryAmount annualIncome, MonetaryAmount mortgageInterest, MonetaryAmount realPropertyMarketValue, String consumerExpenditureProfileKey) {
		super();
		if (taxPayerProfileKey != null) { this.taxPayerProfileKey = taxPayerProfileKey; }
		if (timestamp != null) { this.timestamp = timestamp; }
		this.postalCode = postalCode;
		this.politicalDivisions = politicalDivisions;
		if (annualIncome != null) { this.annualIncome = annualIncome; }
		if (mortgageInterest != null) { this.mortgageInterest = mortgageInterest; }
		if (realPropertyMarketValue != null) { this.realPropertyMarketValue = realPropertyMarketValue; }
		if (consumerExpenditureProfileKey != null) { this.consumerExpenditureProfileKey = consumerExpenditureProfileKey; }
	}

	public TaxPayerProfile(String taxPayerProfileKey, Date timestamp, String postalCode, List<PoliticalDivision> politicalDivisions, MonetaryAmount annualIncome, MonetaryAmount mortgageInterest, MonetaryAmount realPropertyMarketValue, String consumerExpenditureProfileKey, TaxFilingStatus taxFilingStatus, MonetaryAmount preTaxContributions, MonetaryAmount otherItemizedDeductions, Integer dependents) {
		super();
		if (taxPayerProfileKey != null) { this.taxPayerProfileKey = taxPayerProfileKey; }
		if (timestamp != null) { this.timestamp = timestamp; }
		this.postalCode = postalCode;
		this.politicalDivisions = politicalDivisions;
		if (annualIncome != null) { this.annualIncome = annualIncome; }
		if (mortgageInterest != null) { this.mortgageInterest = mortgageInterest; }
		if (realPropertyMarketValue != null) { this.realPropertyMarketValue = realPropertyMarketValue; }
		if (consumerExpenditureProfileKey != null) { this.consumerExpenditureProfileKey = consumerExpenditureProfileKey; }
		if (taxFilingStatus != null) { this.taxFilingStatus = taxFilingStatus; }
		if (preTaxContributions != null) { this.preTaxContributions = preTaxContributions; }
		if (otherItemizedDeductions != null) { this.otherItemizedDeductions = otherItemizedDeductions; }
		if (dependents != null) { this.dependents = dependents; }
	}

	public boolean isValid() {
		logger.debug("validating TaxPayerProfile: {} ", this);
		boolean valid = true;

		if (taxPayerProfileKey == null
		|| timestamp == null
		|| (politicalDivisions == null || politicalDivisions.size() == 0)
		|| annualIncome == null
		|| mortgageInterest == null
		|| realPropertyMarketValue == null
		|| consumerExpenditureProfileKey == null
		|| taxFilingStatus == null
		|| preTaxContributions == null
		|| otherItemizedDeductions == null
		|| dependents == null) {
			valid = false;
		}
		logger.debug("isValid? {}", valid);
		return valid;
	}

	/**
	 * @return the taxPayerProfileKey
	 */
	public String getTaxPayerProfileKey() {
		return taxPayerProfileKey;
	}

	/**
	 * @param taxPayerProfileKey the taxPayerProfileKey to set
	 */
	public void setTaxPayerProfileKey(String taxPayerProfileKey) {
		this.taxPayerProfileKey = taxPayerProfileKey;
	}

	/**
	 * @return the timestamp
	 */
	public Date getTimestamp() {
		return timestamp;
	}

	/**
	 * @param timestamp the timestamp to set
	 */
	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	/**
	 * @return the postalCode
	 */
	public String getPostalCode() {
		return postalCode;
	}

	/**
	 * @param postalCode the postalCode to set
	 */
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	/**
	 * @return the politicalDivisions
	 */
	public List<PoliticalDivision> getPoliticalDivisions() {
		return politicalDivisions;
	}

	/**
	 * @param politicalDivisions the politicalDivisions to set
	 */
	public void setPoliticalDivisions(List<PoliticalDivision> politicalDivisions) {
		this.politicalDivisions = politicalDivisions;
	}

	/**
	 * @return the annualIncome
	 */
	public MonetaryAmount getAnnualIncome() {
		return annualIncome;
	}

	/**
	 * @param annualIncome the annualIncome to set
	 */
	public void setAnnualIncome(MonetaryAmount annualIncome) {
		this.annualIncome = annualIncome;
	}

	/**
	 * @return the mortgageInterest
	 */
	public MonetaryAmount getMortgageInterest() {
		return mortgageInterest;
	}

	/**
	 * @param mortgageInterest the mortgageInterest to set
	 */
	public void setMortgageInterest(MonetaryAmount mortgageInterest) {
		this.mortgageInterest = mortgageInterest;
	}

	/**
	 * @return the realPropertyMarketValue
	 */
	public MonetaryAmount getRealPropertyMarketValue() {
		return realPropertyMarketValue;
	}

	/**
	 * @param realPropertyMarketValue the realPropertyMarketValue to set
	 */
	public void setRealPropertyMarketValue(MonetaryAmount realPropertyMarketValue) {
		this.realPropertyMarketValue = realPropertyMarketValue;
	}

	/**
	 * @return the consumerExpenditureProfileKey
	 */
	public String getConsumerExpenditureProfileKey() {
		return consumerExpenditureProfileKey;
	}

	/**
	 * @param consumerExpenditureProfileKey the consumerExpenditureProfileKey to set
	 */
	public void setConsumerExpenditureProfileKey(String consumerExpenditureProfileKey) {
		this.consumerExpenditureProfileKey = consumerExpenditureProfileKey;
	}

	public TaxFilingStatus getTaxFilingStatus() {
		return taxFilingStatus;
	}

	public void setTaxFilingStatus(TaxFilingStatus taxFilingStatus) {
		this.taxFilingStatus = taxFilingStatus;
	}

	public MonetaryAmount getPreTaxContributions() {
		return preTaxContributions;
	}

	public void setPreTaxContributions(MonetaryAmount preTaxContributions) {
		this.preTaxContributions = preTaxContributions;
	}

	public MonetaryAmount getOtherItemizedDeductions() {
		return otherItemizedDeductions;
	}

	public void setOtherItemizedDeductions(MonetaryAmount otherItemizedDeductions) {
		this.otherItemizedDeductions = otherItemizedDeductions;
	}

	public Integer getDependents() {
		return dependents;
	}

	public void setDependents(Integer dependents) {
		this.dependents = dependents;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (!(o instanceof TaxPayerProfile)) return false;
		TaxPayerProfile that = (TaxPayerProfile) o;
		return Objects.equals(taxPayerProfileKey, that.taxPayerProfileKey) &&
				Objects.equals(timestamp, that.timestamp) &&
				Objects.equals(postalCode, that.postalCode) &&
				Objects.equals(politicalDivisions, that.politicalDivisions) &&
				Objects.equals(annualIncome, that.annualIncome) &&
				Objects.equals(mortgageInterest, that.mortgageInterest) &&
				Objects.equals(realPropertyMarketValue, that.realPropertyMarketValue) &&
				Objects.equals(consumerExpenditureProfileKey, that.consumerExpenditureProfileKey) &&
				taxFilingStatus == that.taxFilingStatus &&
				Objects.equals(preTaxContributions, that.preTaxContributions) &&
				Objects.equals(otherItemizedDeductions, that.otherItemizedDeductions) &&
				Objects.equals(dependents, that.dependents);
	}

	@Override
	public int hashCode() {
		return Objects.hash(taxPayerProfileKey, timestamp, postalCode, politicalDivisions, annualIncome, mortgageInterest, realPropertyMarketValue, consumerExpenditureProfileKey, taxFilingStatus, preTaxContributions, otherItemizedDeductions, dependents);
	}

	@Override
	public String toString() {
		return "TaxPayerProfile{" +
				"taxPayerProfileKey='" + taxPayerProfileKey + '\'' +
				", timestamp=" + timestamp +
				", postalCode='" + postalCode + '\'' +
				", politicalDivisions=" + politicalDivisions +
				", annualIncome=" + annualIncome +
				", mortgageInterest=" + mortgageInterest +
				", realPropertyMarketValue=" + realPropertyMarketValue +
				", consumerExpenditureProfileKey='" + consumerExpenditureProfileKey + '\'' +
				", taxFilingStatus=" + taxFilingStatus +
				", preTaxContributions=" + preTaxContributions +
				", otherItemizedDeductions=" + otherItemizedDeductions +
				", dependents=" + dependents +
				'}';
	}
}
