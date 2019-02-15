package com.ttb.service.taxburden.domain;

public enum PoliticalDivisionType {
    FEDERAL(1),
    STATE(2),
    COUNTY(3),
    CITY(4),
    COUNTY_SUBDIVISION(5),
    CONSOLIDATED_CITY(6);

    private int level;

    PoliticalDivisionType(int level) {
        this.level = level;
    }

    public int getLevel() {
        return level;
    }
}
