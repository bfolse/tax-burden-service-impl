package com.ttb.service.taxburden.util;

import java.io.IOException;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

/**
 * args[0] county income tax (per state) file
 * args[1] state fips code - 2 char
 * args[2] state abbrev code - 2 char
 * args[3] political division file - census_place_fips_<year>.csv
 */
public class CountyIncomeImport {

    public static void main(String[] args) throws Exception {

        String countyIncomeTaxFilename = args[0];
        String stateFips = args[1];
        String stateAbbrev = args[2];
        String politicalDivisionFilename = args[3];

        // Load political divisions
        Map<String, PoliticalDivision> politicalDivisions = loadPoliticalDivisions(politicalDivisionFilename, stateFips);

        // Process county property tax file
        List l = readFileInList(countyIncomeTaxFilename);

        // Tax Definition Insert
        StringBuffer taxDefinitionInsert = new StringBuffer();
        taxDefinitionInsert.append("-- tax_definition_income_city_" + stateAbbrev + ".sql\n");
        taxDefinitionInsert.append("INSERT INTO public.tax_definition(id, political_division_key, tax_definition_key, description, tax_calc_strategy, tax_type, ordinal)\n");
        taxDefinitionInsert.append("VALUES\n");

        // Tax Rate Insert
        StringBuffer taxRateInsert = new StringBuffer();
        taxRateInsert.append("-- tax_rate_income_city_" + stateAbbrev + ".sql\n");
        taxRateInsert.append("INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)\n");
        taxRateInsert.append("VALUES\n");

        Iterator<String> itr = l.iterator();
        while (itr.hasNext()) {
            String line = itr.next();
            String[] tokens = line.split(",");
            String county = tokens[0];
            String standardizedCounty = standardizeName(county);
            PoliticalDivision pd = politicalDivisions.get(standardizedCounty);
            if (pd == null) {
                throw new Exception("Political Division for standardized county : " + standardizedCounty + " in state: " + stateAbbrev + " not found");
            }
            String politicalDivisionKey = politicalDivisions.get(standardizedCounty).fips;
            if (politicalDivisionKey == null || "".equals(politicalDivisionKey)) {
                throw new Exception("Political Division fips for county: " + county + " standardized: " + standardizedCounty + " in state: " + stateAbbrev + " not found");
            }
            String taxDefinitionKey = standardizedCounty + "_" + stateAbbrev + "_COUNTY_INCOME";
            String description = politicalDivisions.get(standardizedCounty).name.replace("'", "''") + " " + stateAbbrev + " Income";
            String rateString = tokens[1].trim().replace("%", "");
            BigDecimal rate = new BigDecimal(rateString).multiply(BigDecimal.valueOf(0.01));
            if (rate.compareTo(BigDecimal.ZERO) > 0) {
                String comma = ",";
                if (!itr.hasNext()) {
                    comma = "";
                }

                taxDefinitionInsert.append("(nextval('public.hibernate_sequence'),'" + politicalDivisionKey + "','" + taxDefinitionKey + "','" + description + "','incomeTaxFlatRateCalculator','INCOME_COUNTY',9)" + comma + "\n");
                taxRateInsert.append("(nextval('public.hibernate_sequence'),'" + taxDefinitionKey + "'," + rate + ",null,null)" + comma + "\n");
            }
        }
        taxDefinitionInsert.append(";\n");
        taxRateInsert.append(";\n");
        System.out.println("-- Income Tax for counties in " + stateAbbrev);
        System.out.println(taxDefinitionInsert.toString());
        System.out.println(taxRateInsert.toString());
        System.out.println();
    }

    private static Map<String, PoliticalDivision> loadPoliticalDivisions(String filename, String stateFips) {
        final String LEVEL_FEDERAL = "010";
        final String LEVEL_STATE = "040";
        final String LEVEL_COUNTY = "050";
        final String LEVEL_COUNTY_SUBDIVISION = "061";
        final String LEVEL_CITY = "162";
        final String LEVEL_CONSOLIDATED_CITY = "170";

        Map<String, PoliticalDivision> politicalDivisions = new HashMap<>();

        List l = readFileInList(filename);

        boolean skip = false;

        // First pass, skip County Subdivision to avoid duplicates
        Iterator<String> itr = l.iterator();
        while (itr.hasNext()) {
            skip = false;
            String line = itr.next();
            if (line.startsWith("#")) {
                skip = true;
            }
            String[] tokens = line.split(",");
            if (!skip && tokens.length >= 7) {
                String level = tokens[0];
                String state = tokens[1];
                if (!state.equals(stateFips)) {
                    skip = true;
                }
                String county = state + tokens[2];
                String name = tokens[6];
                String standardizedName = standardizeName(name);

                String fips = null;

                switch (level) {
                    case LEVEL_COUNTY: {
                        fips = county;
                        break;
                    }
                    case LEVEL_COUNTY_SUBDIVISION:
                    case LEVEL_CITY:
                    case LEVEL_CONSOLIDATED_CITY:
                    case LEVEL_FEDERAL:
                    case LEVEL_STATE: {
                        skip = true;
                        break;
                    }
                    default: {
//                        System.out.println();
//                        System.out.println("############ FOUND unknown level: " + level + " ############");
//                        System.out.println();
                        skip = true;
                        break;
                    }
                }

                if (!skip) {
                    politicalDivisions.put(standardizedName, new PoliticalDivision(fips, name));
                }
            }
        }

        return politicalDivisions;
    }

    private static String standardizeName(String name) {
        return name.trim()
                .replace("'", "")
                .replace("’", "")
                .replace(".", "")
                .replace(" County", "")
                .replace(" Parish", "")
                .replace(" ", "_")
                .toUpperCase()
                .replace("SAINT_", "ST_")
                .replace("FT_", "FORT_");
    }

    public static List<String> readFileInList(String fileName) {

        List<String> lines = Collections.emptyList();
        try {
            lines = Files.readAllLines(Paths.get(fileName), StandardCharsets.UTF_8);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        return lines;
    }

    private static class PoliticalDivision {
        String fips;
        String name;

        PoliticalDivision(String fips, String name) {
            this.fips = fips;
            this.name = name;
        }
    }
}
