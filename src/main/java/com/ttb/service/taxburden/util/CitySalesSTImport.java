package com.ttb.service.taxburden.util;

import com.ttb.service.taxburden.domain.PoliticalDivision;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

/**
 * args[0] city sales tax (per state) URL
 * args[1] state fips code - 2 char
 * args[2] state abbrev code - 2 char
 * args[3] political division file - census_place_fips_<year>.csv
 * args[4] expenditure category group - SALES_TAX_GROUP, SALES_TAX_GROUP_B, or SALES_TAX_GROUP_WITH_UNPREPARED_FOOD
 * ex. java -cp ../../target/classes  com.ttb.service.taxburden.util.CitySalesSTImport http://www.sale-tax.com/Illinois_all 17 IL ../census_place_fips_2016.csv SALES_TAX_GROUP_WITH_UNPREPARED_FOOD > data_sales_tax_city_IL-postgresql.sql
 */
public class CitySalesSTImport {

    public static void main(String[] args) throws Exception {

        String allUrl = args[0];
        String stateFips = args[1];
        String stateAbbrev = args[2];
        String politicalDivisionFilename = args[3];
        String expenditureCategoryGroup = args[4];

        // Load political divisions
        Map<String, PoliticalDivision> politicalDivisions = loadPoliticalDivisions(politicalDivisionFilename, stateFips);

        // Process county property tax file
        List cityRates = getRateList(allUrl);

        // Tax Definition Insert
        StringBuffer taxDefinitionInsert = new StringBuffer();
        taxDefinitionInsert.append("-- tax_definition_sales_" + stateAbbrev + ".sql\n");
        taxDefinitionInsert.append("INSERT INTO public.tax_definition(id, political_division_key, tax_definition_key, description, tax_calc_strategy, tax_type, ordinal)\n");
        taxDefinitionInsert.append("VALUES\n");

        // Tax Rate Insert
        StringBuffer taxRateInsert = new StringBuffer();
        taxRateInsert.append("-- tax_rate_sales_" + stateAbbrev + ".sql\n");
        taxRateInsert.append("INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)\n");
        taxRateInsert.append("VALUES\n");

        // Assessed Rate Insert
        StringBuffer taxDefinitionExpenditureCategoryInsert = new StringBuffer();
        taxDefinitionExpenditureCategoryInsert.append("-- tax_definition_expenditure_category_" + stateAbbrev + ".sql\n");
        taxDefinitionExpenditureCategoryInsert.append("INSERT INTO public.tax_definition_expenditure_category(id, tax_definition_key, expenditure_category_group_key)\n");
        taxDefinitionExpenditureCategoryInsert.append("VALUES\n");

        Iterator<CityRate> itr = cityRates.iterator();
        while (itr.hasNext()) {
            CityRate cityRate = itr.next();
            String city = cityRate.cityName;
            String rateString = cityRate.rate.replace("%", "");
            BigDecimal rate = new BigDecimal(rateString).multiply(BigDecimal.valueOf(0.01));
            if (rate.compareTo(BigDecimal.ZERO) > 0) {
                String standardizedCity = standardizeName(city);
                PoliticalDivision pd = politicalDivisions.get(standardizedCity);
                if (pd == null) {
                    System.out.println("Political Division for standardized city : " + standardizedCity + " in state: " + stateAbbrev + " not found");
                    continue;
                }
                String politicalDivisionKey = pd.fips;
                if (politicalDivisionKey == null || "".equals(politicalDivisionKey)) {
                    System.out.println("Political Division fips for city: " + city + " standardized: " + standardizedCity + " in state: " + stateAbbrev + " not found");
                    continue;
                }
                String taxDefinitionKey = standardizedCity + "_" + stateAbbrev + "_CITY_SALES";
                String description = politicalDivisions.get(standardizedCity).name.replace("'", "''") + " " + stateAbbrev + " Sales";
                String comma = ",";
                if (!itr.hasNext()) {
                    comma = "";
                }

                taxDefinitionInsert.append("(nextval('public.hibernate_sequence'),'" + politicalDivisionKey + "','" + taxDefinitionKey + "','" + description + "','salesTaxCalculator','SALES_CITY',5)" + comma + "\n");
                taxRateInsert.append("(nextval('public.hibernate_sequence'),'" + taxDefinitionKey + "'," + rate + ",null,null)" + comma + "\n");
                taxDefinitionExpenditureCategoryInsert.append("(nextval('public.hibernate_sequence'),'" + taxDefinitionKey + "','" + expenditureCategoryGroup + "')" + comma + "\n");
            }
        }
        taxDefinitionInsert.append(";\n");
        taxRateInsert.append(";\n");
        taxDefinitionExpenditureCategoryInsert.append(";\n");
        System.out.println("-- Sales Tax for cities in " + stateAbbrev);
        System.out.println(taxDefinitionInsert.toString());
        System.out.println(taxRateInsert.toString());
        System.out.println(taxDefinitionExpenditureCategoryInsert.toString());
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
                String countySubdivision = state + tokens[3];
                String consolidatedCity = state + tokens[5];
                String city = state + tokens[4];
                String name = tokens[6];
                String standardizedName = standardizeName(name);

                String fips = null;

                switch (level) {
                    case LEVEL_CITY: {
                        fips = city;
                        break;
                    }
                    case LEVEL_COUNTY_SUBDIVISION: {
                        fips = countySubdivision;
                        break;
                    }
                    case LEVEL_CONSOLIDATED_CITY: {
                        fips = consolidatedCity;
                        break;
                    }
                    case LEVEL_COUNTY:
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
                .replace("&#39;", "")
                .replace(".", "")
                .replace(" ", "_")
                .toUpperCase()
                .replace("_CITY", "")
                .replace("_TOWN", "")
                .replace("_TOWNSHIP", "")
                .replace("_VILLAGE", "")
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

    private static List<CityRate> getRateList(String url) {
        String BASE_URL = url.substring(0, url.lastIndexOf("/"));
        String BEGIN_TOKEN = "   <tr><td class='clickable' data-href='";
        String CITY_NAME_BEGIN_TOKEN = "  <title>";
        List<CityRate> rateList = new ArrayList<>();
        List<String> allUrlOutput;

        // Get URL for each city page
        try {
            allUrlOutput = sendGet(url);
            Iterator<String> allItr = allUrlOutput.iterator();
            while (allItr.hasNext()) {
                String allLine = allItr.next();
                if (allLine.startsWith(BEGIN_TOKEN)) {
                    String allCityLine = allLine.replace(BEGIN_TOKEN, "");
                    String cityStateName = allCityLine.substring(0, allCityLine.indexOf("'"));
                    // Ignore counties
                    if (cityStateName.contains("County")) {
                        continue;
                    }
                    String cityName = null;
                    String cityUrl = BASE_URL + "/" + cityStateName;
                    // System.out.println(cityUrl);
                    // Get rate for each city
                    List<String> cityUrlOutput;
                    cityUrlOutput = sendGet(cityUrl);

                    // Get the city name
                    Iterator<String> cityNameItr = cityUrlOutput.iterator();
                    while (cityNameItr.hasNext()) {
                        String cityLine = cityNameItr.next();
                        if (cityLine.startsWith(CITY_NAME_BEGIN_TOKEN)) {
                            String nameLine = cityLine.replace(CITY_NAME_BEGIN_TOKEN, "");
                            cityName = nameLine.substring(0, nameLine.indexOf(","));
                            break;
                        }
                    }
                    if (cityName == null) {
                        throw new Exception("Failed to find city name");
                    }
                    // Get the rate
                    String CITY_RATE_BEGIN_TOKEN = "<tr><td>" + cityName + "</td><td class='rate'>";
                    Iterator<String> cityRateItr = cityUrlOutput.iterator();
                    while (cityRateItr.hasNext()) {
                        String cityLine = cityRateItr.next();
                        if (cityLine.startsWith(CITY_RATE_BEGIN_TOKEN)) {
                            String rateLine = cityLine.replace(CITY_RATE_BEGIN_TOKEN, "");
                            String cityRate = rateLine.substring(0, rateLine.indexOf("<"));
                            rateList.add(new CityRate(cityName, cityRate));
                            break;
                        }
                    }
//                    Thread.sleep(new Double(Math.random() * 10000).longValue());
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return rateList;
    }

    private static List<String> sendGet(String url) throws Exception {

        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();

        // optional default is GET
        con.setRequestMethod("GET");

        //add request header
        con.setRequestProperty("User-Agent", "Mozilla/5.0");

        int responseCode = con.getResponseCode();
//        System.out.println("\nSending 'GET' request to URL : " + url);
//        System.out.println("Response Code : " + responseCode);

        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        List<String> response = new ArrayList<>();

        while ((inputLine = in.readLine()) != null) {
            response.add(inputLine);
        }
        in.close();

        return response;
    }

    private static class PoliticalDivision {
        String fips;
        String name;

        PoliticalDivision(String fips, String name) {
            this.fips = fips;
            this.name = name;
        }
    }

    private static class CityRate {
        String cityName;
        String rate;

        CityRate(String cityName, String rate) {
            this.cityName = cityName;
            this.rate = rate;
        }
    }
}
