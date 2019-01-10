package com.ttb.service.taxburden.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Objects;

/**
 * Support attributes for income tax calculation
 */
@Entity
@Table(name="income_tax_definition")
public class IncomeTaxDefinitionEntity {
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@Column(unique=true)
	private String taxDefinitionKey;
	private Integer standardDeductionSingle;
	private Integer standardDeductionJoint;
	private Integer standardDeductionMarriedFilingSeparate;
	private Integer standardDeductionHeadOfHousehold;
	private Integer personalExemptionSingle;
	private Integer personalExemptionJoint;
	private Integer personalExemptionMarriedFilingSeparate;
	private Integer personalExemptionHeadOfHousehold;
	private Integer dependentExemption;
	private boolean deductItemized = false;
	private boolean deductPreTaxContributions = false;

	public IncomeTaxDefinitionEntity() {
		super();
	}

	public IncomeTaxDefinitionEntity(String taxDefinitionKey, Integer standardDeductionSingle, Integer standardDeductionJoint, Integer standardDeductionMarriedFilingSeparate, Integer standardDeductionHeadOfHousehold, Integer personalExemptionSingle, Integer personalExemptionJoint, Integer personalExemptionMarriedFilingSeparate, Integer personalExemptionHeadOfHousehold, Integer dependentExemption) {
		this.taxDefinitionKey = taxDefinitionKey;
		this.standardDeductionSingle = standardDeductionSingle;
		this.standardDeductionJoint = standardDeductionJoint;
		this.standardDeductionMarriedFilingSeparate = standardDeductionMarriedFilingSeparate;
		this.standardDeductionHeadOfHousehold = standardDeductionHeadOfHousehold;
		this.personalExemptionSingle = personalExemptionSingle;
		this.personalExemptionJoint = personalExemptionJoint;
		this.personalExemptionMarriedFilingSeparate = personalExemptionMarriedFilingSeparate;
		this.personalExemptionHeadOfHousehold = personalExemptionHeadOfHousehold;
		this.dependentExemption = dependentExemption;
	}

	public IncomeTaxDefinitionEntity(String taxDefinitionKey, Integer standardDeductionSingle, Integer standardDeductionJoint, Integer standardDeductionMarriedFilingSeparate, Integer standardDeductionHeadOfHousehold, Integer personalExemptionSingle, Integer personalExemptionJoint, Integer personalExemptionMarriedFilingSeparate, Integer personalExemptionHeadOfHousehold, Integer dependentExemption, boolean deductItemized, boolean deductPreTaxContributions) {
		this.taxDefinitionKey = taxDefinitionKey;
		this.standardDeductionSingle = standardDeductionSingle;
		this.standardDeductionJoint = standardDeductionJoint;
		this.standardDeductionMarriedFilingSeparate = standardDeductionMarriedFilingSeparate;
		this.standardDeductionHeadOfHousehold = standardDeductionHeadOfHousehold;
		this.personalExemptionSingle = personalExemptionSingle;
		this.personalExemptionJoint = personalExemptionJoint;
		this.personalExemptionMarriedFilingSeparate = personalExemptionMarriedFilingSeparate;
		this.personalExemptionHeadOfHousehold = personalExemptionHeadOfHousehold;
		this.dependentExemption = dependentExemption;
		this.deductItemized = deductItemized;
		this.deductPreTaxContributions = deductPreTaxContributions;
	}

	public Long getId() {
		return id;
	}

	public String getTaxDefinitionKey() {
		return taxDefinitionKey;
	}

	public void setTaxDefinitionKey(String taxDefinitionKey) {
		this.taxDefinitionKey = taxDefinitionKey;
	}

	public Integer getStandardDeductionSingle() {
		return standardDeductionSingle;
	}

	public void setStandardDeductionSingle(Integer standardDeductionSingle) {
		this.standardDeductionSingle = standardDeductionSingle;
	}

	public Integer getStandardDeductionJoint() {
		return standardDeductionJoint;
	}

	public void setStandardDeductionJoint(Integer standardDeductionJoint) {
		this.standardDeductionJoint = standardDeductionJoint;
	}

	public Integer getStandardDeductionMarriedFilingSeparate() {
		return standardDeductionMarriedFilingSeparate;
	}

	public void setStandardDeductionMarriedFilingSeparate(Integer standardDeductionMarriedFilingSeparate) {
		this.standardDeductionMarriedFilingSeparate = standardDeductionMarriedFilingSeparate;
	}

	public Integer getStandardDeductionHeadOfHousehold() {
		return standardDeductionHeadOfHousehold;
	}

