#green-areas-low[zoom=10][area>5000000],
#green-areas-med[zoom=11][area>1000000],
#green-areas-med[zoom=12][area> 500000],
#green-areas-med[zoom=12][area> 200000],
#green-areas-med[zoom=13][area>  75000],
#green-areas-high[zoom=13][area> 10000],
#green-areas-high[zoom>13],
#green-areas-high[zoom>=13],
{
  polygon-fill: @color_green_areas;
  // polygon-opacity: 0.5;
  polygon-comp-op: src;

  [type='nature_reserve'] {
    polygon-fill: @color_green_areas;
    // polygon-opacity: 0.3;
  }
}

#land {
  polygon-fill: @color_physical;
}