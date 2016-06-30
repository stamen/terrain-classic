SHELL := /bin/bash
PATH := $(PATH):node_modules/.bin

define EXPAND_EXPORTS
export $(word 1, $(subst =, , $(1))) := $(word 2, $(subst =, , $(1)))
endef

# wrap Makefile body with a check for pgexplode
ifeq ($(shell test -f node_modules/.bin/pgexplode; echo $$?), 0)

# load .env
$(foreach a,$(shell cat .env 2> /dev/null),$(eval $(call EXPAND_EXPORTS,$(a))))
# expand PG* environment vars
$(foreach a,$(shell set -a && source .env 2> /dev/null; node_modules/.bin/pgexplode),$(eval $(call EXPAND_EXPORTS,$(a))))

define create_relation
@psql -c "\d $(subst db/,,$@)" > /dev/null 2>&1 || \
	psql -v ON_ERROR_STOP=1 -qX1f sql/$(subst db/,,$@).sql
endef

define create_extension
@psql -c "\dx $(subst db/,,$@)" | grep $(subst db/,,$@) > /dev/null 2>&1 || \
	psql -v ON_ERROR_STOP=1 -qX1c "CREATE EXTENSION $(subst db/,,$@)"
endef

define register_function_target
.PHONY: db/functions/$(strip $(1))

db/functions/$(strip $(1)): db
	@psql -c "\df $(1)" | grep -i $(1) > /dev/null 2>&1 || \
		psql -v ON_ERROR_STOP=1 -qX1f sql/functions/$(1).sql
endef

default: terrain-classic

link:
	@test -e ${HOME}/Documents/MapBox/project && \
		test -e ${HOME}/Documents/MapBox/project/terrain-classic || \
		ln -sf "`pwd`" ${HOME}/Documents/MapBox/project/terrain-classic

clean:
	@rm -f *.mml *.xml

.env:
	@echo DATABASE_URL=postgres:///terrain-classic > $@

%: %.mml
	@cp $< project.mml

mml: $(subst .yml,.mml,$(filter-out circle.yml,$(wildcard *.yml)))

xml: $(subst .yml,.xml,$(filter-out circle.yml,$(wildcard *.yml)))

.PRECIOUS: %.mml

%.mml: %.yml map.mss labels.mss %.mss interp js-yaml
	@echo Building $@
	@cat $< | interp | js-yaml > tmp.mml && mv tmp.mml $@

.PRECIOUS: %.xml

%.xml: %.mml carto
	@echo
	@echo Building $@
	@echo
	@carto -a 3.0.11 $< > $@ || (rm -f $@; false)

.PHONY: carto

carto: node_modules/carto/package.json

.PHONY: interp

interp: node_modules/interp/package.json

.PHONY: js-yaml

js-yaml: node_modules/js-yaml/package.json

node_modules/carto/package.json: PKG = $(word 2,$(subst /, ,$@))
node_modules/carto/package.json: node_modules/millstone/package.json
	@type node > /dev/null 2>&1 || (echo "Please install Node.js" && false)
	@echo "Installing $(PKG)"
	@npm install $(PKG)

node_modules/interp/package.json: PKG = $(word 2,$(subst /, ,$@))
node_modules/interp/package.json:
	@type node > /dev/null 2>&1 || (echo "Please install Node.js" && false)
	@echo "Installing $(PKG)"
	@npm install $(PKG)

node_modules/js-yaml/package.json: PKG = $(word 2,$(subst /, ,$@))
node_modules/js-yaml/package.json:
	@type node > /dev/null 2>&1 || (echo "Please install Node.js" && false)
	@echo "Installing $(PKG)"
	@npm install $(PKG)

node_modules/millstone/package.json: PKG = $(word 2,$(subst /, ,$@))
node_modules/millstone/package.json:
	@type node > /dev/null 2>&1 || (echo "Please install Node.js" && false)
	@echo "Installing $(PKG)"
	@npm install $(PKG)

