package com.ttb.service.taxburden.repositories;

import com.ttb.service.taxburden.entities.BoundaryStateEntity;
import com.ttb.service.taxburden.entities.PoliticalDivisionEntity;
import com.vividsolutions.jts.geom.Geometry;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BoundaryStateRepository extends CrudRepository<BoundaryStateEntity, Long> {

    @Query(value = "select pde from #{#entityName} bse, PoliticalDivisionEntity pde " +
            "where st_contains(bse.geom, :location) = true and bse.statefp = pde.fips")
    List<PoliticalDivisionEntity> contains(Geometry location);

    @Query(value = "select pde from #{#entityName} bse, BoundaryPostalCodeEntity bpce, PoliticalDivisionEntity pde " +
            "where bpce.zcta5ce10 = :postalCode and st_intersects(bse.geom, bpce.geom) = true and bse.statefp = pde.fips")
    List<PoliticalDivisionEntity> contains(String postalCode);

    BoundaryStateEntity findByName(String name);
    BoundaryStateEntity findByStatefp(String statefp);
}
