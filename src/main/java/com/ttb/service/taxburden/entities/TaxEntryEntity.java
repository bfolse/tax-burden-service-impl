package com.ttb.service.taxburden.entities;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.ttb.service.taxburden.domain.TaxEntry;
import com.ttb.service.taxburden.domain.TaxType;

import java.util.Objects;

@Entity
@Table(name="tax_entry")
public class TaxEntryEntity {
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private TaxType taxType;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="POLITICAL_DIVISION_ID")
	private PoliticalDivisionEntity politicalDivision;
	private String description;
	@OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
	private MonetaryAmountEntity amount;
	
	protected TaxEntryEntity() {}
	
	/**
	 * @param taxType
	 * @param politicalDivision
	 * @param description
	 * @param amount
	 */
	public TaxEntryEntity(TaxType taxType, PoliticalDivisionEntity politicalDivision, String description, MonetaryAmountEntity amount) {
		super();
		this.taxType = taxType;
		this.politicalDivision = politicalDivision;
		this.description = description;
		this.amount = amount;
	}
	
	public TaxEntryEntity(TaxEntry taxEntry) {
		this(taxEntry.getTaxType(), new PoliticalDivisionEntity(taxEntry.getPoliticalDivision()), taxEntry.getDescription(), new MonetaryAmountEntity(taxEntry.getAmount()));
	}
	
	public TaxEntry toTaxEntry() {
		return new TaxEntry(this.getTaxType(), this.getPoliticalDivision().toPoliticalDivision(), this.getDescription(), this.getAmount().toMonetaryAmount());
	}
	
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	
	/**
	 * @return the taxType
	 */
	public TaxType getTaxType() {
		return taxType;
	}
	
	/**
	 * @return the amount
	 */
	public MonetaryAmountEntity getAmount() {
		return amount;
	}

	/**
	 * @return the politicalDivision
	 */
	public PoliticalDivisionEntity getPoliticalDivision() {
		return politicalDivision;
	}

	/**
	 * @param politicalDivision the politicalDivision to set
	 */
	public void setPoliticalDivision(PoliticalDivisionEntity politicalDivision) {
		this.politicalDivision = politicalDivision;
	}

	/**
	 * @param taxType the taxType to set
	 */
	public void setTaxType(TaxType taxType) {
		this.taxType = taxType;
	}

	/**
	 * @param amount the amount to set
	 */
	public void setAmount(MonetaryAmountEntity amount) {
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
		if (!(o instanceof TaxEntryEntity)) return false;
		TaxEntryEntity that = (TaxEntryEntity) o;
		return taxType == that.taxType &&
				Objects.equals(politicalDivision, that.politicalDivision) &&
				Objects.equals(description, that.description) &&
				Objects.equals(amount, that.amount);
	}

	@Override
	public int hashCode() {
		return Objects.hash(taxType, politicalDivision, description, amount);
	}

	@Override
	public String toString() {
		return "TaxEntryEntity{" +
				"id=" + id +
				", taxType=" + taxType +
				", politicalDivision=" + politicalDivision +
				", description='" + description + '\'' +
				", amount=" + amount +
				'}';
	}
}
