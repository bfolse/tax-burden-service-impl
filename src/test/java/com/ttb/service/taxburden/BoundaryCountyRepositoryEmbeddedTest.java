package com.ttb.service.taxburden;

import com.ttb.service.taxburden.entities.AssessedRateEntity;
import com.ttb.service.taxburden.entities.BoundaryCountyEntity;
import com.ttb.service.taxburden.repositories.BoundaryCountyRepository;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.io.ParseException;
import com.vividsolutions.jts.io.WKTReader;
import io.zonky.test.db.AutoConfigureEmbeddedDatabase;
import org.junit.Ignore;
import org.springframework.test.context.jdbc.Sql;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace.NONE;

@Ignore
@RunWith(SpringRunner.class)
@DataJpaTest
@AutoConfigureTestDatabase(replace = NONE)
@AutoConfigureEmbeddedDatabase
public class BoundaryCountyRepositoryEmbeddedTest {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private BoundaryCountyRepository boundaryCountyRepository;

    @Test
    @Sql(scripts = {
            "/ddl/postgres/boundary_county_repository_test_setup.sql"
        })
    public void findAllTest() {
        BoundaryCountyEntity aBoundaryCountyEntity = new BoundaryCountyEntity(wktToGeometry("POLYGON ((10 10, 10 20, 20 20, 20 15, 10 10))"),
                "01","005","00161528","0500000US01005","01005","Barbour","06", new BigInteger("2292144656"), new BigInteger("50538698"));
        boundaryCountyRepository.save(aBoundaryCountyEntity);
        Iterable<BoundaryCountyEntity> boundaryCountyEntityIterable = boundaryCountyRepository.findAll();
        assertNotNull(boundaryCountyEntityIterable);
        List<BoundaryCountyEntity> boundaryCountyEntityList = new ArrayList<BoundaryCountyEntity>();
        boundaryCountyEntityIterable.forEach(k -> boundaryCountyEntityList.add(k));
        assertEquals(1, boundaryCountyEntityList.size());
    }

    private Geometry wktToGeometry(String wktPointGeom) {
        WKTReader fromText = new WKTReader();
        Geometry geom = null;
        try {
            geom = fromText.read(wktPointGeom);
        } catch (ParseException e) {
            throw new RuntimeException("Not a WKT string:" + wktPointGeom);
        }
        return geom;
    }
}