.PHONY: DATABASE_URL

DATABASE_URL:
	@test "${$@}" || (echo "$@ is undefined" && false)

.PHONY: db

db: DATABASE_URL
	@psql -c "SELECT 1" > /dev/null 2>&1 || \
	createdb

.PHONY: db/postgis

db/postgis: db
	$(call create_extension)

.PHONY: db/hstore

db/hstore: db
	$(call create_extension)

.PHONY: db/shared

db/shared: db/postgres db/aries db/shapefiles db/natearth db/generalizations db/landcover

# create targets for each file in sql/functions
$(foreach fn,$(shell ls sql/functions/ 2> /dev/null | sed 's/\..*//'),$(eval $(call register_function_target,$(fn))))

# Import PBF ($2) as $1
define import
.PHONY: db/osm-$(strip $(word 1, $(subst :, ,$(1)))) db/$(strip $(word 1, $(subst :, ,$(1))))

db/$(strip $(word 1, $(subst :, ,$(1)))): db/osm-$(strip $(word 1, $(subst :, ,$(1)))) db/shared

db/osm-$(strip $(word 1, $(subst :, ,$(1)))): db/postgis db/hstore $(strip $(word 2, $(subst :, ,$(1))))
	@psql -c "\d osm_roads" > /dev/null 2>&1 || \
	imposm3 import \
		--cachedir cache \
		-mapping=imposm3_mapping.json \
		-read $(strip $(word 2, $(subst :, ,$(1)))) \
		-connection="$${DATABASE_URL}" \
		-write \
		-deployproduction \
		-overwritecache
endef

.PHONY: db/postgres

db/postgres: db/functions/highroad db/functions/highway_shields db/functions/osm_admin_area

.PHONY: db/generalizations

db/generalizations: db/functions/admin1_labels

.PHONY: db/shapefiles

db/shapefiles: db/admin_0_countries_110m_points \
			 db/admin_0_labels_z4 \
			 db/admin_0_labels_z5 \
			 db/admin_0_labels_z6 \
			 db/admin_1_labels_z4 \
			 db/admin_1_labels_z5 \
			 db/continents \
			 db/land_polygons \
		   db/nullisland \
			 db/water_polygons

.PHONY: db/admin_0_countries_110m_points

db/admin_0_countries_110m_points: db/postgis shp/labels_admin/admin_0_countries_110m-points.shp
	@psql -c "\d $(subst db/,,$@)" > /dev/null 2>&1 || \
	ogr2ogr --config PG_USE_COPY YES \
			-nln $(subst db/,,$@) \
			-t_srs EPSG:3857 \
			-lco ENCODING=UTF-8 \
			-nlt PROMOTE_TO_MULTI \
			-lco POSTGIS_VERSION=2.0 \
			-lco GEOMETRY_NAME=geom \
			-lco SRID=3857 \
			-lco PRECISION=NO \
			-f PGDump /vsistdout/ \
			$(word 2, $^) | psql -q

.PHONY: admin_0_labels_z4

db/admin_0_labels_z4: db/postgis shp/labels_admin/admin-0-labels-z4.shp
	@psql -c "\d $(subst db/,,$@)" > /dev/null 2>&1 || \
	ogr2ogr --config PG_USE_COPY YES \
			-nln $(subst db/,,$@) \
			-t_srs EPSG:3857 \
			-lco ENCODING=UTF-8 \
			-nlt PROMOTE_TO_MULTI \
			-lco POSTGIS_VERSION=2.0 \
			-lco GEOMETRY_NAME=geom \
			-lco SRID=3857 \
			-lco PRECISION=NO \
			-f PGDump /vsistdout/ \
			$(word 2, $^) | psql -q

.PHONY: admin_0_labels_z5

