ALTER TABLE IF EXISTS osm_admin
ADD COLUMN area_km2 numeric;

UPDATE osm_admin SET area_km2 = ST_Area(geometry)/1000;