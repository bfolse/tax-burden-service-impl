package com.ttb.service.taxburden.repositories;

import com.ttb.service.taxburden.entities.TaxRateEntity;
import com.ttb.service.taxburden.entities.TaxRateSetEntity;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface TaxRateSetRepository extends PagingAndSortingRepository<TaxRateSetEntity, Long>{

	TaxRateSetEntity findByTaxDefinitionKey(String taxDefinitionKey);
}
