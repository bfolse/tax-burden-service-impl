-- Postgis
-- Not supported yet
-- create extension postgis;

-- Sequence: public.hibernate_sequence
CREATE SEQUENCE public.hibernate_sequence
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.hibernate_sequence
  OWNER TO postgres;

-- Table: public.boundary_county
SET CLIENT_ENCODING TO UTF8;
SET STANDARD_CONFORMING_STRINGS TO ON;
DROP TABLE IF EXISTS "public"."boundary_county";
CREATE TABLE "public"."boundary_county" (gid serial,
"statefp" varchar(2),
"countyfp" varchar(3),
"countyns" varchar(8),
"affgeoid" varchar(14),
"geoid" varchar(5),
"name" varchar(100),
"lsad" varchar(2),
"aland" float8,
"awater" float8);
ALTER TABLE "public"."boundary_county" ADD PRIMARY KEY (gid);
SELECT AddGeometryColumn('public','boundary_county','geom','4269','MULTIPOLYGON',2);