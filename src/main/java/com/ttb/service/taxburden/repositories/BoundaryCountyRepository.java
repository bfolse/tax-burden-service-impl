package com.ttb.service.taxburden.repositories;

import com.ttb.service.taxburden.entities.BoundaryCountyEntity;
import com.vividsolutions.jts.geom.Geometry;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface BoundaryCountyRepository extends CrudRepository<BoundaryCountyEntity, Long> {
//    SELECT name, statefp, placefp, name
//    FROM boundary_place
//    WHERE ST_Contains(geom, ST_PointFromText('POINT(-84.3330 33.7536)', 4269));

    @Query(value = "select bce from #{#entityName} bce where contains(bce.geom, :location) = true")
    List<BoundaryCountyEntity> contains(Geometry location);

    BoundaryCountyEntity findByName(String name);
    BoundaryCountyEntity findByCountyfp(String countyfp);
}
