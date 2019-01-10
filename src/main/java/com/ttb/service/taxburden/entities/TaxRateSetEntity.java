package com.ttb.service.taxburden.entities;

import com.ttb.service.taxburden.domain.TaxFilingStatus;

import java.util.List;
import java.util.Objects;

import javax.persistence.*;

@Entity
@Table(name="tax_rate_set")
public class TaxRateSetEntity {
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
    private String taxDefinitionKey;
    @Enumerated(EnumType.STRING)
    private TaxFilingStatus taxFilingStatus;
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable
            (
                    name="tax_rate_set_tax_rates",
                    joinColumns={ @JoinColumn(name="tax_rate_set_id", referencedColumnName="id") },
                    inverseJoinColumns={ @JoinColumn(name="tax_rate_id", referencedColumnName="id") }
            )
    private List<TaxRateEntity> taxRates;

    public TaxRateSetEntity() {
    }

    public TaxRateSetEntity(String taxDefinitionKey, List<TaxRateEntity> taxRates) {
        this.taxDefinitionKey = taxDefinitionKey;
        this.taxRates = taxRates;
        this.taxFilingStatus = TaxFilingStatus.NONE;
    }

    public TaxRateSetEntity(String taxDefinitionKey, TaxFilingStatus taxFilingStatus, List<TaxRateEntity> taxRates) {
        this.taxDefinitionKey = taxDefinitionKey;
        this.taxFilingStatus = taxFilingStatus;
        this.taxRates = taxRates;
    }

    public long getId() {
        return id;
    }

    public String getTaxDefinitionKey() {
        return taxDefinitionKey;
    }

    public void setTaxDefinitionKey(String taxDefinitionKey) {
        this.taxDefinitionKey = taxDefinitionKey;
    }

    public TaxFilingStatus getTaxFilingStatus() {
        return taxFilingStatus;
    }

    public void setTaxFilingStatus(TaxFilingStatus taxFilingStatus) {
        this.taxFilingStatus = taxFilingStatus;
    }

    public List<TaxRateEntity> getTaxRates() {
        return taxRates;
    }

    public void setTaxRates(List<TaxRateEntity> taxRates) {
        this.taxRates = taxRates;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TaxRateSetEntity)) return false;
        TaxRateSetEntity that = (TaxRateSetEntity) o;
        return Objects.equals(taxDefinitionKey, that.taxDefinitionKey) &&
                taxFilingStatus == that.taxFilingStatus &&
                Objects.equals(taxRates, that.taxRates);
    }

    @Override
    public int hashCode() {
        return Objects.hash(taxDefinitionKey, taxFilingStatus, taxRates);
    }

    @Override
    public String toString() {
        return "TaxRateSetEntity{" +
                "id=" + id +
                ", taxDefinitionKey='" + taxDefinitionKey + '\'' +
                ", taxFilingStatus=" + taxFilingStatus +
                ", taxRates=" + taxRates +
                '}';
    }
}