db/admin_0_labels_z5: db/postgis shp/labels_admin/admin-0-labels-z5.shp
	@psql -c "\d $(subst db/,,$@)" > /dev/null 2>&1 || \
	ogr2ogr --config PG_USE_COPY YES \
			-nln $(subst db/,,$@) \
			-t_srs EPSG:3857 \
			-lco ENCODING=UTF-8 \
			-nlt PROMOTE_TO_MULTI \
			-lco POSTGIS_VERSION=2.0 \
			-lco GEOMETRY_NAME=geom \
			-lco SRID=3857 \
			-lco PRECISION=NO \
			-f PGDump /vsistdout/ \
			$(word 2, $^) | psql -q

.PHONY: admin_0_labels_z6

db/admin_0_labels_z6: db/postgis shp/labels_admin/admin-0-labels-z6.shp
	@psql -c "\d $(subst db/,,$@)" > /dev/null 2>&1 || \
	ogr2ogr --config PG_USE_COPY YES \
			-nln $(subst db/,,$@) \
			-t_srs EPSG:3857 \
			-lco ENCODING=UTF-8 \
			-nlt PROMOTE_TO_MULTI \
			-lco POSTGIS_VERSION=2.0 \
			-lco GEOMETRY_NAME=geom \
			-lco SRID=3857 \
			-lco PRECISION=NO \
			-f PGDump /vsistdout/ \
			$(word 2, $^) | psql -q

.PHONY: admin_1_labels_z4

db/admin_1_labels_z4: db/postgis shp/labels_admin/admin-1-labels-z4.shp
	@psql -c "\d $(subst db/,,$@)" > /dev/null 2>&1 || \
	ogr2ogr --config PG_USE_COPY YES \
			-nln $(subst db/,,$@) \
			-t_srs EPSG:3857 \
			-lco ENCODING=UTF-8 \
			-nlt PROMOTE_TO_MULTI \
			-lco POSTGIS_VERSION=2.0 \
			-lco GEOMETRY_NAME=geom \
			-lco SRID=3857 \
			-lco PRECISION=NO \
			-f PGDump /vsistdout/ \
			$(word 2, $^) | psql -q

.PHONY: admin_1_labels_z5

db/admin_1_labels_z5: db/postgis shp/labels_admin/admin-1-labels-z5.shp
	@psql -c "\d $(subst db/,,$@)" > /dev/null 2>&1 || \
	ogr2ogr --config PG_USE_COPY YES \
			-nln $(subst db/,,$@) \
			-t_srs EPSG:3857 \
			-lco ENCODING=UTF-8 \
			-nlt PROMOTE_TO_MULTI \
			-lco POSTGIS_VERSION=2.0 \
			-lco GEOMETRY_NAME=geom \
			-lco SRID=3857 \
			-lco PRECISION=NO \
			-f PGDump /vsistdout/ \
			$(word 2, $^) | psql -q

.PHONY: db/continents

db/continents: db/postgis shp/continents_900913.shp
	@psql -c "\d $(subst db/,,$@)" > /dev/null 2>&1 || \
	ogr2ogr --config PG_USE_COPY YES \
			-nln $(subst db/,,$@) \
			-t_srs EPSG:3857 \
			-lco ENCODING=UTF-8 \
			-nlt PROMOTE_TO_MULTI \
			-lco POSTGIS_VERSION=2.0 \
			-lco GEOMETRY_NAME=geom \
			-lco SRID=3857 \
			-lco PRECISION=NO \
			-f PGDump /vsistdout/ \
			$(word 2, $^) | psql -q

.PHONY: db/land_polygons

db/land_polygons: db/postgis data/osmdata/land_polygons_split.zip
	@psql -c "\d $(subst db/,,$@)" > /dev/null 2>&1 || \
	ogr2ogr --config PG_USE_COPY YES \
			-nln $(subst db/,,$@) \
			-t_srs EPSG:3857 \
			-lco ENCODING=UTF-8 \
			-nlt PROMOTE_TO_MULTI \
			-lco POSTGIS_VERSION=2.0 \
			-lco GEOMETRY_NAME=geom \
			-lco SRID=3857 \
			-lco PRECISION=NO \
			-clipsrc -20037508.34 -20037508.34 20037508.34 20037508.34 \
			-f PGDump /vsistdout/ \
			/vsizip/$(word 2, $^)/land-polygons-split-3857/land_polygons.shp | psql -q

