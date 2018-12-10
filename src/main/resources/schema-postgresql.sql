-- Sequence: public.hibernate_sequence
DROP SEQUENCE IF EXISTS public.hibernate_sequence;

-- Table: public.consumer_expenditure_profile_entry
DROP TABLE IF EXISTS public.consumer_expenditure_profile_entry;

-- Table: public.consumer_expenditure_profile
DROP TABLE IF EXISTS public.consumer_expenditure_profile CASCADE;

-- Table: public.tax_definition_expenditure_category
DROP TABLE IF EXISTS public.tax_definition_expenditure_category;

-- Table: public.expenditure_category_group_expenditure_category_key
DROP TABLE IF EXISTS public.expenditure_category_group_expenditure_category_key;

-- Table: public.expenditure_category_group
DROP TABLE IF EXISTS public.expenditure_category_group;

-- TEMPORARY --
-- Table: public.tax_payer_profile_political_division_keys
DROP TABLE IF EXISTS public.tax_payer_profile_political_division_keys;

 -- Table: public.tax_payer_profile_political_divisions
DROP TABLE IF EXISTS public.tax_payer_profile_political_divisions;

-- Table: public.tax_burden_report_tax_entries
DROP TABLE IF EXISTS public.tax_burden_report_tax_entries;

-- Table: public.tax_entry
DROP TABLE IF EXISTS public.tax_entry CASCADE;

-- Table: public.tax_burden_report
DROP TABLE IF EXISTS public.tax_burden_report CASCADE;

-- Table: public.tax_payer_profile
DROP TABLE IF EXISTS public.tax_payer_profile;

-- Table: public.expenditure_category
DROP TABLE IF EXISTS public.expenditure_category;

-- Table: public.tax_definition
DROP TABLE IF EXISTS public.tax_definition;

-- Table: public.assessed_rate
DROP TABLE IF EXISTS public.assessed_rate;

-- Table: public.tax_rate
DROP TABLE IF EXISTS public.tax_rate CASCADE;

-- Table: public.postal_code_political_division
DROP TABLE IF EXISTS public.postal_code_political_division;

-- Table: public.political_division
DROP TABLE IF EXISTS public.political_division;

-- Table: public.monetary_amount
DROP TABLE IF EXISTS public.monetary_amount;

-- Table: public.tax_rate_set
DROP TABLE IF EXISTS public.tax_rate_set CASCADE;

-- Table: public.tax_rate_set_tax_rates
DROP TABLE IF EXISTS public.tax_rate_set_tax_rates;

-- Sequence: public.hibernate_sequence
CREATE SEQUENCE public.hibernate_sequence
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.hibernate_sequence
  OWNER TO ttbdev;

