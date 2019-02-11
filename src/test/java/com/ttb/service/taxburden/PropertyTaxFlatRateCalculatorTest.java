package com.ttb.service.taxburden;

import com.ttb.service.taxburden.calculation.PropertyTaxFlatRateCalculator;
import com.ttb.service.taxburden.domain.PoliticalDivisionType;
import com.ttb.service.taxburden.domain.TaxType;
import com.ttb.service.taxburden.entities.*;
import com.ttb.service.taxburden.repositories.AssessedRateRepository;
import com.ttb.service.taxburden.repositories.TaxRateFlatRepository;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.BDDMockito.given;

@RunWith(SpringRunner.class)
public class PropertyTaxFlatRateCalculatorTest {
    private PropertyTaxFlatRateCalculator propertyTaxFlatRateCalculator;

    @MockBean
    TaxRateFlatRepository mockTaxRateFlatRepository;

    @MockBean
    AssessedRateRepository mockAssessedRateRepository;

    @Before
    public void setup() {
        TaxRateEntity taxRateFlatOne = new TaxRateEntity("TAX_DEFINITION_ONE", BigDecimal.valueOf(0.05));
        TaxRateEntity taxRateFlatTwo = new TaxRateEntity("TAX_DEFINITION_TWO", BigDecimal.valueOf(0.0114));
        ArrayList<TaxRateEntity> taxRateFlatList = new ArrayList<TaxRateEntity>();
        taxRateFlatList.add(taxRateFlatOne);
        taxRateFlatList.add(taxRateFlatTwo);
        given(this.mockTaxRateFlatRepository.findAll())
                .willReturn(taxRateFlatList);

        AssessedRateEntity assessedRateOne = new AssessedRateEntity("TAX_DEFINITION_ONE", BigDecimal.valueOf(0.4));
        AssessedRateEntity assessedRateTwo = new AssessedRateEntity("TAX_DEFINITION_TWO", BigDecimal.valueOf(1.0));
        ArrayList<AssessedRateEntity> assessedRateList = new ArrayList<>();
        assessedRateList.add(assessedRateOne);
        assessedRateList.add(assessedRateTwo);
        given(this.mockAssessedRateRepository.findAll())
                .willReturn(assessedRateList);
    }


    @Test
    public void calculateTest() {
        propertyTaxFlatRateCalculator = new PropertyTaxFlatRateCalculator();
        propertyTaxFlatRateCalculator.setTaxRateFlatRepository(mockTaxRateFlatRepository);
        propertyTaxFlatRateCalculator.setAssessedRateRepository(mockAssessedRateRepository);
        propertyTaxFlatRateCalculator.init();

        TaxBurdenReportEntity taxBurdenReport = new TaxBurdenReportEntity();
        PoliticalDivisionEntity politicalDivision = new PoliticalDivisionEntity("13159", "TEST_COUNTY", "Test County", PoliticalDivisionType.COUNTY);
        List<PoliticalDivisionEntity> politicalDivisions = new ArrayList<>();
        TaxPayerProfileEntity taxPayerProfile = new TaxPayerProfileEntity(politicalDivisions,	new MonetaryAmountEntity(BigDecimal.valueOf(10000)),
                new MonetaryAmountEntity(BigDecimal.valueOf(1000)), new MonetaryAmountEntity(BigDecimal.valueOf(300000)), "BASIC");
        TaxDefinitionEntity taxDefinition = new TaxDefinitionEntity(TaxType.PROPERTY_COUNTY, "13159", "propertyTaxFlatRateCalculator", "TAX_DEFINITION_ONE", "test property tax one", 1);
        MonetaryAmountEntity result = propertyTaxFlatRateCalculator.calculate(taxPayerProfile, politicalDivision, taxDefinition, taxBurdenReport);
        assertNotNull(result);
        assertEquals(6000, result.getAmount().longValue());

        taxDefinition = new TaxDefinitionEntity(TaxType.PROPERTY_COUNTY, "13159", "propertyTaxFlatRateCalculator", "TAX_DEFINITION_TWO", "test property tax two", 1);
        result = propertyTaxFlatRateCalculator.calculate(taxPayerProfile, politicalDivision, taxDefinition, taxBurdenReport);
        assertNotNull(result);
        assertEquals(3420, result.getAmount().longValue());

    }
}