.PHONY: db/nullisland

db/nullisland: db/postgis shp-local/nullisland.geojson
	@psql -c "\d $(subst db/,,$@)" > /dev/null 2>&1 || \
	ogr2ogr --config PG_USE_COPY YES \
			-nln $(subst db/,,$@) \
			-t_srs EPSG:3857 \
			-lco ENCODING=UTF-8 \
			-nlt PROMOTE_TO_MULTI \
			-lco POSTGIS_VERSION=2.0 \
			-lco GEOMETRY_NAME=geom \
			-lco SRID=3857 \
			-lco PRECISION=NO \
			-f PGDump /vsistdout/ \
			$(word 2, $^) | psql -q

.PHONY: db/water_polygons

db/water_polygons: db/postgis data/osmdata/water_polygons.zip
	@psql -c "\d $(subst db/,,$@)" > /dev/null 2>&1 || \
	ogr2ogr --config PG_USE_COPY YES \
			-nln $(subst db/,,$@) \
			-t_srs EPSG:3857 \
			-lco ENCODING=UTF-8 \
			-nlt PROMOTE_TO_MULTI \
			-lco POSTGIS_VERSION=2.0 \
			-lco GEOMETRY_NAME=geom \
			-lco SRID=3857 \
			-lco PRECISION=NO \
			-f PGDump /vsistdout/ \
			/vsizip/$(word 2, $^)/water-polygons-split-3857/water_polygons.shp | psql -q

.PHONY: db/natearth

db/natearth: db/ne_50m_ocean \
		   db/ne_10m_ocean \
		   db/ne_50m_land \
		   db/ne_10m_rivers_lake_centerlines_scale_rank \
		   db/ne_50m_admin_0_countries_lakes \
		   db/ne_10m_admin_0_countries_lakes \
		   db/ne_10m_admin_0_boundary_lines_map_units \
		   db/ne_50m_admin_1_states_provinces_lines \
		   db/ne_10m_geography_marine_polys \
		   db/ne_50m_geography_marine_polys \
		   db/ne_110m_geography_marine_polys \
		   db/ne_10m_airports \
		   db/ne_10m_roads \
		   db/ne_10m_lakes \
		   db/ne_50m_lakes \
		   db/ne_10m_admin_0_boundary_lines_land \
		   db/ne_50m_admin_0_boundary_lines_land \
		   db/ne_10m_admin_1_states_provinces_scale_rank \
		   db/ne_10m_admin_1_states_provinces_lines \
		   db/ne_10m_geography_regions_elevation_points

db/aries: db/postgis data/aries/z4to10.json
	@psql -c "\d $(subst db/,,$@)" > /dev/null 2>&1 || \
	ogr2ogr --config PG_USE_COPY YES \
		-t_srs EPSG:3857 \
		-nlt PROMOTE_TO_MULTI \
		-nln $(subst db/,,$@) \
		-lco GEOMETRY_NAME=geometry \
		-lco SRID=3857 \
		-f PGDump /vsistdout/ \
		$(word 2,$^) | pv | psql -q

# TODO places target that lists registered places
PLACES=BC:data/extract/north-america/ca/british-columbia-latest.osm.pbf \
	   CA:data/extract/north-america/us/california-latest.osm.pbf \
	   belize:data/extract/central-america/belize-latest.osm.pbf \
	   switzerland:data/extract/europe/switzerland-latest.osm.pbf \
	   mexico:data/extract/north-america/mexico-latest.osm.pbf \
	   mexico_city:data/metro/mexico-city_mexico.osm.pbf \
	   japan:data/extract/asia/japan-latest.osm.pbf \
	   tokyo:data/metro/tokyo_japan.osm.pbf \
	   cle:data/metro/cleveland_ohio.osm.pbf \
	   MA:data/extract/north-america/us/massachusetts-latest.osm.pbf \
	   NY:data/extract/north-america/us/new-york-latest.osm.pbf \
	   OH:data/extract/north-america/us/ohio-latest.osm.pbf \
	   sf:data/metro/san-francisco-bay_california.osm.pbf \
	   sfbay:data/metro/sf-bay-area.osm.pbf \
	   seattle:data/metro/seattle_washington.osm.pbf \
	   WA:data/extract/north-america/us/washington-latest.osm.pbf \
	   vancouver:data/metro/vancouver_canada.osm.pbf

