package com.ttb.service.taxburden.repositories;

import com.ttb.service.taxburden.entities.BoundaryCountryEntity;
import com.ttb.service.taxburden.entities.BoundaryStateEntity;
import com.ttb.service.taxburden.entities.PoliticalDivisionEntity;
import com.vividsolutions.jts.geom.Geometry;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BoundaryCountryRepository extends CrudRepository<BoundaryCountryEntity, Long> {

    @Query(value = "select pde from #{#entityName} bce, PoliticalDivisionEntity pde " +
            "where st_contains(bce.geom, :location) = true and bce.geoid = pde.fips")
    List<PoliticalDivisionEntity> contains(Geometry location);

    @Query(value = "select pde from #{#entityName} bce, BoundaryPostalCodeEntity bpce, PoliticalDivisionEntity pde " +
            "where bpce.zcta5ce10 = :postalCode and st_intersects(bce.geom, bpce.geom) = true and bce.geoid = pde.fips")
    List<PoliticalDivisionEntity> contains(String postalCode);

    BoundaryCountryEntity findByName(String name);
    BoundaryCountryEntity findByGeoid(String statefp);
}
