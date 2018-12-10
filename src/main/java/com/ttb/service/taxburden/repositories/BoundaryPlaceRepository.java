package com.ttb.service.taxburden.repositories;

import com.ttb.service.taxburden.entities.BoundaryCountyEntity;
import com.ttb.service.taxburden.entities.BoundaryPlaceEntity;
import com.ttb.service.taxburden.entities.PoliticalDivisionEntity;
import com.vividsolutions.jts.geom.Geometry;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BoundaryPlaceRepository extends CrudRepository<BoundaryPlaceEntity, Long> {

    @Query(value = "select pde from #{#entityName} bpe, PoliticalDivisionEntity pde " +
            "where st_contains(bpe.geom, :location) = true and bpe.statefp || bpe.placefp = pde.fips")
    List<PoliticalDivisionEntity> contains(Geometry location);

    @Query(value = "select pde from #{#entityName} bpe, BoundaryPostalCodeEntity bpce, PoliticalDivisionEntity pde " +
            "where bpce.zcta5ce10 = :postalCode and st_intersects(bpe.geom, bpce.geom) = true and bpe.statefp || bpe.placefp = pde.fips")
    List<PoliticalDivisionEntity> contains(String postalCode);

    BoundaryPlaceEntity findByName(String name);
    BoundaryPlaceEntity findByPlacefp(String placefp);
}