$(foreach place,$(PLACES),$(eval $(call import,$(place))))

.SECONDARY: data/extract/%

data/extract/%:
	@mkdir -p $$(dirname $@)
	curl -Lf http://download.geofabrik.de/$(@:data/extract/%=%) -o $@

.SECONDARY: data/metro/%

data/metro/%:
	@mkdir -p $$(dirname $@)
	curl -Lf https://s3.amazonaws.com/metro-extracts.mapzen.com/$(@:data/metro/%=%) -o $@

.SECONDARY: data/osmdata/land_polygons.zip

# so the zip matches the shapefile name
data/osmdata/land_polygons.zip:
	@mkdir -p $$(dirname $@)
	curl -Lf http://data.openstreetmapdata.com/land-polygons-complete-3857.zip -o $@

.SECONDARY: data/osmdata/land_polygons_split.zip

data/osmdata/land_polygons_split.zip:
	@mkdir -p $$(dirname $@)
	curl -Lf http://data.openstreetmapdata.com/land-polygons-split-3857.zip -o $@

.SECONDARY: data/osmdata/water_polygons.zip

data/osmdata/water_polygons.zip:
	@mkdir -p $$(dirname $@)
	curl -Lf http://data.openstreetmapdata.com/water-polygons-split-3857.zip -o $@

define natural_earth
db/$(strip $(word 1, $(subst :, ,$(1)))): $(strip $(word 2, $(subst :, ,$(1)))) db/postgis
	@psql -c "\d $(strip $(word 1, $(subst :, ,$(1))))" > /dev/null 2>&1 || \
	ogr2ogr --config OGR_ENABLE_PARTIAL_REPROJECTION TRUE \
			--config SHAPE_ENCODING WINDOWS-1252 \
			--config PG_USE_COPY YES \
			-nln $$(subst db/,,$$@) \
			-t_srs EPSG:3857 \
			-lco ENCODING=UTF-8 \
			-nlt PROMOTE_TO_MULTI \
			-lco POSTGIS_VERSION=2.0 \
			-lco GEOMETRY_NAME=geom \
			-lco SRID=3857 \
			-lco PRECISION=NO \
			-clipsrc -180 -85.05112878 180 85.05112878 \
			-segmentize 1 \
			-skipfailures \
			-f PGDump /vsistdout/ \
			/vsizip/$$</$(strip $(word 3, $(subst :, ,$(1)))) | psql -q
endef

