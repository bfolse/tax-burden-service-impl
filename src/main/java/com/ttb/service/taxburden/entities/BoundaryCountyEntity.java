package com.ttb.service.taxburden.entities;

import javax.persistence.*;
import java.math.BigInteger;
import java.util.Objects;

import com.vividsolutions.jts.geom.Geometry;

/**
 *
 */
@Entity
@Table(name = "boundary_county")
public class BoundaryCountyEntity {
    @Id
    private Long gid;
    private Geometry geom;
    private String statefp;
    private String countyfp;
    private String countyns;
    private String affgeoid;
    private String geoid;
    private String name;
    private String lsad;
    private BigInteger aland;
    private BigInteger awater;

    public BoundaryCountyEntity() {
        super();
    }

    public BoundaryCountyEntity(Geometry geom, String statefp, String countyfp, String countyns, String affgeoid,
                                String geoid, String name, String lsad, BigInteger aland, BigInteger awater) {
        this.geom = geom;
        this.statefp = statefp;
        this.countyfp = countyfp;
        this.countyns = countyns;
        this.affgeoid = affgeoid;
        this.geoid = geoid;
        this.name = name;
        this.lsad = lsad;
        this.aland = aland;
        this.awater = awater;
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

    public String getStatefp() {
        return statefp;
    }

    public void setStatefp(String statefp) {
        this.statefp = statefp;
    }

    public String getCountyfp() {
        return countyfp;
    }

    public void setCountyfp(String countyfp) {
        this.countyfp = countyfp;
    }

    public String getCountyns() {
        return countyns;
    }

    public void setCountyns(String countyns) {
        this.countyns = countyns;
    }

    public String getAffgeoid() {
        return affgeoid;
    }

    public void setAffgeoid(String affgeoid) {
        this.affgeoid = affgeoid;
    }

    public String getGeoid() {
        return geoid;
    }

    public void setGeoid(String geoid) {
        this.geoid = geoid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLsad() {
        return lsad;
    }

    public void setLsad(String lsad) {
        this.lsad = lsad;
    }

    public BigInteger getAland() {
        return aland;
    }

    public void setAland(BigInteger aland) {
        this.aland = aland;
    }

    public BigInteger getAwater() {
        return awater;
    }

    public void setAwater(BigInteger awater) {
        this.awater = awater;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof BoundaryCountyEntity)) return false;
        BoundaryCountyEntity that = (BoundaryCountyEntity) o;
        return Objects.equals(geom, that.geom) &&
                Objects.equals(statefp, that.statefp) &&
                Objects.equals(countyfp, that.countyfp) &&
                Objects.equals(countyns, that.countyns) &&
                Objects.equals(affgeoid, that.affgeoid) &&
                Objects.equals(geoid, that.geoid) &&
                Objects.equals(name, that.name) &&
                Objects.equals(lsad, that.lsad) &&
                Objects.equals(aland, that.aland) &&
                Objects.equals(awater, that.awater);
    }

    @Override
    public int hashCode() {
        return Objects.hash(geom, statefp, countyfp, countyns, affgeoid, geoid, name, lsad, aland, awater);
    }

    @Override
    public String toString() {
        return "BoundaryCountyEntity{" +
                "gid=" + gid +
                ", geom=" + geom +
                ", statefp='" + statefp + '\'' +
                ", countyfp='" + countyfp + '\'' +
                ", countyns='" + countyns + '\'' +
                ", affgeoid='" + affgeoid + '\'' +
                ", geoid='" + geoid + '\'' +
                ", name='" + name + '\'' +
                ", lsad='" + lsad + '\'' +
                ", aland=" + aland +
                ", awater=" + awater +
                '}';
    }
}