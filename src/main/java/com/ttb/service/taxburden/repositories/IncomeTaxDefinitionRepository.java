package com.ttb.service.taxburden.repositories;

import com.ttb.service.taxburden.entities.IncomeTaxDefinitionEntity;
import com.ttb.service.taxburden.entities.TaxDefinitionEntity;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface IncomeTaxDefinitionRepository extends PagingAndSortingRepository<IncomeTaxDefinitionEntity, Long> {

	IncomeTaxDefinitionEntity findByTaxDefinitionKey(String taxDefinitionKey);
}
