package com.ttb.service.taxburden.entities;

import javax.persistence.*;

import com.ttb.service.taxburden.domain.PoliticalDivision;
import com.ttb.service.taxburden.domain.PoliticalDivisionType;

import java.util.Objects;


@Entity
@Table(name="political_division")
public class PoliticalDivisionEntity {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@Column(unique=true, nullable=false)
	private String fips;
	private String name;
	private String description;
	@Enumerated(EnumType.STRING)
	private PoliticalDivisionType type;
	
	protected PoliticalDivisionEntity() {}

	public PoliticalDivisionEntity(String fips, String name, String description, PoliticalDivisionType type) {
		this.fips = fips;
		this.name = name;
		this.description = description;
		this.type = type;
	}

	public PoliticalDivisionEntity(PoliticalDivision politicalDivision) {
		this(politicalDivision.getFips(), politicalDivision.getName(), politicalDivision.getDescription(), politicalDivision.getType());
	}
	
	public PoliticalDivision toPoliticalDivision() {
		return new PoliticalDivision(this.getFips(), this.getName(), this.getDescription(), this.getType());
	}

	/**
	 * @return the fips
	 */
	public String getFips() {
		return fips;
	}

	/**
	 * @param fips the fips to set
	 */
	public void setFips(String fips) {
		this.fips = fips;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	public PoliticalDivisionType getType() {
		return type;
	}

	public void setType(PoliticalDivisionType type) {
		this.type = type;
	}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (!(o instanceof PoliticalDivisionEntity)) return false;
		PoliticalDivisionEntity that = (PoliticalDivisionEntity) o;
		return Objects.equals(fips, that.fips) &&
				Objects.equals(name, that.name) &&
				Objects.equals(description, that.description) &&
				type == that.type;
	}

	@Override
	public int hashCode() {
		return Objects.hash(fips, name, description, type);
	}

	@Override
	public String toString() {
		return "PoliticalDivisionEntity{" +
				"id=" + id +
				", fips='" + fips + '\'' +
				", name='" + name + '\'' +
				", description='" + description + '\'' +
				", type=" + type +
				'}';
	}
}
