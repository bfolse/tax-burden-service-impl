package com.ttb.service.taxburden.entities;

import com.vividsolutions.jts.geom.Geometry;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Objects;

/**
 *
 */
@Entity
@Table(name = "boundary_country")
public class BoundaryCountryEntity {
    @Id
    private Long gid;
    private Geometry geom;
    private String affgeoid;
    private String geoid;
    private String name;

    public BoundaryCountryEntity() {
        super();
    }

    public BoundaryCountryEntity(Geometry geom, String affgeoid, String geoid, String name) {
        this.geom = geom;
        this.affgeoid = affgeoid;
        this.geoid = geoid;
        this.name = name;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof BoundaryCountryEntity)) return false;
        BoundaryCountryEntity that = (BoundaryCountryEntity) o;
        return Objects.equals(geom, that.geom) &&
                Objects.equals(affgeoid, that.affgeoid) &&
                Objects.equals(geoid, that.geoid) &&
                Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(geom, affgeoid, geoid, name);
    }

    @Override
    public String toString() {
        return "BoundaryCountryEntity{" +
                "gid=" + gid +
                ", geom=" + geom +
                ", affgeoid='" + affgeoid + '\'' +
                ", geoid='" + geoid + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}