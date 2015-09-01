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
brew install postgis gdal node go leveldb protobuf pv

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
  `terrain-classic-background`, `terrain-classic-lines`, or
  `terrain-classic-labels` to work on the variant styles)
* Start TileMill by running `npm start` from the TileMill repo
* Open http://localhost:20009/#/project/terrain-classic

`make db/<place>` will write to the database specified in `.env` (with a format that resembles `postgres:///terrain`, where `terrain` is the database name). If you experience trouble connecting,
try adding credentials, e.g. `postgres://user:password@localhost/terrain` (it
will use `$USER` with no password otherwise).  Barring that, check your
`pg_hba.conf` to ensure that access is configured correctly.

(We primarily develop on OS X where PostgreSQL from Homebrew works out of the
box.)

**NOTE**: Changes to project settings (i.e. `.mml` files not `.mss` stylesheets) in TileMill will
not persist the changes. To make changes, edit the relevant `.yml` file and
re-run `make [variant]` to re-generate the `project.mml` that TileMill reads.

To test the terrain style with a hillshade overlay, a `tessera.json` config is provided. Install tessera with `npm install tessera` and then run `npm start` in the terrain-classic directory. Open http://localhost:8080/ to view the `terrain-classic` style composited with Open Terrain hillshades.

## FAQ

> What's the deal with the `Makefile`? Why is it so complicated?

Magic, mostly. It probably can (and should) be simplified! Consider this
another, in-progress "make for data" approach (which actually uses `make`).

The goal here is to provide an idempotent process for bootstrapping the project
that uses as few additional dependencies as possible.  `make` is the age-old
solution to this problem, although it takes a more file-focused approach. Put
another way, it attempts to efficiently encapsulate otherwise complicated and
error-prone operations.

The `Makefile` here attempts to replicate `make`'s behavior relative to
rebuilding files with database tables. In other words, if a Postgres relation
already exists, it will be left as-is. If it doesn't exist (has been dropped or
hasn't been created), it will be created on-demand.

> Why do I have to install `pgexplode`?

`libpq` (which underlies PostgreSQL's command-line tools) supports a number of
[environment
variables](http://www.postgresql.org/docs/9.4/static/libpq-envars.html) which
can be used to avoid repetition (and avoid errors). However, each component of
the connection information is separate, and is more easily and concisely
encoded in a URI (i.e. `DATABASE_URL`). `pgexplode` is aware of `libpq`'s
environment variables and will expand `DATABASE_URL`s components (which is
simpler than managing multiple values and constructing a URL for `imposm3` and
other tools).