	public void setStandardDeductionHeadOfHousehold(Integer standardDeductionHeadOfHousehold) {
		this.standardDeductionHeadOfHousehold = standardDeductionHeadOfHousehold;
	}

	public Integer getPersonalExemptionSingle() {
		return personalExemptionSingle;
	}

	public void setPersonalExemptionSingle(Integer personalExemptionSingle) {
		this.personalExemptionSingle = personalExemptionSingle;
	}

	public Integer getPersonalExemptionJoint() {
		return personalExemptionJoint;
	}

	public void setPersonalExemptionJoint(Integer personalExemptionJoint) {
		this.personalExemptionJoint = personalExemptionJoint;
	}

	public Integer getPersonalExemptionMarriedFilingSeparate() {
		return personalExemptionMarriedFilingSeparate;
	}

	public void setPersonalExemptionMarriedFilingSeparate(Integer personalExemptionMarriedFilingSeparate) {
		this.personalExemptionMarriedFilingSeparate = personalExemptionMarriedFilingSeparate;
	}

	public Integer getPersonalExemptionHeadOfHousehold() {
		return personalExemptionHeadOfHousehold;
	}

	public void setPersonalExemptionHeadOfHousehold(Integer personalExemptionHeadOfHousehold) {
		this.personalExemptionHeadOfHousehold = personalExemptionHeadOfHousehold;
	}

	public Integer getDependentExemption() {
		return dependentExemption;
	}

	public void setDependentExemption(Integer dependentExemption) {
		this.dependentExemption = dependentExemption;
	}

	public boolean isDeductItemized() {
		return deductItemized;
	}

	public void setDeductItemized(boolean deductItemized) {
		this.deductItemized = deductItemized;
	}

	public boolean isDeductPreTaxContributions() {
		return deductPreTaxContributions;
	}

	public void setDeductPreTaxContributions(boolean deductPreTaxContributions) {
		this.deductPreTaxContributions = deductPreTaxContributions;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (!(o instanceof IncomeTaxDefinitionEntity)) return false;
		IncomeTaxDefinitionEntity that = (IncomeTaxDefinitionEntity) o;
		return deductItemized == that.deductItemized &&
				deductPreTaxContributions == that.deductPreTaxContributions &&
				Objects.equals(taxDefinitionKey, that.taxDefinitionKey) &&
				Objects.equals(standardDeductionSingle, that.standardDeductionSingle) &&
				Objects.equals(standardDeductionJoint, that.standardDeductionJoint) &&
				Objects.equals(standardDeductionMarriedFilingSeparate, that.standardDeductionMarriedFilingSeparate) &&
				Objects.equals(standardDeductionHeadOfHousehold, that.standardDeductionHeadOfHousehold) &&
				Objects.equals(personalExemptionSingle, that.personalExemptionSingle) &&
				Objects.equals(personalExemptionJoint, that.personalExemptionJoint) &&
				Objects.equals(personalExemptionMarriedFilingSeparate, that.personalExemptionMarriedFilingSeparate) &&
				Objects.equals(personalExemptionHeadOfHousehold, that.personalExemptionHeadOfHousehold) &&
				Objects.equals(dependentExemption, that.dependentExemption);
	}

	@Override
	public int hashCode() {
		return Objects.hash(taxDefinitionKey, standardDeductionSingle, standardDeductionJoint, standardDeductionMarriedFilingSeparate, standardDeductionHeadOfHousehold, personalExemptionSingle, personalExemptionJoint, personalExemptionMarriedFilingSeparate, personalExemptionHeadOfHousehold, dependentExemption, deductItemized, deductPreTaxContributions);
	}

	@Override
	public String toString() {
		return "IncomeTaxDefinitionEntity{" +
				"id=" + id +
				", taxDefinitionKey='" + taxDefinitionKey + '\'' +
				", standardDeductionSingle=" + standardDeductionSingle +
				", standardDeductionJoint=" + standardDeductionJoint +
				", standardDeductionMarriedFilingSeparate=" + standardDeductionMarriedFilingSeparate +
				", standardDeductionHeadOfHousehold=" + standardDeductionHeadOfHousehold +
				", personalExemptionSingle=" + personalExemptionSingle +
				", personalExemptionJoint=" + personalExemptionJoint +
				", personalExemptionMarriedFilingSeparate=" + personalExemptionMarriedFilingSeparate +
				", personalExemptionHeadOfHousehold=" + personalExemptionHeadOfHousehold +
				", dependentExemption=" + dependentExemption +
				", deductItemized=" + deductItemized +
				", deductPreTaxContributions=" + deductPreTaxContributions +
				'}';
	}
}
