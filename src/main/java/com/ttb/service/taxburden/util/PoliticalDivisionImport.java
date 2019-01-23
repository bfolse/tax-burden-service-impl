package com.ttb.service.taxburden.util;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class PoliticalDivisionImport {
    private static final String EMPTY_COUNTY = "000";
    private static final String EMPTY_PLACE = "00000";

    public static void main(String[] args) {
        List l = readFileInList(args[0]);

        Iterator<String> itr = l.iterator();
        while (itr.hasNext()) {
            String line = itr.next();
//            System.out.println(line);
            String[] tokens = line.split(",");
            String level = tokens[0];
            String state = tokens[1];
            String county = state = tokens[2];
        }
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
