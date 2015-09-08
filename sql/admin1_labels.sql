CREATE TABLE ne_10m_admin_1_states_provinces_lg_centroids AS (
  WITH geoms AS (
    SELECT name, admin, scalerank, (ST_Dump(geometry)).geom AS geometry 
    FROM ne_10m_admin_1_states_provinces
  )
  SELECT DISTINCT ON (name) name, admin, scalerank, ST_Centroid(geometry) AS geometry
  FROM geoms
  ORDER BY name ASC, ST_Area(geometry) DESC
);