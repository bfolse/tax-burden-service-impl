package com.ttb.service.taxburden.util;

import com.ttb.service.taxburden.domain.PoliticalDivisionType;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/*
 * Import US Census State, County, Minor Civil Division, and Incorporated Place FIPS Codes (CSV file)
 * Create SQL for inserting data into political_division
 */
public class PoliticalDivisionImport {
    private static final String LEVEL_FEDERAL = "010";
    private static final String LEVEL_STATE = "040";
    private static final String LEVEL_COUNTY = "050";
    private static final String LEVEL_COUNTY_SUBDIVISION = "061";
    private static final String LEVEL_CITY = "162";
    private static final String LEVEL_CONSOLIDATED_CITY = "170";

    public static void main(String[] args) {
        List<String> usedCodes = new ArrayList<>();

        List l = readFileInList(args[0]);
        List<String> countySubdivisionList = new ArrayList<>();

        System.out.println("-- political_division_local.sql");
        System.out.println("INSERT INTO public.political_division");
        System.out.println("(id, description, name, fips, type)");
        System.out.println("VALUES ");

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
                String county = state + tokens[2];
                String city = state + tokens[4];
                String consolidatedCity = state + tokens[5];
                String name = tokens[6].replace("'", "''");

                String fips = null;
                String type = null;

                switch (level) {
                    case LEVEL_COUNTY: {
                        fips = county;
                        type = PoliticalDivisionType.COUNTY.name();
                        break;
                    }
                    case LEVEL_COUNTY_SUBDIVISION: {
                        countySubdivisionList.add(line);
                        skip = true;
                        break;
                    }
                    case LEVEL_CITY: {
                        fips = city;
                        type = PoliticalDivisionType.CITY.name();
                        break;
                    }
                    case LEVEL_CONSOLIDATED_CITY: {
                        fips = consolidatedCity;
                        type = PoliticalDivisionType.CONSOLIDATED_CITY.name();
                        break;
                    }
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

                String comma = ",";
                if (!skip) {
                    System.out.println("(nextval('public.hibernate_sequence'),'" + name + "','" + name + "','" + fips + "','" + type + "')" + comma);
                    if (!usedCodes.contains(fips)) {
                        usedCodes.add(fips);
                    }
                }
            }
        }

        // Now do the County Subdivision, skipping duplicates
        Iterator<String> itr2 = countySubdivisionList.iterator();
        while (itr2.hasNext()) {
            skip = false;
            String line = itr2.next();
            if (line.startsWith("#")) {
                skip = true;
            }
            String[] tokens = line.split(",");
            if (!skip && tokens.length >= 7) {
                String level = tokens[0];
                String state = tokens[1];
                String countySubdivision = state + tokens[3];
                String name = tokens[6].replace("'", "''");

                String fips = null;
                String type = null;

                switch (level) {
                    case LEVEL_COUNTY:
                    case LEVEL_CITY:
                    case LEVEL_CONSOLIDATED_CITY:
                    case LEVEL_FEDERAL:
                    case LEVEL_STATE: {
                        skip = true;
                        break;
                    }
                    case LEVEL_COUNTY_SUBDIVISION: {
                        fips = countySubdivision;
                        type = PoliticalDivisionType.COUNTY_SUBDIVISION.name();
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

                String comma = "";
                if (itr2.hasNext()) {
                    comma = ",";
                }

                if (!skip) {
                    if (!usedCodes.contains(fips)) {
                        System.out.println("(nextval('public.hibernate_sequence'),'" + name + "','" + name + "','" + fips + "','" + type + "')" + comma);
                        usedCodes.add(fips);
                    }
                }
            }
        }
        System.out.println(";");
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
}