-- Table: public.monetary_amount
CREATE TABLE public.monetary_amount
(
  id bigint NOT NULL,
  amount numeric(19,2),
  currency character varying(255),
  CONSTRAINT monetary_amount_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.monetary_amount
  OWNER TO ttbdev;

-- Table: public.political_division
CREATE TABLE public.political_division
(
  id bigint NOT NULL,
  description character varying(255),
  fips character varying(255) NOT NULL,
  name character varying(255),
  type character varying(255),
  CONSTRAINT political_division_pkey PRIMARY KEY (id),
  CONSTRAINT uk_9aqb5i2hpaw2ep01av4ilbjsm UNIQUE (fips)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.political_division
  OWNER TO ttbdev;

-- Table: public.tax_payer_profile
CREATE TABLE public.tax_payer_profile
(
    id bigint NOT NULL,
    consumer_expenditure_profile_key character varying(255) COLLATE pg_catalog."default",
    postal_code character varying(255) COLLATE pg_catalog."default",
    tax_payer_profile_key character varying(255) COLLATE pg_catalog."default",
    "timestamp" timestamp without time zone,
    annual_income_id bigint,
    mortgage_interest_id bigint,
    real_property_market_value_id bigint,
    CONSTRAINT tax_payer_profile_pkey PRIMARY KEY (id),
    CONSTRAINT fkleh6a51j5j3l33agkrvxdqtqs FOREIGN KEY (mortgage_interest_id)
        REFERENCES public.monetary_amount (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkn0kwv8atsd7ovr2sa44stlyp6 FOREIGN KEY (real_property_market_value_id)
        REFERENCES public.monetary_amount (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkqwk3insvhwv42rsqdb787vcyk FOREIGN KEY (annual_income_id)
        REFERENCES public.monetary_amount (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);
ALTER TABLE public.tax_payer_profile
  OWNER TO ttbdev;

-- Table: public.tax_definition
CREATE TABLE public.tax_definition
(
  id bigint NOT NULL,
  description character varying(255),
  ordinal integer NOT NULL,
  political_division_key character varying(255),
  tax_calc_strategy character varying(255),
  tax_definition_key character varying(255) NOT NULL,
  tax_type character varying(255),
  CONSTRAINT tax_definition_pkey PRIMARY KEY (id),
  CONSTRAINT uk_1fnffr1fpofe5im9vhhmty9rh UNIQUE (tax_definition_key)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.tax_definition
  OWNER TO ttbdev;

-- Table: public.expenditure_category
CREATE TABLE public.expenditure_category
(
  id bigint NOT NULL,
  description character varying(255),
  expenditure_category_key character varying(255) NOT NULL,
  CONSTRAINT expenditure_category_pkey PRIMARY KEY (id),
  CONSTRAINT uk_iauitsidsk7sg9gb67y8ssgg4 UNIQUE (expenditure_category_key)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.expenditure_category
  OWNER TO ttbdev;

-- Table: public.expenditure_category_group
CREATE TABLE public.expenditure_category_group
(
  id bigint NOT NULL,
  description character varying(255),
  expenditure_category_group_key character varying(255) NOT NULL,
  CONSTRAINT expenditure_category_group_pkey PRIMARY KEY (id),
  CONSTRAINT uk_f429byyp68od09kt4tc31dk6o UNIQUE (expenditure_category_group_key)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.expenditure_category_group
  OWNER TO ttbdev;

-- Table: public.expenditure_category_group_expenditure_category_key
CREATE TABLE public.expenditure_category_group_expenditure_category_key
(
  expenditure_category_group_id bigint NOT NULL,
  expenditure_category_keys character varying(255),
  CONSTRAINT fkmpcnskur94uaaay15v8sabs2c FOREIGN KEY (expenditure_category_group_id)
      REFERENCES public.expenditure_category_group (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.expenditure_category_group_expenditure_category_key
  OWNER TO ttbdev;

-- Table: public.tax_payer_profile_political_divisions
CREATE TABLE public.tax_payer_profile_political_divisions
(
    tax_payer_profile_id bigint NOT NULL,
    political_divisions_id bigint NOT NULL,
    CONSTRAINT fkaj05cbwth5uduljjuokuuum8l FOREIGN KEY (tax_payer_profile_id)
        REFERENCES public.tax_payer_profile (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fki8r1w43xd9k8ah3x6ou6yty27 FOREIGN KEY (political_divisions_id)
        REFERENCES public.political_division (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);
ALTER TABLE public.tax_payer_profile_political_divisions
    OWNER to ttbdev;

  -- Table: public.tax_burden_report
CREATE TABLE public.tax_burden_report
(
  id bigint NOT NULL,
  report_key character varying(255),
  "timestamp" timestamp without time zone,
  tax_payer_profile_id bigint,
  CONSTRAINT tax_burden_report_pkey PRIMARY KEY (id),
  CONSTRAINT fksifsm86mgl79e2dwb41u07s9r FOREIGN KEY (tax_payer_profile_id)
      REFERENCES public.tax_payer_profile (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.tax_burden_report
  OWNER TO ttbdev;

-- Table: public.tax_entry
CREATE TABLE public.tax_entry
(
  id bigint NOT NULL,
  tax_type integer,
  amount_id bigint,
  political_division_id bigint,
  CONSTRAINT tax_entry_pkey PRIMARY KEY (id),
  CONSTRAINT fkf3adhtjr00xfr5y0ricg8q4s9 FOREIGN KEY (political_division_id)
      REFERENCES public.political_division (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkn5480468l3jx7v3f8vydotfx6 FOREIGN KEY (amount_id)
      REFERENCES public.monetary_amount (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.tax_entry
  OWNER TO ttbdev;

-- Table: public.tax_burden_report_tax_entries
CREATE TABLE public.tax_burden_report_tax_entries
(
  tax_burden_report_id bigint NOT NULL,
  tax_entries_id bigint NOT NULL,
  CONSTRAINT fkckcgmiij0uxa43rn8eojd30bp FOREIGN KEY (tax_burden_report_id)
      REFERENCES public.tax_burden_report (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkpr389g63so6obnfs1qyok6636 FOREIGN KEY (tax_entries_id)
      REFERENCES public.tax_entry (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT uk_54b60oydp8g0qvxv9j35dh3tg UNIQUE (tax_entries_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.tax_burden_report_tax_entries
  OWNER TO ttbdev;

-- Table: public.tax_rate
CREATE TABLE public.tax_rate
(
  id bigint NOT NULL,
  range_high integer,
  range_low integer,
  rate numeric(19,6),
  tax_definition_key character varying(255),
  CONSTRAINT tax_rate_pkey PRIMARY KEY (id),
  CONSTRAINT uk_fssqkiah11hqcy91qier4yeh3 UNIQUE (tax_definition_key)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.tax_rate
  OWNER TO ttbdev;

-- Table: public.assessed_rate
CREATE TABLE public.assessed_rate
(
  id bigint NOT NULL,
  rate numeric(19,6),
  tax_definition_key character varying(255),
  CONSTRAINT assessed_rate_pkey PRIMARY KEY (id),
  CONSTRAINT uk_rwicclcvtbpyihm0cfujjm7ge UNIQUE (tax_definition_key)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.assessed_rate
  OWNER TO ttbdev;

-- Table: public.postal_code_political_division
CREATE TABLE public.postal_code_political_division
(
  id bigint NOT NULL,
  political_division_key character varying(255) NOT NULL,
  postal_code character varying(255) NOT NULL,
  CONSTRAINT postal_code_political_division_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.postal_code_political_division
  OWNER TO ttbdev;

-- Table: public.tax_definition_expenditure_category
CREATE TABLE public.tax_definition_expenditure_category
(
  id bigint NOT NULL,
  expenditure_category_group_key character varying(255) NOT NULL,
  tax_definition_key character varying(255) NOT NULL,
  CONSTRAINT tax_definition_expenditure_category_pkey PRIMARY KEY (id),
  CONSTRAINT uk_iyosrb6lgpr1a5d0hjfe8cj8g UNIQUE (tax_definition_key)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.tax_definition_expenditure_category
  OWNER TO ttbdev;

-- Table: public.consumer_expenditure_profile
CREATE TABLE public.consumer_expenditure_profile
(
  id bigint NOT NULL,
  consumer_expenditure_profile_key character varying(255),
  description character varying(255),
  CONSTRAINT consumer_expenditure_profile_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.consumer_expenditure_profile
  OWNER TO ttbdev;

  -- Table: public.consumer_expenditure_profile_entry
  CREATE TABLE public.consumer_expenditure_profile_entry
(
  consumer_expenditure_profile_id bigint NOT NULL,
  percentage numeric(19,6),
  expenditure_category_key character varying(255) NOT NULL,
  CONSTRAINT consumer_expenditure_profile_entry_pkey PRIMARY KEY (consumer_expenditure_profile_id, expenditure_category_key),
  CONSTRAINT fkc1a9ute5fvchw2xgrthsdmbwq FOREIGN KEY (consumer_expenditure_profile_id)
      REFERENCES public.consumer_expenditure_profile (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.consumer_expenditure_profile_entry
  OWNER TO ttbdev;

--
-- Postgis Spatial Data Schema
--
SET CLIENT_ENCODING TO UTF8;
SET STANDARD_CONFORMING_STRINGS TO ON;

  -- Table: public.boundary_county

ALTER TABLE IF EXISTS public.boundary_county DROP COLUMN IF EXISTS geom;
DROP TABLE IF EXISTS public.boundary_county;
CREATE TABLE public.boundary_county
(
    gid serial,
    statefp varchar(2),
    countyfp varchar(3),
    countyns varchar(8),
    affgeoid varchar(14),
    geoid varchar(5),
    name varchar(100),
    lsad varchar(2),
    aland float8,
    awater float8,
    CONSTRAINT boundary_county_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
SELECT AddGeometryColumn('public','boundary_county','geom','4326','MULTIPOLYGON',2);
ALTER TABLE public.boundary_county
  OWNER TO ttbdev;

  -- Table: public.boundary_place

ALTER TABLE IF EXISTS public.boundary_place DROP COLUMN IF EXISTS geom;
DROP TABLE IF EXISTS public.boundary_place;
CREATE TABLE public.boundary_place
(
    gid serial,
    statefp varchar(2),
    placefp varchar(5),
    placens varchar(8),
    affgeoid varchar(16),
    geoid varchar(7),
    name varchar(100),
    lsad varchar(2),
    aland float8,
    awater float8,
    CONSTRAINT boundary_place_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
SELECT AddGeometryColumn('public','boundary_place','geom','4326','MULTIPOLYGON',2);
ALTER TABLE public.boundary_place
  OWNER TO ttbdev;

  -- Table: public.boundary_postal_code

ALTER TABLE IF EXISTS public.boundary_postal_code DROP COLUMN IF EXISTS geom;
DROP TABLE IF EXISTS public.boundary_postal_code;
CREATE TABLE public.boundary_postal_code
(
    gid serial,
    zcta5ce10 varchar(5),
    affgeoid10 varchar(14),
    geoid10 varchar(5),
    aland10 float8,
    awater10 float8,
    CONSTRAINT boundary_postal_code_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
SELECT AddGeometryColumn('public','boundary_postal_code','geom','4326','MULTIPOLYGON',2);
ALTER TABLE public.boundary_postal_code
  OWNER TO ttbdev;
