# Terrain Classic

World-wide CartoCSS port of Stamen's classic terrain style.

Stamen's original Terrain style was developed as part of Stamen's
[Citytracking](https://github.com/Citytracking) initiative, funded by the
[Knight Foundation](http://www.knightfoundation.org/). The old repository can
be found [here](https://github.com/citytracking/terrain), for historical
interest.

The original Terrain style only covered the United States. As part of a 2014 Knight Foundation grant, we are expanding Terrain to cover the entire world. The new Knight Grant will also result in a totally-different new terrain style, so to avoid confusion, we are calling the old style "Terrain Classic."

![Terrain screenshot](https://github.com/stamen/terrain-classic/raw/master/terrain_classic.png?raw=true)

Most of the current development process for Terrain Classic is based on the [toner-carto repo](https://github.com/stamen/toner-carto).

## Developing

### Prerequisites

* PostgreSQL
* PostGIS
* Node.js
* GDAL
* TileMill 1@`master` (this includes the latest Mapnik): [github.com/mapbox/tilemill](https://github.com/mapbox/tilemill)
* [Imposm 3](https://github.com/omniscale/imposm3), which includes dependencies
  of its own: `go`, `leveldb`, and `protobuf`.

On OS X, installation with [Homebrew](http://brew.sh/) looks like this:

```
brew install postgis gdal node go leveldb protobuf

# follow instructions to start postgresql

mkdir -p /tmp/imposm
cd /tmp/imposm
export GOPATH=`pwd`
git clone https://github.com/omniscale/imposm3 src/imposm3
go get imposm3
go install imposm3

# bin/imposm3 is your new binary; either add $GOPATH/bin to your PATH or copy
# it to /usr/local/bin (or similar)
```

### Terrain Classic Itself

* Clone this repo
* Run `make link` to sym-link the project into your TileMill project directory
* Run `make db/shared` to fetch and transform Natural Earth and OSM coastline data
* Run `make db/CA` (or similar; see
  [`PLACES`](https://github.com/stamen/terrain-classic/blob/master/Makefile#L168-L178)
  in the `Makefile` for a list of registered extracts and expand it as
  desired).
* Run `make` to generate the `project.mml` file. (Alternatively, make
  `terrain-background`, `terrain-lines`, or
  `terrain-labels` to work on the variant styles)
* Start TileMill by running `npm start` from the TileMill repo
* Open http://localhost:20009/#/project/terrain-classic
