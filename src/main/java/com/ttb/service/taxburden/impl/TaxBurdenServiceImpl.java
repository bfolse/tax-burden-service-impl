package com.ttb.service.taxburden.impl;

import com.ttb.service.taxburden.TaxBurdenService;
import com.ttb.service.taxburden.calculation.TaxCalculationException;
import com.ttb.service.taxburden.calculation.TaxCalculator;
import com.ttb.service.taxburden.calculation.TaxCalculatorFactory;
import com.ttb.service.taxburden.domain.*;
import com.ttb.service.taxburden.entities.*;
import com.ttb.service.taxburden.repositories.*;
import com.vividsolutions.jts.geom.Coordinate;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.Point;
import com.vividsolutions.jts.geom.PrecisionModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TaxBurdenServiceImpl implements TaxBurdenService {
	private static final Logger logger = LoggerFactory.getLogger(TaxBurdenServiceImpl.class);

	private static final int MAX_TAX_DEFINITION_ORDINAL = 10;
	private static final int SRID = 4326;

	private static final GeometryFactory geometryFactory = new GeometryFactory(new PrecisionModel(PrecisionModel.FLOATING), SRID);
	private static final PoliticalDivision unincorporated = new PoliticalDivision("00000", "Unincorporated", "Unincorporated", PoliticalDivisionType.CITY);

	@Autowired
	PoliticalDivisionRepository politicalDivisionRepository;
	@Autowired
	BoundaryCountyRepository boundaryCountyRepository;
	@Autowired
	BoundaryPlaceRepository boundaryPlaceRepository;
	@Autowired
    BoundaryStateRepository boundaryStateRepository;
	@Autowired
	BoundaryCountryRepository boundaryCountryRepository;
	@Autowired
	TaxBurdenReportRepository taxBurdenReportRepository;
	@Autowired
	TaxPayerProfileRepository taxPayerProfileRepository;
	@Autowired
	TaxDefinitionRepository taxDefinitionRepository;
	@Autowired
	TaxCalculatorFactory taxCalculatorFactory;

	public List<PoliticalDivision> findAllPoliticalDivisionsByPostalCode(String postalCode) {
		logger.info("Begin findAllPoliticalDivisionsByPostalCode");
		logger.debug("postalCode: " + postalCode);
		List<PoliticalDivision> foundPoliticalDivisions = new ArrayList<PoliticalDivision>();
		if (postalCode != null && !"".equals(postalCode)) {
            // County
            List<PoliticalDivisionEntity> countyPoliticalDivisionEntities = new ArrayList<PoliticalDivisionEntity>();
            countyPoliticalDivisionEntities = boundaryCountyRepository.contains(postalCode);
			countyPoliticalDivisionEntities.forEach(cpde -> foundPoliticalDivisions.add(cpde.toPoliticalDivision()));
            // Place (city, town, borough, etc.
            List<PoliticalDivisionEntity> placePoliticalDivisionEntities = new ArrayList<PoliticalDivisionEntity>();
            placePoliticalDivisionEntities = boundaryPlaceRepository.contains(postalCode);
			placePoliticalDivisionEntities.forEach(ppde -> foundPoliticalDivisions.add(ppde.toPoliticalDivision()));
// TODO
//			if (!boundaryPlaceRepository.covers(postalCode)) {
				// Add unincorporated political division to list
				foundPoliticalDivisions.add(unincorporated);
//			}
			// State
            List<PoliticalDivisionEntity> statePoliticalDivisionEntities = new ArrayList<PoliticalDivisionEntity>();
            statePoliticalDivisionEntities = boundaryStateRepository.contains(postalCode);
            statePoliticalDivisionEntities.forEach(spde -> foundPoliticalDivisions.add(spde.toPoliticalDivision()));
			// Country
			List<PoliticalDivisionEntity> countryPoliticalDivisionEntities = new ArrayList<PoliticalDivisionEntity>();
			countryPoliticalDivisionEntities = boundaryCountryRepository.contains(postalCode);
			countryPoliticalDivisionEntities.forEach(cpde -> foundPoliticalDivisions.add(cpde.toPoliticalDivision()));
            logger.debug("foundPoliticalDivisions: " + foundPoliticalDivisions);
		}
		logger.info("End findAllPoliticalDivisionsByPostalCode");
		return foundPoliticalDivisions;
	}

	public List<PoliticalDivision> findAllPoliticalDivisionsByLatitudeLongitude(String latitude, String longitude) {
		logger.info("Begin findAllPoliticalDivisionsByLatitudeLongitude");
		logger.debug("latitude: " + latitude + " longitude: " + longitude);
		List<PoliticalDivision> foundPoliticalDivisions = new ArrayList<PoliticalDivision>();
		if (latitude != null && !"".equals(latitude) && longitude != null && !"".equals(longitude)) {
			Coordinate coordinate = new Coordinate(Double.parseDouble(longitude), Double.parseDouble(latitude));
			Point point = geometryFactory.createPoint(coordinate);
			// County
			List<PoliticalDivisionEntity> countyPoliticalDivisionEntities = new ArrayList<PoliticalDivisionEntity>();
			countyPoliticalDivisionEntities = boundaryCountyRepository.contains(point);
			countyPoliticalDivisionEntities.forEach(cpde -> foundPoliticalDivisions.add(cpde.toPoliticalDivision()));
            // Place (city, town, borough, etc.
			List<PoliticalDivisionEntity> placePoliticalDivisionEntities = new ArrayList<PoliticalDivisionEntity>();
			placePoliticalDivisionEntities = boundaryPlaceRepository.contains(point);
			placePoliticalDivisionEntities.forEach(ppde -> foundPoliticalDivisions.add(ppde.toPoliticalDivision()));
            // State
            List<PoliticalDivisionEntity> statePoliticalDivisionEntities = new ArrayList<PoliticalDivisionEntity>();
            statePoliticalDivisionEntities = boundaryStateRepository.contains(point);
            statePoliticalDivisionEntities.forEach(spde -> foundPoliticalDivisions.add(spde.toPoliticalDivision()));
			// Country
			List<PoliticalDivisionEntity> countryPoliticalDivisionEntities = new ArrayList<PoliticalDivisionEntity>();
			countryPoliticalDivisionEntities = boundaryCountryRepository.contains(point);
			countryPoliticalDivisionEntities.forEach(cpde -> foundPoliticalDivisions.add(cpde.toPoliticalDivision()));
			logger.debug("foundPoliticalDivisions: " + foundPoliticalDivisions);
		}
		logger.info("End findAllPoliticalDivisionsByLatitudeLongitude");
		return foundPoliticalDivisions;
	}

	public TaxBurdenReport createReport(TaxPayerProfile taxPayerProfile) {
		TaxBurdenReport taxBurdenReport = null;
		if (taxPayerProfile == null || !taxPayerProfile.isValid()) {
			throw new InvalidTaxPayerProfileException("taxPayerProfile is null or invalid");
		} else {
			TaxPayerProfileEntity taxPayerProfileEntity = taxPayerProfileRepository.findByTaxPayerProfileKey(taxPayerProfile.getTaxPayerProfileKey());
			if (taxPayerProfileEntity == null) {
				taxPayerProfileEntity = new TaxPayerProfileEntity(taxPayerProfile.getTaxPayerProfileKey(),
						taxPayerProfile.getTimestamp(),
						taxPayerProfile.getPostalCode(),
						findPoliticalDivisionEntities(taxPayerProfile.getPoliticalDivisions()),
						new MonetaryAmountEntity(taxPayerProfile.getAnnualIncome()),
						new MonetaryAmountEntity(taxPayerProfile.getMortgageInterest()),
						new MonetaryAmountEntity(taxPayerProfile.getRealPropertyMarketValue()),
						taxPayerProfile.getTaxFilingStatus(),
						new MonetaryAmountEntity(taxPayerProfile.getPreTaxContributions()),
						new MonetaryAmountEntity(taxPayerProfile.getOtherItemizedDeductions()),
						taxPayerProfile.getDependents());
				taxPayerProfileEntity = taxPayerProfileRepository.save(taxPayerProfileEntity);
			}
			TaxBurdenReportEntity taxBurdenReportEntity = new TaxBurdenReportEntity(taxPayerProfileEntity);
			calculateTaxes(taxPayerProfileEntity, taxBurdenReportEntity);
			taxBurdenReportRepository.save(taxBurdenReportEntity);
			taxBurdenReport = taxBurdenReportEntity.toTaxBurdenReport();
		}
		return taxBurdenReport;
	}

	public TaxBurdenReport findTaxBurdenReportByKey(String reportKey) {
		TaxBurdenReport taxBurdenReport = null;
		if (reportKey != null && !"".equals(reportKey)) {
			TaxBurdenReportEntity taxBurdenReportEntity = taxBurdenReportRepository.findByReportKey(reportKey);
			if (taxBurdenReportEntity != null) {
				taxBurdenReport = taxBurdenReportEntity.toTaxBurdenReport();
			}
		}
		return taxBurdenReport;
	}

	public TaxPayerProfile createTaxPayerProfile(String postalCode, List<String> politicalDivisionKeys, MonetaryAmount annualIncome, MonetaryAmount mortgageInterest, MonetaryAmount realPropertyMarketValue) {
		TaxPayerProfileEntity taxPayerProfileEntity = new TaxPayerProfileEntity(postalCode, findPoliticalDivisionEntitiesByKeys(politicalDivisionKeys), new MonetaryAmountEntity(annualIncome), new MonetaryAmountEntity(mortgageInterest), new MonetaryAmountEntity(realPropertyMarketValue));
		TaxPayerProfileEntity savedTaxPayerProfileEntity = taxPayerProfileRepository.save(taxPayerProfileEntity);
		return savedTaxPayerProfileEntity.toTaxPayerProfile();
	}

	private List<PoliticalDivisionEntity> findPoliticalDivisionEntitiesByKeys(List<String> politicalDivisonKeys) {
		List<PoliticalDivisionEntity> politicalDivisionEntities = new ArrayList<PoliticalDivisionEntity>();
		for (String politicalDivisionKey : politicalDivisonKeys) {
			PoliticalDivisionEntity politicalDivisionEntity = politicalDivisionRepository.findByFips(politicalDivisionKey);
			politicalDivisionEntities.add(politicalDivisionEntity);
		}
		return politicalDivisionEntities;
	}

	private List<PoliticalDivisionEntity> findPoliticalDivisionEntities(List<PoliticalDivision> politicalDivisons) {
		List<PoliticalDivisionEntity> politicalDivisionEntities = new ArrayList<PoliticalDivisionEntity>();
		for (PoliticalDivision politicalDivision : politicalDivisons) {
			PoliticalDivisionEntity politicalDivisionEntity = politicalDivisionRepository.findByFips(politicalDivision.getFips());
			politicalDivisionEntities.add(politicalDivisionEntity);
		}
		return politicalDivisionEntities;
	}

	public TaxPayerProfile findTaxPayerProfileByKey(String taxPayerProfileKey) {
		logger.info("Begin findTaxPayerProfileByKey");
		logger.debug("taxPayerProfileKey: " + taxPayerProfileKey);
		TaxPayerProfile foundTaxPayerProfile = null;
		if (taxPayerProfileKey != null && !"".equals(taxPayerProfileKey)) {
			TaxPayerProfileEntity taxPayerProfileEntity = taxPayerProfileRepository.findByTaxPayerProfileKey(taxPayerProfileKey);
			if (taxPayerProfileEntity != null) {
				foundTaxPayerProfile = taxPayerProfileEntity.toTaxPayerProfile();
			}
		}
		logger.debug("foundTaxPayerProfile: " + foundTaxPayerProfile);
		logger.info("End findTaxPayerProfileByKey");
		return foundTaxPayerProfile;
	}

	private void calculateTaxes(TaxPayerProfileEntity taxPayerProfile, TaxBurdenReportEntity taxBurdenReport) {
		logger.info("Begin calculateTaxes");
		logger.debug("taxpayerProfile: " + taxPayerProfile);
		// Find all applicable taxDefinitions based on taxPayerProfile
		List<TaxDefinitionEntity> taxDefinitions = new ArrayList<TaxDefinitionEntity>();
		if (taxPayerProfile.getPoliticalDivisions() != null) {
			for (PoliticalDivisionEntity politicalDivision : taxPayerProfile.getPoliticalDivisions()) {
				logger.debug("politicalDivision: " + politicalDivision);
				if (politicalDivision != null) {
					taxDefinitions.addAll(taxDefinitionRepository.findAllByPoliticalDivisionKey(politicalDivision.getFips()));
				}
			}
		}
		logger.debug("taxDefinitions: " + taxDefinitions);
		
		// Calculate and create a taxEntry for each taxDefinition, work from 0 to max ordinal
		for (int i=0; i<=MAX_TAX_DEFINITION_ORDINAL; i++) {
			logger.debug("Calculating taxDefinitions with ordinal: " + i);
			for (TaxDefinitionEntity taxDefinition : taxDefinitions) {
				if (i == taxDefinition.getOrdinal()) {
					logger.debug("taxDefinition: " + taxDefinition);
					PoliticalDivisionEntity politicalDivision = politicalDivisionRepository.findByFips(taxDefinition.getPoliticalDivisionKey());
					logger.debug("politicalDivision: " + politicalDivision);
					TaxEntryEntity taxEntry = createTaxEntry(taxPayerProfile, politicalDivision, taxDefinition, taxBurdenReport);
					if (taxEntry != null) {
                        taxBurdenReport.addTaxEntry(taxEntry);
                    }
				}
			}
		}
		logger.info("End calculateTaxes");
	}

	private TaxCalculator findTaxCalculator(String taxCalcStrategy) {
		return taxCalculatorFactory.getTaxCalculator(taxCalcStrategy);
	}

	private TaxEntryEntity createTaxEntry(TaxPayerProfileEntity taxPayerProfile, PoliticalDivisionEntity politicalDivision, TaxDefinitionEntity taxDefinition, TaxBurdenReportEntity taxBurdenReport) {
		TaxEntryEntity taxEntry = null;
		TaxCalculator taxCalculator = findTaxCalculator(taxDefinition.getTaxCalcStrategy());
		if (taxCalculator == null) {
			logger.warn("TaxCalculator not found taxCalcStrategy: " + taxDefinition.getTaxCalcStrategy());
		} else {
		    try {
                MonetaryAmountEntity calculatedTax = taxCalculator.calculate(taxPayerProfile, politicalDivision, taxDefinition, taxBurdenReport);
                taxEntry = new TaxEntryEntity(taxDefinition.getTaxType(), politicalDivision, taxDefinition.getDescription(), calculatedTax);
            } catch (TaxCalculationException e) {
                logger.error("Error calculating tax for: {} {}", politicalDivision.getFips(), taxDefinition.getTaxType(), e);
            }
		}
		
		return taxEntry;
	}
	
	/**
	 * @return the taxCalculatorFactory
	 */
	public TaxCalculatorFactory getTaxCalculatorFactory() {
		return taxCalculatorFactory;
	}

	/**
	 * @param taxCalculatorFactory the taxCalculatorFactory to set
	 */
	public void setTaxCalculatorFactory(TaxCalculatorFactory taxCalculatorFactory) {
		this.taxCalculatorFactory = taxCalculatorFactory;
	}

	private String createPoliticalDivisionKey(String stateFips, String countyFips) {
	    return stateFips + countyFips;
    }
}
