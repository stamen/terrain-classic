DROP MATERIALIZED VIEW IF EXISTS highway_shields;

CREATE MATERIALIZED VIEW highway_shields AS
  SELECT
    ref,
    highway,
    (ST_DumpPoints(ST_Simplify(ST_Collect(geom), 500))).geom,
    CASE WHEN ref ~ 'I \d+' THEN 1
         WHEN ref ~ 'US \d+' THEN 2
         WHEN ref ~ 'CA \d+' THEN 3
         ELSE 100
    END AS priority
  FROM (
    SELECT
      unnest(string_to_array(tags -> 'ref', ';')) AS ref,
      tags -> 'highway' AS highway,
      geom geom
    FROM osm_planet
    WHERE tags ? 'ref'
      AND tags -> 'highway' IN ('motorway', 'trunk', 'primary', 'secondary', 'tertiary')
  ) AS _
  WHERE ref ~ '(CA|US|I) \d{1,3}$'
  GROUP BY ref, highway
  -- shuffle to ensure that routes carrying more than 1 number can display all
  -- of them
  ORDER BY ST_GeoHash(ST_Transform(ST_SetSRID(ST_Extent(geom), 3857), 4326)), random();

CREATE INDEX highway_shields_geom_gist ON highway_shields USING GIST(geom);
