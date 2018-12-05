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
@Table(name = "boundary_place")
public class BoundaryPlaceEntity {
    @Id
    private Long gid;
    private Geometry geom;
    private String statefp;
    private String placefp;
    private String placens;
    private String affgeoid;
    private String geoid;
    private String name;
    private String lsad;
    private BigInteger aland;
    private BigInteger awater;

    public BoundaryPlaceEntity() {
        super();
    }

    public BoundaryPlaceEntity(Geometry geom, String statefp, String placefp, String placens, String affgeoid, String geoid, String name, String lsad, BigInteger aland, BigInteger awater) {
        this.geom = geom;
        this.statefp = statefp;
        this.placefp = placefp;
        this.placens = placens;
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

    public String getPlacefp() {
        return placefp;
    }

    public void setPlacefp(String placefp) {
        this.placefp = placefp;
    }

    public String getPlacens() {
        return placens;
    }

    public void setPlacens(String placens) {
        this.placens = placens;
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
        if (!(o instanceof BoundaryPlaceEntity)) return false;
        BoundaryPlaceEntity that = (BoundaryPlaceEntity) o;
        return Objects.equals(geom, that.geom) &&
                Objects.equals(statefp, that.statefp) &&
                Objects.equals(placefp, that.placefp) &&
                Objects.equals(placens, that.placens) &&
                Objects.equals(affgeoid, that.affgeoid) &&
                Objects.equals(geoid, that.geoid) &&
                Objects.equals(name, that.name) &&
                Objects.equals(lsad, that.lsad) &&
                Objects.equals(aland, that.aland) &&
                Objects.equals(awater, that.awater);
    }

    @Override
    public int hashCode() {
        return Objects.hash(geom, statefp, placefp, placens, affgeoid, geoid, name, lsad, aland, awater);
    }

    @Override
    public String toString() {
        return "BoundaryPlaceEntity{" +
                "gid=" + gid +
                ", geom=" + geom +
                ", statefp='" + statefp + '\'' +
                ", placefp='" + placefp + '\'' +
                ", placens='" + placens + '\'' +
                ", affgeoid='" + affgeoid + '\'' +
                ", geoid='" + geoid + '\'' +
                ", name='" + name + '\'' +
                ", lsad='" + lsad + '\'' +
                ", aland=" + aland +
                ", awater=" + awater +
                '}';
    }
}
