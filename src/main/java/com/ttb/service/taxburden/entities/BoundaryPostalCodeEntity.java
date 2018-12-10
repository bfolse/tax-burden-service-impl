package com.ttb.service.taxburden.entities;

import com.vividsolutions.jts.geom.Geometry;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigInteger;
import java.util.Objects;

/**
 *
 */
@Entity
@Table(name = "boundary_postal_code")
public class BoundaryPostalCodeEntity {
    @Id
    private Long gid;
    private Geometry geom;
    private String zcta5ce10;
    private String affgeoid10;
    private String geoid10;
    private BigInteger aland10;
    private BigInteger awater10;

    public BoundaryPostalCodeEntity() {
        super();
    }

    public BoundaryPostalCodeEntity(Geometry geom, String zcta5ce10, String affgeoid10, String geoid10, BigInteger aland10, BigInteger awater10) {
        this.geom = geom;
        this.zcta5ce10 = zcta5ce10;
        this.affgeoid10 = affgeoid10;
        this.geoid10 = geoid10;
        this.aland10 = aland10;
        this.awater10 = awater10;
    }

    public Long getGid() {
        return gid;
    }

    public Geometry getGeom() {
        return geom;
    }

    public void setGeom(Geometry geom) {
        this.geom = geom;
    }

    public String getZcta5ce10() {
        return zcta5ce10;
    }

    public void setZcta5ce10(String zcta5ce10) {
        this.zcta5ce10 = zcta5ce10;
    }

    public String getAffgeoid10() {
        return affgeoid10;
    }

    public void setAffgeoid10(String affgeoid10) {
        this.affgeoid10 = affgeoid10;
    }

    public String getGeoid10() {
        return geoid10;
    }

    public void setGeoid10(String geoid10) {
        this.geoid10 = geoid10;
    }

    public BigInteger getAland10() {
        return aland10;
    }

    public void setAland10(BigInteger aland10) {
        this.aland10 = aland10;
    }

    public BigInteger getAwater10() {
        return awater10;
    }

    public void setAwater10(BigInteger awater10) {
        this.awater10 = awater10;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof BoundaryPostalCodeEntity)) return false;
        BoundaryPostalCodeEntity that = (BoundaryPostalCodeEntity) o;
        return Objects.equals(geom, that.geom) &&
                Objects.equals(zcta5ce10, that.zcta5ce10) &&
                Objects.equals(affgeoid10, that.affgeoid10) &&
                Objects.equals(geoid10, that.geoid10) &&
                Objects.equals(aland10, that.aland10) &&
                Objects.equals(awater10, that.awater10);
    }

    @Override
    public int hashCode() {
        return Objects.hash(geom, zcta5ce10, affgeoid10, geoid10, aland10, awater10);
    }

    @Override
    public String toString() {
        return "BoundaryPostalCodeEntity{" +
                "gid=" + gid +
                ", geom=" + geom +
                ", zcta5ce10='" + zcta5ce10 + '\'' +
                ", affgeoid10='" + affgeoid10 + '\'' +
                ", geoid10='" + geoid10 + '\'' +
                ", aland10=" + aland10 +
                ", awater10=" + awater10 +
                '}';
    }
}