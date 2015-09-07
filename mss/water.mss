/**
 * "shore" is a general class for layers with continents, coastlines, lakes,
 * and other kinds of meeting points between water and land.
 */
.shore {
  line-color: @color_physical;
  /* lighten background color, as we decrease landcover opacity */
  [zoom>=12] {
    polygon-fill: lighten(@color_physical,20);
  }
  [zoom>=14] {
    polygon-fill: lighten(@color_physical,40);
  }

  line-cap: round;
  line-join: round;
  line-width: 0;
}

#water,
#ne_50m_ocean,
#ne_10m_lakes,
#ne_50m_lakes
{  
  line-color: @color_water;
  line-width: 0;
  polygon-fill: @color_water;

  [zoom>=5]{
    line-width: 0.5;
  }
}

#lakes-50m[zoom<3][scalerank<1],
#lakes-50m[zoom=3][scalerank<2],
#lakes-50m[zoom=4][scalerank<3],
#lakes-50m[zoom=5][scalerank<5],
#lakes-50m[zoom=6],
#lakes-10m,
{
  line-width: 1;
  polygon-fill: @color_physical;
}

#ne_10m_rivers_lake_centerlines_scale_rank
{
  [zoom=4][scalerank<4] {
    line-color: @color_water;
    line-width: 0.5;
    [strokeweig>1] { line-width: 1; }
    [strokeweig>2] { line-width: 2; }
  }
  [zoom=5][scalerank<5] {
    line-color: @color_water;
    line-width: 0.5;
    [strokeweig>1] { line-width: 1; }
    [strokeweig>2] { line-width: 2; }
  }
  [zoom=6][scalerank<6] {
    line-color: @color_water;
    line-width: 0.5;
    [strokeweig>1] { line-width: 1; }
    [strokeweig>2] { line-width: 2; }
  }
  [zoom=7][scalerank<7] {
    line-color: @color_water;
    line-width: 1;
    [strokeweig>1] { line-width: 1.5; }
    [strokeweig>2] { line-width: 2.5; }
  }
  [zoom>=8] {
    line-width: 1;
    line-color: @color_water;
    [strokeweig>1] { line-width: 2; }
    [strokeweig>2] { line-width: 3; }
  }
}

/**
 * Ocean, lake, and river polygons
 */
#water-bodies-low[zoom=8][area>50000000],
#water-bodies-low[zoom=9][area>10000000],
#water-bodies-low[zoom=10][area>2500000],
#water-bodies-med[zoom=11][area> 800000],
#water-bodies-med[zoom=12][area> 500000],
#water-bodies-med[zoom=13][area>  25000],
#water-bodies-high[zoom=14][area> 10000],
#water-bodies-high[zoom>=15]
{ 
  polygon-fill: @color_water;
}

/**
 * Water bodies that are parts of rivers
 * should never be filtered
 */
#water-bodies-low[type='riverbank'],
#water-bodies-med[type='riverbank'],
#water-bodies-high[type='riverbank']
{ 
  polygon-fill: @color_water;
}

#nullisland {
  polygon-fill: @color_physical;
}