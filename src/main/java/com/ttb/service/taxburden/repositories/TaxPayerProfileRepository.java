package com.ttb.service.taxburden.repositories;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.ttb.service.taxburden.entities.TaxPayerProfileEntity;
import org.springframework.transaction.annotation.Transactional;

public interface TaxPayerProfileRepository extends PagingAndSortingRepository<TaxPayerProfileEntity, Long> {

	TaxPayerProfileEntity findByTaxPayerProfileKey(String taxPayerProfileKey);
}
