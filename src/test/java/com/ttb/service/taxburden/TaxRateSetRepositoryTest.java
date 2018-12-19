package com.ttb.service.taxburden;

import com.ttb.service.taxburden.domain.TaxFilingStatus;
import com.ttb.service.taxburden.entities.TaxRateEntity;
import com.ttb.service.taxburden.entities.TaxRateSetEntity;
import com.ttb.service.taxburden.repositories.TaxRateSetRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

@RunWith(SpringRunner.class)
@DataJpaTest
public class TaxRateSetRepositoryTest {
	@Autowired 
	private TaxRateSetRepository taxRateSetRepository;
	
	@Test
	public void saveTest() {
		List<TaxRateEntity> taxRates = new ArrayList<TaxRateEntity>();
		TaxRateEntity taxRateOne = new TaxRateEntity(null, BigDecimal.valueOf(0.05), BigInteger.valueOf(0), BigInteger.valueOf(100));
		TaxRateEntity taxRateTwo = new TaxRateEntity(null, BigDecimal.valueOf(0.07), BigInteger.valueOf(100), BigInteger.valueOf(200));
		taxRates.add(taxRateOne);
		taxRates.add(taxRateTwo);
		TaxRateSetEntity taxRateSet = new TaxRateSetEntity("TEST_TAX_DEF_ONE", taxRates);
		TaxRateSetEntity savedTaxRateSet = taxRateSetRepository.save(taxRateSet);
		assertEquals(taxRateSet, savedTaxRateSet);
		taxRateSetRepository.delete(savedTaxRateSet);
	}

	@Test
	public void findAllTest() {
		List<TaxRateEntity> taxRates = new ArrayList<TaxRateEntity>();
		TaxRateEntity taxRateOne = new TaxRateEntity(null, BigDecimal.valueOf(0.05), BigInteger.valueOf(0), BigInteger.valueOf(100));
		TaxRateEntity taxRateTwo = new TaxRateEntity(null, BigDecimal.valueOf(0.07), BigInteger.valueOf(100), BigInteger.valueOf(200));
		taxRates.add(taxRateOne);
		taxRates.add(taxRateTwo);
		TaxRateSetEntity taxRateSetOne = new TaxRateSetEntity("TEST_TAX_DEF_ONE", TaxFilingStatus.SINGLE, taxRates);
		TaxRateSetEntity savedTaxRateSetOne = taxRateSetRepository.save(taxRateSetOne);
		assertEquals(taxRateSetOne, savedTaxRateSetOne);

		TaxRateEntity taxRateThree = new TaxRateEntity(null, BigDecimal.valueOf(0.10), BigInteger.valueOf(200), BigInteger.valueOf(300));
		taxRates.add(taxRateThree);
		TaxRateSetEntity taxRateSetTwo = new TaxRateSetEntity("TEST_TAX_DEF_TWO", TaxFilingStatus.JOINT, taxRates);
		TaxRateSetEntity savedTaxRateSetTwo = taxRateSetRepository.save(taxRateSetTwo);
		assertEquals(taxRateSetTwo, savedTaxRateSetTwo);
		
		List<TaxRateSetEntity> taxRateSetList = new ArrayList<>();
		Iterable<TaxRateSetEntity> taxRateSetIterable = taxRateSetRepository.findAll();
		assertNotNull(taxRateSetIterable);
		taxRateSetIterable.forEach(k -> taxRateSetList.add(k));
		assertEquals(2, taxRateSetList.size());
		
		taxRateSetRepository.delete(taxRateSetOne);
		taxRateSetRepository.delete(taxRateSetTwo);

		taxRateSetList.clear();
		taxRateSetIterable = taxRateSetRepository.findAll();
		assertNotNull(taxRateSetIterable);
		taxRateSetIterable.forEach(k -> taxRateSetList.add(k));
		assertEquals(0, taxRateSetList.size());
}
	
	@Test
	public void findByTaxDefinitionKeyTest() {
		List<TaxRateEntity> taxRates = new ArrayList<TaxRateEntity>();
		TaxRateEntity taxRateOne = new TaxRateEntity(null, BigDecimal.valueOf(0.05), BigInteger.valueOf(0), BigInteger.valueOf(100));
		TaxRateEntity taxRateTwo = new TaxRateEntity(null, BigDecimal.valueOf(0.07), BigInteger.valueOf(100), BigInteger.valueOf(200));
		taxRates.add(taxRateOne);
		taxRates.add(taxRateTwo);
		TaxRateSetEntity taxRateSetOne = new TaxRateSetEntity("TEST_TAX_DEF_ONE", TaxFilingStatus.SINGLE, taxRates);
		TaxRateSetEntity savedTaxRateSetOne = taxRateSetRepository.save(taxRateSetOne);
		assertEquals(taxRateSetOne, savedTaxRateSetOne);

		TaxRateEntity taxRateThree = new TaxRateEntity(null, BigDecimal.valueOf(0.10), BigInteger.valueOf(200), BigInteger.valueOf(300));
		taxRates.add(taxRateThree);
		TaxRateSetEntity taxRateSetTwo = new TaxRateSetEntity("TEST_TAX_DEF_TWO", TaxFilingStatus.JOINT, taxRates);
		TaxRateSetEntity savedTaxRateSetTwo = taxRateSetRepository.save(taxRateSetTwo);
		assertEquals(taxRateSetTwo, savedTaxRateSetTwo);

		TaxRateSetEntity foundTaxRateSet = taxRateSetRepository.findByTaxDefinitionKey("TEST_TAX_DEF_ONE");
		assertNotNull(foundTaxRateSet);
		assertEquals("TEST_TAX_DEF_ONE", foundTaxRateSet.getTaxDefinitionKey());
		assertEquals(3, foundTaxRateSet.getTaxRates().size());
		
		taxRateSetRepository.delete(taxRateSetOne);
		taxRateSetRepository.delete(taxRateSetTwo);
	}
}
