DROP MATERIALIZED VIEW IF EXISTS highway_shields;

CREATE MATERIALIZED VIEW highway_shields AS
  SELECT
    ref,
    highway,
    (ST_DumpPoints(ST_Simplify(ST_Collect(geometry), 500))).geom geometry,
    CASE WHEN ref ~ 'I \d+' THEN 1
         WHEN ref ~ 'US \d+' THEN 2
         WHEN ref ~ 'CA \d+' THEN 3
         ELSE 100
    END AS priority
  FROM (
    SELECT
      unnest(string_to_array(ref, ';')) AS ref,
      highway,
      geometry
    FROM osm_roads
    WHERE highway IN ('motorway', 'trunk', 'primary', 'secondary', 'tertiary')
  ) AS _
  WHERE ref ~ '(CA|US|I) \d{1,3}$'
  GROUP BY ref, highway
  -- shuffle to ensure that routes carrying more than 1 number can display all
  -- of them
  ORDER BY ST_GeoHash(ST_Transform(ST_SetSRID(ST_Extent(geometry), 3857), 4326)), random();

CREATE INDEX highway_shields_geom_gist ON highway_shields USING GIST(geometry);
