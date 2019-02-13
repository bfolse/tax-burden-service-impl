package com.ttb.service.taxburden.entities;

import com.ttb.service.taxburden.domain.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.*;

/**
 * 
 */
@Entity
@Table(name="tax_payer_profile")
public class TaxPayerProfileEntity {
	@Transient
	public static final String BASIC_CONSUMER_EXPENDITURE_PROFILE_KEY = "BASIC";

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String taxPayerProfileKey;
	private Date timestamp;
	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name="tax_payer_profile_political_divisions",
	        joinColumns=@JoinColumn(name="tax_payer_profile_id"))
	private List<PoliticalDivisionEntity> politicalDivisions;
	@OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
	private MonetaryAmountEntity annualIncome = new MonetaryAmountEntity(BigDecimal.ZERO);
	@OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
	private MonetaryAmountEntity selfEmployedIncome = new MonetaryAmountEntity(BigDecimal.ZERO);
	@OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
	private MonetaryAmountEntity capitalGainsIncome = new MonetaryAmountEntity(BigDecimal.ZERO);
	@OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
	private MonetaryAmountEntity mortgageInterest = new MonetaryAmountEntity(BigDecimal.ZERO);

	@OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
	private MonetaryAmountEntity realPropertyMarketValue = new MonetaryAmountEntity(BigDecimal.ZERO);
	private String consumerExpenditureProfileKey;
	@Enumerated(EnumType.STRING)
	private TaxFilingStatus taxFilingStatus;
	@OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
	private MonetaryAmountEntity preTaxContributions = new MonetaryAmountEntity(BigDecimal.ZERO);
	@OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
	private MonetaryAmountEntity otherItemizedDeductions = new MonetaryAmountEntity(BigDecimal.ZERO);
	private Integer dependents;

	/**
	 * 
	 */
	public TaxPayerProfileEntity() {
		super();
		this.timestamp = new Date();
		this.taxPayerProfileKey = UUID.randomUUID().toString();
		this.politicalDivisions = new ArrayList<PoliticalDivisionEntity>();
		this.consumerExpenditureProfileKey = BASIC_CONSUMER_EXPENDITURE_PROFILE_KEY;
	}

	/**
	 * @param annualIncome
	 * @param mortgageInterest
	 */
	public TaxPayerProfileEntity(MonetaryAmountEntity annualIncome, MonetaryAmountEntity mortgageInterest) {
		super();
		this.timestamp = new Date();
		this.taxPayerProfileKey = UUID.randomUUID().toString();
		this.politicalDivisions = new ArrayList<PoliticalDivisionEntity>();
		this.annualIncome = annualIncome;
		this.mortgageInterest = mortgageInterest;
		this.consumerExpenditureProfileKey = BASIC_CONSUMER_EXPENDITURE_PROFILE_KEY;
	}

	/**
	 * @param politicalDivisions
	 * @param annualIncome
	 * @param mortgageInterest
	 */
	public TaxPayerProfileEntity(List<PoliticalDivisionEntity> politicalDivisions, MonetaryAmountEntity annualIncome, MonetaryAmountEntity mortgageInterest) {
		super();
		this.timestamp = new Date();
		this.taxPayerProfileKey = UUID.randomUUID().toString();
		this.politicalDivisions = politicalDivisions;
		this.annualIncome = annualIncome;
		this.mortgageInterest = mortgageInterest;
		this.consumerExpenditureProfileKey = BASIC_CONSUMER_EXPENDITURE_PROFILE_KEY;
	}

	/**
	 * @param politicalDivisions
	 * @param annualIncome
	 * @param mortgageInterest
	 * @param consumerExpenditureProfileKey
	 */
	public TaxPayerProfileEntity(List<PoliticalDivisionEntity> politicalDivisions,	MonetaryAmountEntity annualIncome,
			MonetaryAmountEntity mortgageInterest, String consumerExpenditureProfileKey) {
		super();
		this.timestamp = new Date();
		this.taxPayerProfileKey = UUID.randomUUID().toString();
		this.politicalDivisions = politicalDivisions;
		this.annualIncome = annualIncome;
		this.mortgageInterest = mortgageInterest;
		this.consumerExpenditureProfileKey = consumerExpenditureProfileKey;
	}

	/**
	 * @param politicalDivisions
	 * @param annualIncome
	 * @param mortgageInterest
	 * @param realPropertyMarketValue
	 * @param consumerExpenditureProfileKey
	 */
	public TaxPayerProfileEntity(List<PoliticalDivisionEntity> politicalDivisions,	MonetaryAmountEntity annualIncome,
								 MonetaryAmountEntity mortgageInterest, MonetaryAmountEntity realPropertyMarketValue, String consumerExpenditureProfileKey) {
		super();
		this.timestamp = new Date();
		this.taxPayerProfileKey = UUID.randomUUID().toString();
		this.politicalDivisions = politicalDivisions;
		this.annualIncome = annualIncome;
		this.mortgageInterest = mortgageInterest;
		this.realPropertyMarketValue = realPropertyMarketValue;
		this.consumerExpenditureProfileKey = consumerExpenditureProfileKey;
	}

	public TaxPayerProfileEntity(List<PoliticalDivisionEntity> politicalDivisions, MonetaryAmountEntity annualIncome, MonetaryAmountEntity mortgageInterest, MonetaryAmountEntity realPropertyMarketValue) {
		super();
		this.timestamp = new Date();
		this.taxPayerProfileKey = UUID.randomUUID().toString();
		this.politicalDivisions = politicalDivisions;
		this.annualIncome = annualIncome;
		this.mortgageInterest = mortgageInterest;
		this.realPropertyMarketValue = realPropertyMarketValue;
		this.consumerExpenditureProfileKey = BASIC_CONSUMER_EXPENDITURE_PROFILE_KEY;
	}

	public TaxPayerProfileEntity(List<PoliticalDivisionEntity> politicalDivisions, MonetaryAmountEntity annualIncome, MonetaryAmountEntity mortgageInterest, MonetaryAmountEntity realPropertyMarketValue, TaxFilingStatus taxFilingStatus, MonetaryAmountEntity preTaxContributions, MonetaryAmountEntity otherItemizedDeductions, Integer dependents) {
		super();
		this.timestamp = new Date();
		this.taxPayerProfileKey = UUID.randomUUID().toString();
		this.politicalDivisions = politicalDivisions;
		this.annualIncome = annualIncome;
		this.mortgageInterest = mortgageInterest;
		this.realPropertyMarketValue = realPropertyMarketValue;
		this.consumerExpenditureProfileKey = BASIC_CONSUMER_EXPENDITURE_PROFILE_KEY;
		this.taxFilingStatus = taxFilingStatus;
		this.preTaxContributions = preTaxContributions;
		this.otherItemizedDeductions = otherItemizedDeductions;
		this.dependents = dependents;
	}

	public TaxPayerProfileEntity(List<PoliticalDivisionEntity> politicalDivisions, MonetaryAmountEntity annualIncome, MonetaryAmountEntity mortgageInterest, MonetaryAmountEntity realPropertyMarketValue, String consumerExpenditureProfileKey, TaxFilingStatus taxFilingStatus, MonetaryAmountEntity preTaxContributions, MonetaryAmountEntity otherItemizedDeductions, Integer dependents) {
		super();
		this.timestamp = new Date();
		this.taxPayerProfileKey = UUID.randomUUID().toString();
		this.politicalDivisions = politicalDivisions;
		this.annualIncome = annualIncome;
		this.mortgageInterest = mortgageInterest;
		this.realPropertyMarketValue = realPropertyMarketValue;
		this.consumerExpenditureProfileKey = consumerExpenditureProfileKey;
		this.taxFilingStatus = taxFilingStatus;
		this.preTaxContributions = preTaxContributions;
		this.otherItemizedDeductions = otherItemizedDeductions;
		this.dependents = dependents;
	}

	public TaxPayerProfileEntity(List<PoliticalDivisionEntity> politicalDivisions, MonetaryAmountEntity annualIncome, MonetaryAmountEntity selfEmployedIncome, MonetaryAmountEntity capitalGainsIncome, MonetaryAmountEntity mortgageInterest, MonetaryAmountEntity realPropertyMarketValue, String consumerExpenditureProfileKey, TaxFilingStatus taxFilingStatus, MonetaryAmountEntity preTaxContributions, MonetaryAmountEntity otherItemizedDeductions, Integer dependents) {
		super();
		this.timestamp = new Date();
		this.taxPayerProfileKey = UUID.randomUUID().toString();
		this.politicalDivisions = politicalDivisions;
		this.annualIncome = annualIncome;
		this.selfEmployedIncome = selfEmployedIncome;
		this.capitalGainsIncome = capitalGainsIncome;
		this.mortgageInterest = mortgageInterest;
		this.realPropertyMarketValue = realPropertyMarketValue;
		this.consumerExpenditureProfileKey = consumerExpenditureProfileKey;
		this.taxFilingStatus = taxFilingStatus;
		this.preTaxContributions = preTaxContributions;
		this.otherItemizedDeductions = otherItemizedDeductions;
		this.dependents = dependents;
	}

	/**
	 * @param taxPayerProfileKey
	 * @param timestamp
	 * @param politicalDivisions
	 * @param annualIncome
	 * @param mortgageInterest
	 */
	public TaxPayerProfileEntity(String taxPayerProfileKey, Date timestamp,
			List<PoliticalDivisionEntity> politicalDivisions, MonetaryAmountEntity annualIncome,
			MonetaryAmountEntity mortgageInterest, String consumerExpenditureProfileKey) {
		super();
		if (taxPayerProfileKey == null) {
			this.taxPayerProfileKey = UUID.randomUUID().toString();
		} else {
			this.taxPayerProfileKey = taxPayerProfileKey;
		}
		if (timestamp == null) {
			this.timestamp = new Date();
		} else {
			this.timestamp = timestamp;
		}
		this.politicalDivisions = politicalDivisions;
		this.annualIncome = annualIncome;
		this.mortgageInterest = mortgageInterest;
		this.consumerExpenditureProfileKey = consumerExpenditureProfileKey;
	}

	public TaxPayerProfileEntity(String taxPayerProfileKey, Date timestamp, List<PoliticalDivisionEntity> politicalDivisions, MonetaryAmountEntity annualIncome, MonetaryAmountEntity mortgageInterest, MonetaryAmountEntity realPropertyMarketValue, String consumerExpenditureProfileKey) {
		super();
		if (taxPayerProfileKey == null) {
			this.taxPayerProfileKey = UUID.randomUUID().toString();
		} else {
			this.taxPayerProfileKey = taxPayerProfileKey;
		}
		if (timestamp == null) {
			this.timestamp = new Date();
		} else {
			this.timestamp = timestamp;
		}
		this.politicalDivisions = politicalDivisions;
		this.annualIncome = annualIncome;
		this.mortgageInterest = mortgageInterest;
		this.realPropertyMarketValue = realPropertyMarketValue;
		this.consumerExpenditureProfileKey = consumerExpenditureProfileKey;
	}

	public TaxPayerProfileEntity(String taxPayerProfileKey, Date timestamp, List<PoliticalDivisionEntity> politicalDivisions, MonetaryAmountEntity annualIncome, MonetaryAmountEntity mortgageInterest, MonetaryAmountEntity realPropertyMarketValue) {
		if (taxPayerProfileKey == null) {
			this.taxPayerProfileKey = UUID.randomUUID().toString();
		} else {
			this.taxPayerProfileKey = taxPayerProfileKey;
		}
		if (timestamp == null) {
			this.timestamp = new Date();
		} else {
			this.timestamp = timestamp;
		}
		this.politicalDivisions = politicalDivisions;
		this.annualIncome = annualIncome;
		this.mortgageInterest = mortgageInterest;
		this.realPropertyMarketValue = realPropertyMarketValue;
		this.consumerExpenditureProfileKey = BASIC_CONSUMER_EXPENDITURE_PROFILE_KEY;
	}

	public TaxPayerProfileEntity(String taxPayerProfileKey, Date timestamp, List<PoliticalDivisionEntity> politicalDivisions, MonetaryAmountEntity annualIncome, MonetaryAmountEntity mortgageInterest, MonetaryAmountEntity realPropertyMarketValue, TaxFilingStatus taxFilingStatus, MonetaryAmountEntity preTaxContributions, MonetaryAmountEntity otherItemizedDeductions, Integer dependents) {
		if (taxPayerProfileKey == null) {
			this.taxPayerProfileKey = UUID.randomUUID().toString();
		} else {
			this.taxPayerProfileKey = taxPayerProfileKey;
		}
		if (timestamp == null) {
			this.timestamp = new Date();
		} else {
			this.timestamp = timestamp;
		}
		this.politicalDivisions = politicalDivisions;
		this.annualIncome = annualIncome;
		this.mortgageInterest = mortgageInterest;
		this.realPropertyMarketValue = realPropertyMarketValue;
		this.consumerExpenditureProfileKey = BASIC_CONSUMER_EXPENDITURE_PROFILE_KEY;
		this.taxFilingStatus = taxFilingStatus;
		this.preTaxContributions = preTaxContributions;
		this.otherItemizedDeductions = otherItemizedDeductions;
		this.dependents = dependents;
	}

	public TaxPayerProfileEntity(String taxPayerProfileKey, Date timestamp, List<PoliticalDivisionEntity> politicalDivisions, MonetaryAmountEntity annualIncome, MonetaryAmountEntity selfEmployedIncome, MonetaryAmountEntity capitalGainsIncome, MonetaryAmountEntity mortgageInterest, MonetaryAmountEntity realPropertyMarketValue, String consumerExpenditureProfileKey, TaxFilingStatus taxFilingStatus, MonetaryAmountEntity preTaxContributions, MonetaryAmountEntity otherItemizedDeductions, Integer dependents) {
		if (taxPayerProfileKey == null) {
			this.taxPayerProfileKey = UUID.randomUUID().toString();
		} else {
			this.taxPayerProfileKey = taxPayerProfileKey;
		}
		if (timestamp == null) {
			this.timestamp = new Date();
		} else {
			this.timestamp = timestamp;
		}
		this.politicalDivisions = politicalDivisions;
		this.annualIncome = annualIncome;
		this.selfEmployedIncome = selfEmployedIncome;
		this.capitalGainsIncome = capitalGainsIncome;
		this.mortgageInterest = mortgageInterest;
		this.realPropertyMarketValue = realPropertyMarketValue;
		this.consumerExpenditureProfileKey = consumerExpenditureProfileKey;
		this.taxFilingStatus = taxFilingStatus;
		this.preTaxContributions = preTaxContributions;
		this.otherItemizedDeductions = otherItemizedDeductions;
		this.dependents = dependents;
	}

	public TaxPayerProfileEntity(TaxPayerProfile taxPayerProfile) {
		this(taxPayerProfile.getTaxPayerProfileKey(), taxPayerProfile.getTimestamp(), politicalDivisionListToPoliticalDivisionEntityList(taxPayerProfile.getPoliticalDivisions()), new MonetaryAmountEntity(taxPayerProfile.getAnnualIncome()), new MonetaryAmountEntity(taxPayerProfile.getSelfEmployedIncome()), new MonetaryAmountEntity(taxPayerProfile.getCapitalGainsIncome()), new MonetaryAmountEntity(taxPayerProfile.getMortgageInterest()), new MonetaryAmountEntity(taxPayerProfile.getRealPropertyMarketValue()), taxPayerProfile.getConsumerExpenditureProfileKey(), taxPayerProfile.getTaxFilingStatus(), new MonetaryAmountEntity(taxPayerProfile.getPreTaxContributions()), new MonetaryAmountEntity(taxPayerProfile.getOtherItemizedDeductions()), taxPayerProfile.getDependents());
	}

	public TaxPayerProfile toTaxPayerProfile() {
		return new TaxPayerProfile(this.getTaxPayerProfileKey(), this.getTimestamp(), politicalDivisionEntityListToPoliticalDivisionList(this.getPoliticalDivisions()), this.getAnnualIncome().toMonetaryAmount(), this.getSelfEmployedIncome().toMonetaryAmount(), this.getCapitalGainsIncome().toMonetaryAmount(), this.getMortgageInterest().toMonetaryAmount(), this.getRealPropertyMarketValue().toMonetaryAmount(), this.getConsumerExpenditureProfileKey(), this.getTaxFilingStatus(), this.getPreTaxContributions().toMonetaryAmount(), this.getOtherItemizedDeductions().toMonetaryAmount(), this.getDependents());
	}

	public static List<PoliticalDivisionEntity> politicalDivisionListToPoliticalDivisionEntityList(List<PoliticalDivision> politicalDivisions) {
		List<PoliticalDivisionEntity> politicalDivisionEntities = new ArrayList<PoliticalDivisionEntity>();
		for (PoliticalDivision politicalDivision : politicalDivisions) {
			politicalDivisionEntities.add(new PoliticalDivisionEntity(politicalDivision));
		}
		return politicalDivisionEntities;
	}

	public static List<PoliticalDivision> politicalDivisionEntityListToPoliticalDivisionList(List<PoliticalDivisionEntity> politicalDivisionEntities) {
		List<PoliticalDivision> politicalDivisions = new ArrayList<PoliticalDivision>();
		for (PoliticalDivisionEntity politicalDivisionEntity : politicalDivisionEntities) {
			politicalDivisions.add(politicalDivisionEntity.toPoliticalDivision());
		}
		return politicalDivisions;
	}

	/**
	 * @return the politicalDivisionKeys
	 */
	public List<PoliticalDivisionEntity> getPoliticalDivisions() {
		return politicalDivisions;
	}

	/**
	 * @return the annualIncome
	 */
	public MonetaryAmountEntity getAnnualIncome() {
		return annualIncome;
	}

	public MonetaryAmountEntity getSelfEmployedIncome() {
		return selfEmployedIncome;
	}

	public MonetaryAmountEntity getCapitalGainsIncome() {
		return capitalGainsIncome;
	}

	/**
	 * @return the mortgageInterest
	 */
	public MonetaryAmountEntity getMortgageInterest() {
		return mortgageInterest;
	}

	/**
	 * @param politicalDivisions the politicalDivisions to set
	 */
	public void setPoliticalDivisions(List<PoliticalDivisionEntity> politicalDivisions) {
		this.politicalDivisions = politicalDivisions;
	}

	/**
	 * @param annualIncome the annualIncome to set
	 */
	public void setAnnualIncome(MonetaryAmountEntity annualIncome) {
		this.annualIncome = annualIncome;
	}

	public void setSelfEmployedIncome(MonetaryAmountEntity selfEmployedIncome) {
		this.selfEmployedIncome = selfEmployedIncome;
	}

	public void setCapitalGainsIncome(MonetaryAmountEntity capitalGainsIncome) {
		this.capitalGainsIncome = capitalGainsIncome;
	}

	/**
	 * @param mortgageInterest the mortgageInterest to set
	 */
	public void setMortgageInterest(MonetaryAmountEntity mortgageInterest) {
		this.mortgageInterest = mortgageInterest;
	}

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @return the taxPayerProfileKey
	 */
	public String getTaxPayerProfileKey() {
		return taxPayerProfileKey;
	}

	/**
	 * @return the timestamp
	 */
	public Date getTimestamp() {
		return timestamp;
	}

	/**
	 * @return true if collection was changed
	 */
	public boolean addPoliticalDivision(PoliticalDivisionEntity politicalDivision) {
		return this.politicalDivisions.add(politicalDivision);
	}
	
	/**
	 * @return true if collection was changed
	 * 
	 */
	public boolean addPoliticalDivisionKeys(List<PoliticalDivisionEntity> politicalDivisions) {
		return this.politicalDivisions.addAll(politicalDivisions);
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

	public MonetaryAmountEntity getRealPropertyMarketValue() {
		return realPropertyMarketValue;
	}

	public void setRealPropertyMarketValue(MonetaryAmountEntity realPropertyMarketValue) {
		this.realPropertyMarketValue = realPropertyMarketValue;
	}

	public TaxFilingStatus getTaxFilingStatus() {
		return taxFilingStatus;
	}

	public void setTaxFilingStatus(TaxFilingStatus taxFilingStatus) {
		this.taxFilingStatus = taxFilingStatus;
	}

	public MonetaryAmountEntity getPreTaxContributions() {
		return preTaxContributions;
	}

	public void setPreTaxContributions(MonetaryAmountEntity preTaxContributions) {
		this.preTaxContributions = preTaxContributions;
	}

	public MonetaryAmountEntity getOtherItemizedDeductions() {
		return otherItemizedDeductions;
	}

	public void setOtherItemizedDeductions(MonetaryAmountEntity otherItemizedDeductions) {
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
		if (!(o instanceof TaxPayerProfileEntity)) return false;
		TaxPayerProfileEntity that = (TaxPayerProfileEntity) o;
		return Objects.equals(taxPayerProfileKey, that.taxPayerProfileKey) &&
				Objects.equals(timestamp, that.timestamp) &&
				Objects.equals(politicalDivisions, that.politicalDivisions) &&
				Objects.equals(annualIncome, that.annualIncome) &&
				Objects.equals(selfEmployedIncome, that.selfEmployedIncome) &&
				Objects.equals(capitalGainsIncome, that.capitalGainsIncome) &&
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
		return Objects.hash(taxPayerProfileKey, timestamp, politicalDivisions, annualIncome, selfEmployedIncome, capitalGainsIncome, mortgageInterest, realPropertyMarketValue, consumerExpenditureProfileKey, taxFilingStatus, preTaxContributions, otherItemizedDeductions, dependents);
	}

	@Override
	public String toString() {
		return "TaxPayerProfileEntity{" +
				"id=" + id +
				", taxPayerProfileKey='" + taxPayerProfileKey + '\'' +
				", timestamp=" + timestamp +
				", politicalDivisions=" + politicalDivisions +
				", annualIncome=" + annualIncome +
				", selfEmployedIncome=" + selfEmployedIncome +
				", capitalGainsIncome=" + capitalGainsIncome +
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
