package com.ttb.service.taxburden.domain;


import java.util.Objects;

public class TaxEntry {
	private TaxType taxType;
	private PoliticalDivision politicalDivision;
	private String description;
	private MonetaryAmount amount;

	/**
	 * 
	 */
	public TaxEntry() {
		super();
	}

	/**
	 * @param taxType
	 * @param politicalDivision
	 * @param amount
	 */
	public TaxEntry(TaxType taxType, PoliticalDivision politicalDivision, String description, MonetaryAmount amount) {
		super();
		this.taxType = taxType;
		this.politicalDivision = politicalDivision;
		this.description = description;
		this.amount = amount;
	}

	/**
	 * @return the taxType
	 */
	public TaxType getTaxType() {
		return taxType;
	}

	/**
	 * @param taxType the taxType to set
	 */
	public void setTaxType(TaxType taxType) {
		this.taxType = taxType;
	}

	/**
	 * @return the politicalDivision
	 */
	public PoliticalDivision getPoliticalDivision() {
		return politicalDivision;
	}

	/**
	 * @param politicalDivision the politicalDivision to set
	 */
	public void setPoliticalDivision(PoliticalDivision politicalDivision) {
		this.politicalDivision = politicalDivision;
	}

	/**
	 * @return the amount
	 */
	public MonetaryAmount getAmount() {
		return amount;
	}

	/**
	 * @param amount the amount to set
	 */
	public void setAmount(MonetaryAmount amount) {
		this.amount = amount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (!(o instanceof TaxEntry)) return false;
		TaxEntry taxEntry = (TaxEntry) o;
		return taxType == taxEntry.taxType &&
				Objects.equals(politicalDivision, taxEntry.politicalDivision) &&
				Objects.equals(description, taxEntry.description) &&
				Objects.equals(amount, taxEntry.amount);
	}

	@Override
	public int hashCode() {
		return Objects.hash(taxType, politicalDivision, description, amount);
	}

	@Override
	public String toString() {
		return "TaxEntry{" +
				"taxType=" + taxType +
				", politicalDivision=" + politicalDivision +
				", description='" + description + '\'' +
				", amount=" + amount +
				'}';
	}
}
