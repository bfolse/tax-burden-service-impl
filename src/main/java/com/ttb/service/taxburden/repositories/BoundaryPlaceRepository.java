package com.ttb.service.taxburden.repositories;

import com.ttb.service.taxburden.entities.BoundaryCountyEntity;
import com.ttb.service.taxburden.entities.BoundaryPlaceEntity;
import com.vividsolutions.jts.geom.Geometry;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BoundaryPlaceRepository extends CrudRepository<BoundaryPlaceEntity, Long> {
//    SELECT name, statefp, placefp, name
//    FROM boundary_place
//    WHERE ST_Contains(geom, ST_PointFromText('POINT(-84.3330 33.7536)', 4326));

    @Query(value = "select bce from #{#entityName} bce where st_contains(bce.geom, :location) = true")
    List<BoundaryPlaceEntity> contains(Geometry location);

    BoundaryPlaceEntity findByName(String name);
    BoundaryPlaceEntity findByPlacefp(String placefp);
}
