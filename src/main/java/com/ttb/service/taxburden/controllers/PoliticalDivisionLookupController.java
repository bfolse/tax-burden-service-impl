package com.ttb.service.taxburden.controllers;

import java.util.List;

import com.ttb.service.taxburden.domain.PoliticalDivision;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttb.service.taxburden.impl.TaxBurdenServiceImpl;

@Controller
@RequestMapping("/political-division-lookup")
public class PoliticalDivisionLookupController {
	@Autowired
	TaxBurdenServiceImpl taxBurdenServiceImpl;
	
	@RequestMapping(value="/postal-code", method=RequestMethod.GET)
	public @ResponseBody List<PoliticalDivision> politicalDivisionLookupByPostalCode(@RequestParam(value="postalCode") String postalCode) {
		return taxBurdenServiceImpl.findAllPoliticalDivisionsByPostalCode(postalCode);
	}

	@RequestMapping(value="/latitude-longitude", method=RequestMethod.GET)
	public @ResponseBody List<PoliticalDivision> politicalDivisionLookupByLatitudeLongitude(@RequestParam(value="latitude") String latitude, @RequestParam(value="longitude") String longitude) {
		return taxBurdenServiceImpl.findAllPoliticalDivisionsByLatitudeLongitude(latitude, longitude);
	}
}
