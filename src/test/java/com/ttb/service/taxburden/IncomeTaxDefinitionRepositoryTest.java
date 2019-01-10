package com.ttb.service.taxburden;

import com.ttb.service.taxburden.domain.TaxType;
import com.ttb.service.taxburden.entities.IncomeTaxDefinitionEntity;
import com.ttb.service.taxburden.entities.PoliticalDivisionEntity;
import com.ttb.service.taxburden.entities.TaxDefinitionEntity;
import com.ttb.service.taxburden.entities.TaxRateEntity;
import com.ttb.service.taxburden.repositories.IncomeTaxDefinitionRepository;
import com.ttb.service.taxburden.repositories.TaxDefinitionRepository;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

@RunWith(SpringRunner.class)
@DataJpaTest
public class IncomeTaxDefinitionRepositoryTest {
	@Autowired 
	private IncomeTaxDefinitionRepository incomeTaxDefinitionRepository;
	
    @Autowired
    private TestEntityManager entityManager;
    
	@Test
	public void saveTest() {
		IncomeTaxDefinitionEntity incomeTaxDefinitionEntity = new IncomeTaxDefinitionEntity("TEST_TAX_DEFINITION_KEY", 1000, 3000, 1000, 1000, 2000, 4000, 2000, 2000, 3000);
		IncomeTaxDefinitionEntity savedIncomeTaxDefinition = incomeTaxDefinitionRepository.save(incomeTaxDefinitionEntity);
		System.out.println("savedIncomeTaxDefinition:" + savedIncomeTaxDefinition);
		incomeTaxDefinitionRepository.delete(savedIncomeTaxDefinition);
	}

	@Test
	public void findByTaxDefinitionKeyTest() {
		IncomeTaxDefinitionEntity incomeTaxDefinitionEntity = new IncomeTaxDefinitionEntity("TEST_TAX_DEFINITION_KEY", 1000, 3000, 1000, 1000, 2000, 4000, 2000, 2000, 3000);
		IncomeTaxDefinitionEntity savedIncomeTaxDefinition = incomeTaxDefinitionRepository.save(incomeTaxDefinitionEntity);
		System.out.println("savedIncomeTaxDefinition:" + savedIncomeTaxDefinition);

		IncomeTaxDefinitionEntity foundIncomeTaxDefinition = incomeTaxDefinitionRepository.findByTaxDefinitionKey("TEST_TAX_DEFINITION_KEY");
		assertNotNull(foundIncomeTaxDefinition);
		assertEquals(incomeTaxDefinitionEntity, foundIncomeTaxDefinition);
		incomeTaxDefinitionRepository.delete(savedIncomeTaxDefinition);
	}

	@Test
	public void findAllTest() {
		IncomeTaxDefinitionEntity incomeTaxDefinitionOneEntity = new IncomeTaxDefinitionEntity("TEST_TAX_DEFINITION_ONE_KEY", 1000, 3000, 1000, 1000, 2000, 4000, 2000,2000, 3000);
		IncomeTaxDefinitionEntity savedIncomeTaxDefinitionOne = incomeTaxDefinitionRepository.save(incomeTaxDefinitionOneEntity);
		IncomeTaxDefinitionEntity incomeTaxDefinitionTwoEntity = new IncomeTaxDefinitionEntity("TEST_TAX_DEFINITION_TWO_KEY", 1000, 3000, 1000, 1000, 2000, 4000, 2000, 2000, 3000);
		IncomeTaxDefinitionEntity savedIncomeTaxDefinitionTwo = incomeTaxDefinitionRepository.save(incomeTaxDefinitionTwoEntity);

		List<IncomeTaxDefinitionEntity> incomeTaxDefinitionList = new ArrayList<>();
		Iterable<IncomeTaxDefinitionEntity> incomeTaxDefinitionIterable = incomeTaxDefinitionRepository.findAll();
		assertNotNull(incomeTaxDefinitionIterable);
		incomeTaxDefinitionIterable.forEach(k -> incomeTaxDefinitionList.add(k));
		assertEquals(2, incomeTaxDefinitionList.size());

		incomeTaxDefinitionRepository.delete(savedIncomeTaxDefinitionOne);
		incomeTaxDefinitionRepository.delete(savedIncomeTaxDefinitionTwo);
	}
}
