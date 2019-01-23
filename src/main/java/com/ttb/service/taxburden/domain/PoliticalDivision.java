package com.ttb.service.taxburden.domain;

import java.util.Objects;

public class PoliticalDivision {
	private String fips;
	private String name;
	private String description;
	private PoliticalDivisionType type;

	public PoliticalDivision() {
		super();
	}

	public PoliticalDivision(String fips, String name, String description, PoliticalDivisionType type) {
		this.fips = fips;
		this.name = name;
		this.description = description;
		this.type = type;
	}

	public String getFips() {
		return fips;
	}

	public void setFips(String fips) {
		this.fips = fips;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public PoliticalDivisionType getType() {
		return type;
	}

	public void setType(PoliticalDivisionType type) {
		this.type = type;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (!(o instanceof PoliticalDivision)) return false;
		PoliticalDivision that = (PoliticalDivision) o;
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
		return "PoliticalDivision{" +
				"fips='" + fips + '\'' +
				", name='" + name + '\'' +
				", description='" + description + '\'' +
				", type=" + type +
				'}';
	}
}