# <name>:<source file>:[shapefile]
NATURAL_EARTH=ne_50m_land:data/ne/50m/physical/ne_50m_land.zip \
	ne_10m_ocean:data/ne/10m/physical/ne_10m_ocean.zip \
	ne_50m_ocean:data/ne/50m/physical/ne_50m_ocean.zip \
	ne_10m_rivers_lake_centerlines_scale_rank:data/ne/10m/physical/ne_10m_rivers_lake_centerlines_scale_rank.zip \
	ne_50m_admin_0_countries_lakes:data/ne/50m/cultural/ne_50m_admin_0_countries_lakes.zip \
	ne_10m_admin_0_countries_lakes:data/ne/10m/cultural/ne_10m_admin_0_countries_lakes.zip \
	ne_10m_admin_0_boundary_lines_map_units:data/ne/10m/cultural/ne_10m_admin_0_boundary_lines_map_units.zip \
	ne_50m_admin_1_states_provinces_lines:data/ne/50m/cultural/ne_50m_admin_1_states_provinces_lines.zip \
	ne_10m_geography_marine_polys:data/ne-stamen/10m/physical/ne_10m_geography_marine_polys.zip \
	ne_50m_geography_marine_polys:data/ne-stamen/50m/physical/ne_50m_geography_marine_polys.zip \
	ne_110m_geography_marine_polys:data/ne-stamen/110m/physical/ne_110m_geography_marine_polys.zip \
	ne_10m_airports:data/ne-stamen/10m/cultural/ne_10m_airports.zip \
	ne_10m_roads:data/ne/10m/cultural/ne_10m_roads.zip \
	ne_10m_lakes:data/ne/10m/physical/ne_10m_lakes.zip \
	ne_50m_lakes:data/ne/50m/physical/ne_50m_lakes.zip \
	ne_10m_admin_0_boundary_lines_land:data/ne/10m/cultural/ne_10m_admin_0_boundary_lines_land.zip \
	ne_50m_admin_0_boundary_lines_land:data/ne/50m/cultural/ne_50m_admin_0_boundary_lines_land.zip \
	ne_10m_admin_1_states_provinces_scale_rank:data/ne-stamen/10m/cultural/ne_10m_admin_1_states_provinces_scale_rank.zip:ne_10m_admin_1_states_provinces_scale_rank/ne_10m_admin_1_states_provinces_scale_rank.shp \
	ne_10m_admin_1_states_provinces_lines:data/ne/10m/cultural/ne_10m_admin_1_states_provinces_lines.zip:ne_10m_admin_1_states_provinces_lines.shp \
	ne_10m_geography_regions_elevation_points:data/ne/10m/physical/ne_10m_geography_regions_elevation_points.zip:ne_10m_geography_regions_elevation_points.shp

$(foreach shape,$(NATURAL_EARTH),$(eval $(call natural_earth,$(shape))))

define natural_earth_sources
.SECONDARY: data/ne/$(1)/$(2)/%.zip

data/ne/$(1)/$(2)/%.zip:
	@mkdir -p $$(dir $$@)
	curl -fL http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/$(1)/$(2)/$$(@:data/ne/$(1)/$(2)/%=%) -o $$@

.SECONDARY: data/ne/$(1)/$(2)/%.zip

data/ne-stamen/$(1)/$(2)/%.zip:
	@mkdir -p $$(dir $$@)
	curl -fL "https://github.com/stamen/natural-earth-vector/blob/master/zips/$(1)_$(2)/$$(@:data/ne-stamen/$(1)/$(2)/%=%)?raw=true" -o $$@
endef

scales=10m 50m 110m
themes=cultural physical raster

$(foreach a,$(scales),$(foreach b,$(themes),$(eval $(call natural_earth_sources,$(a),$(b)))))

.PHONY: db/landcover

db/landcover: landcover/LCType_z9.tif

landcover/LCType_z9.tif: landcover/LCType.tif
	gdalwarp -t_srs EPSG:3857 -multi -wm 256 -wo NUM_THREADS=ALL_CPUS -co tiled=yes -co compress=lzw -co predictor=2 -co sparse_ok=true -co blockxsize=256 -co blockysize=256 -ts 131072 131072 $< $@
	gdaladdo $@ --config COMPRESS_OVERVIEW LZW --config PREDICTOR_OVERVIEW 2 2 4 8 16 32 64 128 256

landcover/LCType.tif: landcover/GlobalLandCover_tif.zip
	unzip -oju $< -d $$(dirname $@)

.SECONDARY: landcover/GlobalLandCover_tif.zip

landcover/GlobalLandCover_tif.zip:
	curl -fL "http://landcover.usgs.gov/documents/GlobalLandCover_tif.zip" -o $@

# complete wrapping
else
default:
	$(error Please install pgexplode: "npm install pgexplode")
endif
