package com.ttb.service.taxburden;

import com.ttb.service.taxburden.calculation.TaxCalculatorFactory;
import com.ttb.service.taxburden.domain.*;
import com.ttb.service.taxburden.entities.PoliticalDivisionEntity;
import com.ttb.service.taxburden.impl.TaxBurdenServiceImpl;
import com.ttb.service.taxburden.repositories.PoliticalDivisionRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.util.ArrayList;

import static org.junit.Assert.assertNotNull;
import static org.mockito.BDDMockito.given;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TaxBurdenServiceImplTest {
	@Autowired
	private TaxBurdenServiceImpl taxBurdenServiceImpl;

	@Autowired
	PoliticalDivisionRepository politicalDivisionRepository;

	@MockBean 
	private TaxCalculatorFactory mockTaxCalculatorFactory;
	
	@Test
	public void createReportTest() {
        given(this.mockTaxCalculatorFactory.getTaxCalculator(""))
        .willReturn(new MockTaxCalculator());
		taxBurdenServiceImpl.setTaxCalculatorFactory(mockTaxCalculatorFactory);

		PoliticalDivisionEntity politicalDivisionEntity = new PoliticalDivisionEntity("13", "Georgia", "State of Georgia", PoliticalDivisionType.STATE);
		politicalDivisionRepository.save(politicalDivisionEntity);

        ArrayList<String> politicalDivisionKeys = new ArrayList<String>();
		politicalDivisionKeys.add("13");
		TaxPayerProfile taxPayerProfile = taxBurdenServiceImpl.createTaxPayerProfile("30306", politicalDivisionKeys, new MonetaryAmount(BigDecimal.valueOf(100000.00)), new MonetaryAmount(BigDecimal.valueOf(5000.00)), new MonetaryAmount(BigDecimal.valueOf(100000.00)));
System.out.println("TaxPayerProfile: " + taxPayerProfile);
		TaxBurdenReport taxBurdenReport = taxBurdenServiceImpl.createReport(taxPayerProfile);
		assertNotNull(taxBurdenReport);
		System.out.println(taxBurdenReport);
	}

    @Test(expected = InvalidTaxPayerProfileException.class)
    public void createReportWithInvalidProfileTest() {
	    TaxPayerProfile badTaxPayerProfile = new TaxPayerProfile();
	    badTaxPayerProfile.setAnnualIncome(new MonetaryAmount(BigDecimal.ZERO));
        taxBurdenServiceImpl.createReport(badTaxPayerProfile);
    }
}
