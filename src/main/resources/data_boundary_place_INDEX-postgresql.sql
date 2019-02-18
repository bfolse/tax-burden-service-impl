CREATE INDEX ON "public"."boundary_place" USING GIST ("geom");
COMMIT;
ANALYZE "public"."boundary_place";