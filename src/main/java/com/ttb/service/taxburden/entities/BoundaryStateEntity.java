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
@Table(name = "boundary_state")
public class BoundaryStateEntity {
    @Id
    private Long gid;
    private Geometry geom;
    private String statefp;
    private String statens;
    private String affgeoid;
    private String geoid;
    private String stusps;
    private String name;
    private String lsad;
    private BigInteger aland;
    private BigInteger awater;

    public BoundaryStateEntity() {
        super();
    }

    public BoundaryStateEntity(Geometry geom, String statefp, String statens, String affgeoid, String geoid, String stusps, String name, String lsad, BigInteger aland, BigInteger awater) {
        this.geom = geom;
        this.statefp = statefp;
        this.statens = statens;
        this.affgeoid = affgeoid;
        this.geoid = geoid;
        this.stusps = stusps;
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

    public String getStatens() {
        return statens;
    }

    public void setStatens(String statens) {
        this.statens = statens;
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

    public String getStusps() {
        return stusps;
    }

    public void setStusps(String stusps) {
        this.stusps = stusps;
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
        if (!(o instanceof BoundaryStateEntity)) return false;
        BoundaryStateEntity that = (BoundaryStateEntity) o;
        return Objects.equals(geom, that.geom) &&
                Objects.equals(statefp, that.statefp) &&
                Objects.equals(statens, that.statens) &&
                Objects.equals(affgeoid, that.affgeoid) &&
                Objects.equals(geoid, that.geoid) &&
                Objects.equals(stusps, that.stusps) &&
                Objects.equals(name, that.name) &&
                Objects.equals(lsad, that.lsad) &&
                Objects.equals(aland, that.aland) &&
                Objects.equals(awater, that.awater);
    }

    @Override
    public int hashCode() {
        return Objects.hash(geom, statefp, statens, affgeoid, geoid, stusps, name, lsad, aland, awater);
    }

    @Override
    public String toString() {
        return "BoundaryStateEntity{" +
                "gid=" + gid +
                ", geom=" + geom +
                ", statefp='" + statefp + '\'' +
                ", statens='" + statens + '\'' +
                ", affgeoid='" + affgeoid + '\'' +
                ", geoid='" + geoid + '\'' +
                ", stusps='" + stusps + '\'' +
                ", name='" + name + '\'' +
                ", lsad='" + lsad + '\'' +
                ", aland=" + aland +
                ", awater=" + awater +
                '}';
    }
}