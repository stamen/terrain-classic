@color_physical: #dee0be;
@color_physical_bright: #fff;
@color_urban: #EDEDED; // 7% k
@color_water: #99b3cc;
@color_administrative_lowzoom: #000;
@color_administrative_dark: #000;
@color_administrative_bright: #fff;
@color_administrative_medium_low: #000;
@color_administrative_medium_high: #000;
@color_administrative_medium_high2: #000;
@color_transport: #999; // 40% K
@color_transport_casing_z10: #ddd;
@color_transport_casing: #fff;
@color_transport_inline: #fff;
@color_transport_tunnel: #ccc; // 20% K
@color_transport_hwy: #737373; // 55% K 
@color_transport_minor: #aaa; 
@color_transport_rail: #aaa; // 33% K
@color_transport_path: #666; // 60% K
@color_building: #ccc;
@color_building_outline: darken(@color_building,20);
@color_building_outline_special: #00aeef;
@color_airport_runways: #c8cebe; // hsl(82,8,81)
@color_airport_runways_detail: darken(@color_airport_runways,20);
@color_green_areas: darken(#c0d3b5,18);

Map {
  background-color: @color_water;
  font-directory: url("fonts/");
}

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

.country-boundary[scalerank<6],
.country-boundary-10m[scalerank<6] {
  line-color: @color_administrative_dark;
  line-opacity: 0.2;
  line-width: 2;
  line-dasharray: 7,3;
  ::glow {
    line-color: @color_administrative_dark;
    line-opacity: 0.08;
    line-width: 4;
    line-dasharray: 7,3;
  }
}

#admin1-lines-10m,
#admin0-map-units-10m {
  [zoom>=4][adm0_a3='CAN'],
  [zoom>=4][adm0_a3='USA'],
  [zoom>=4][adm0_a3='AUS'],
  [zoom>=5][scalerank<=2],
  [zoom>=5][featurecla='Map unit boundary'][adm0_a3='GBR'],
  [zoom>=6][scalerank<=4],
  [zoom>=6][featurecla='Map unit boundary'][adm0_a3='GBR'],
  [zoom>=7][scalerank<=6] {
    line-color: @color_administrative_dark;
    line-opacity: 0.15;
    line-width: 1.5;
    line-dasharray: 7,3;
    ::glow {
      line-color: @color_administrative_dark;
      line-opacity: 0.05;
      line-width: 3;
      line-dasharray: 7,3;
    }
  }

  [zoom>=7][scalerank<=5] {
    line-width: 1;
    line-color: @color_administrative_medium_low;
    line-dasharray: 1,5;
    line-cap: round;
  }

  [zoom>=8][scalerank<=6] {
    line-width: 1.2;
    line-color: @color_administrative_medium_high;
    line-dasharray: 1,5;
    line-cap: round;
  }

  [zoom>=9][scalerank<=8] {
    line-width: 1.2;
    line-color: @color_administrative_medium_high2;
    line-dasharray: 1,5;
    line-cap: round;
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

#ne-roads[zoom=7][scalerank<=4],
#ne-roads[zoom>=8][scalerank<=8] {
  ::casing {
    line-color: @color_transport_casing;
    line-opacity: 0.5;
    line-width: 1.5;

    [zoom=8][scalerank<=6] {
      line-width: 3;
    }
  }

  line-color: @color_transport;
  line-width: 0;

  [zoom=8][scalerank<=6] {
    line-width: 1;
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

/**
  * Use OSM administrative boundaries at zooms >= 10
  * Filter out really small admin areas for features like 
  * Indian Reservations at higher zooms 
  **/
#admin1-lines-osm{
  [zoom>=10][area_km2>1000],
  [zoom>=12][area_km2>500],
  [zoom>=14][area_km2>0]{
    line-width: 2.0;
    line-color: @color_administrative_medium_high2;
    line-dasharray: 1,5;
    line-cap: round;
  }
}

/**
 * Zoom 13 buildings.
 * Already filtered by size upon import.
 */
#buildings-med[type!='no'] {
  polygon-fill: @color_building;
  line-width: 0.5;
  line-color: @color_building_outline;
}

/**
 * Zoom 14+ buildings.
 * Includes all buildings.
 */
#buildings-high[type!='no'] {
  [zoom=14] {
    [area>=5000] {
      polygon-fill: @color_building;
      line-width: 0.5;
      line-color: @color_building_outline;
    }
  }

  /**
   * This is for outlines and no stripe. Catches small buildings.
   * Larger buildings will be overridden with stripes below.
   */
  [zoom>=15][area>=2000],
  [zoom>=16] {
    polygon-fill: @color_building;
    line-width: 0.5;
    line-color: @color_building_outline;
  }

  [zoom=15][area>=3000],
  [zoom=16][area>=2000],
  [zoom=17][area>=1000],
  [zoom>=18],
  {
    polygon-fill: @color_building;
    line-width: 0.5;
    line-color: @color_building_outline;
  }

  // Stamen HQ fancy candycane striping
  [zoom>=18] {
    [osm_id=260351411],
    [osm_id=224030635], // Seth's house
    [osm_id=248153467], // Sean's house
    [osm_id=291796473], // Stamen South
    {
      polygon-fill: @color_building;
      line-width: 1.5;
      line-color: @color_building_outline_special;
    }
  }
}

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

#aeroways {
  line-color: @color_airport_runways;
  line-cap: square;
  line-join: miter;

  [type='runway'] {
    [zoom=10] {
      line-width: 1;
    }
    [zoom=11] {
      line-width: 1.5;
    }
    [zoom=12] {
      line-width: 2;
    }

    [zoom=13] {
      line-width: 4;
    }

    [zoom=14] {
      line-width: 8;
    }

    [zoom=15] {
      line-width: 16;
    }

    [zoom=16] {
      line-width: 32;
    }

    [zoom=17] {
      line-width: 64;
    }

    [zoom>=18] {
      line-width: 128;
    }
  }

  [type='taxiway'] {
    [zoom=13] {
      line-width: 1;
    }

    [zoom=14] {
      line-width: 2;
    }

    [zoom=15] {
      line-width: 4;
    }

    [zoom=16] {
      line-width: 8;
    }

    [zoom=17] {
      line-width: 16;
    }

    [zoom>=18] {
      line-width: 32;
    }
  }
}

#tunnels,
#roads,
#roads_med,
#highways_med,
#bridges {
  ::casing,
  ::outline,
  {
    line-cap: butt;
    line-width: 0;
    line-color: @color_transport_casing;
  }

  line-join: round;
  line-cap: round;
  line-width: 1;
  line-color: @color_transport;
}

#tunnels {
  [zoom>=14] {
    ::outline
    {
      line-opacity: 0.7;
      line-color: @color_transport_tunnel;
    }

    line-opacity: 0.5;
    line-width: 4;
  }
}

#tunnels[kind='highway'] {
  [zoom>=15] {
    ::outline {
      line-width: 5.5;
    }

    line-width: 4;
  }

  [zoom>=16] {
    ::outline {
      line-width: 7;
      line-opacity: 0.4;
    }

    line-opacity: 0.7;
    line-color: @color_transport_tunnel;

    [is_link='yes'] {
      ::outline {
        line-color: @color_transport_casing;
      }
    }
  }

  [zoom>=17] {
    ::outline {
      line-width: 18;
    }

    line-width: 12;

    [is_link='yes'] {
      ::outline {
        line-width: 9;
      }
    }
  }

  [zoom>=18] {
    ::outline {
      line-width: 22;
      line-color: @color_transport;
    }

    line-width: 18;
    line-color: @color_transport_inline;
  }

  [zoom>=19] {
    ::outline {
      line-width: 30;
    }

    line-width: 26;

    [is_link='yes'] {
      ::outline {
        line-width: 13;
      }
    }
  }
}

#tunnels[kind='major_road'] {
  [zoom>=15] {
    ::outline {
      line-width: 5;
      line-opacity: 0.7;
      line-color: @color_transport_tunnel;
    }

    line-width: 3;
    line-opacity: 0.5;
  }

  [zoom>=16] {
    ::outline {
      line-width: 7;
      line-opacity: 0.4;
    }

    line-opacity: 0.7;
    line-color: @color_transport_tunnel;

    [is_link='yes'] {
      ::outline {
        line-color: @color_transport_casing;
      }
    }
  }

  [zoom>=17] {
    ::outline {
      line-width: 18;
    }

    line-width: 12;

    [is_link='yes'] {
      ::outline {
        line-width: 9;
      }
    }
  }

  [zoom>=18] {
    ::outline {
      line-width: 22;
    }

    line-width: 18;
  }

  [zoom>=19] {
    ::outline {
      line-width: 30;
    }

    line-width: 26;

    [is_link='yes'] {
      ::outline {
        line-width: 13;
      }
    }
  }
}

#tunnels[kind='minor_road'] {
  [zoom>=15] {
    ::outline {
      line-opacity: 0.7;
      line-color: @color_transport_tunnel;
    }

    line-color: @color_transport_minor;
    line-width: 1.5;
    line-opacity: 0.5;
  }

  [zoom>=16] {
    ::outline {
      line-width: 7;
    }

    line-width: 4;
    line-color: @color_transport;
  }

  [zoom>=17] {
    ::outline {
      line-width: 9;
    }

    line-width: 7;
  }

  [zoom>=18] {
    ::outline {
      line-width: 17;
      line-color: @color_transport;
    }

    line-width: 13;
    line-color: @color_transport_casing;
  }

  [zoom>=19] {
    ::outline {
      line-width: 20;
    }

    line-width: 16;
  }
}

#bridges[kind='highway'] {
  [zoom>=13] {
    ::outline {
      line-width: 8;
    }

    line-width: 4;
    line-color: @color_transport_hwy;

    [is_link='yes'] {
      ::outline {
        line-width: 0;
      }

      line-width: 1;
      line-color: @color_transport_hwy;
    }
  }

  [zoom>=14] {
    ::outline {
      line-width: 8;
    }

    line-width: 4;

    [is_link='yes'] {
      ::outline {
        line-width: 4;
      }

      line-width: 2.5;
    }
  }

  [zoom>=15] {
    ::outline {
      line-width: 11;
    }

    line-width: 6;

    [is_link='yes'] {
      ::outline {
        line-width: 5.5;
      }

      line-width: 2.5;
    }
  }

  [zoom>=16] {
    ::outline {
      line-width: 14;
    }

    line-width: 9;

    [is_link='yes'] {
      ::outline {
        line-width: 7;
      }

      line-width: 2.5;
    }
  }

  [zoom>=17] {
    ::outline {
      line-width: 20;
    }

    line-width: 15;

    [is_link='yes'] {
      ::outline {
        line-width: 9;
      }

      line-width: 5;
    }
  }

  [zoom>=18] {
    ::outline {
      line-width: 44;
      line-color: @color_transport;
    }

    line-width: 28;
    line-color: @color_transport_inline;

    [is_link='yes'] {
      ::outline {
        line-width: 22;
      }

      line-width: 18;
    }
  }

  [zoom>=19] {
    ::outline {
      line-width: 51;
    }

    line-width: 35;

    [is_link='yes'] {
      ::outline {
        line-width: 21;
      }

      line-width: 16;
    }
  }
}

#bridges[kind='major_road'] {
  line-color: @color_transport;

  [zoom>=14] {
    ::outline {
      line-width: 5;
    }

    line-width: 1.9;
  }

  [zoom>=15] {
    ::outline {
      line-width: 8.5;
    }

    line-width: 5.5;

    [is_link='yes'] {
      ::outline {
        line-width: 5.5;
      }

      line-width: 2.5;
    }
  }

  [zoom>=16] {
    ::outline {
      line-width: 11;
    }

    line-width: 7;

    [is_link='yes'] {
      ::outline {
        line-width: 7;
      }

      line-width: 2.5;
    }
  }

  [zoom>=17] {
    ::outline {
      line-width: 18;
    }

    line-width: 12;

    [is_link='yes'] {
      ::outline {
        line-width: 8;
      }

      line-width: 4;
    }
  }

  [zoom>=18] {
    ::outline {
      line-width: 24;
      line-color: @color_transport;
    }

    line-width: 18;
    line-color: @color_transport_inline;

    [is_link='yes'] {
      ::outline {
        line-width: 14;
      }

      line-width: 9;
    }
  }

  [zoom>=19] {
    ::outline {
      line-width: 32;
    }

    line-width: 26;

    [is_link='yes'] {
      ::outline {
        line-width: 18;
      }

      line-width: 13;
    }
  }
}

#roads,
#roads_med,
#highways_med {
  ::casing,
  ::outline,
  {
    line-cap: butt;
    line-width: 0;
    line-color: @color_transport_casing;
  }

  line-join: round;
  line-cap: round;
  line-width: 0;
  line-color: @color_transport;

  [is_link='yes']
  {
    [zoom>=16]
    {
      ::casing {
        line-width: 8;
      }

      line-width: 4;
    }
  }
}

#roads[kind='highway'],
#highways_med[kind='highway']
{    
  [zoom>=9] {
    ::outline {
      line-width: 3;
      line-color: @color_transport_casing_z10;
    }

    line-width: 1.5;    
  }

  [zoom>=10] {
    ::outline {
      line-width: 5;
    }

    line-width: 2;
  }

  [zoom>=11] {
    ::outline {
      line-width: 5;
      line-color: @color_transport_casing;
    }

    line-width: 3;
    line-color: @color_transport_hwy;    
  }

  [zoom>=12] {
    ::outline {
      line-width: 5;
    }

    line-width: 3;

    [is_link='yes'] {
      ::outline {
        line-width: 0;
      }

      line-width: 0.5;
    }
  }

  [zoom>=13] {
    ::outline {
      line-width: 8;
    }

    line-width: 4;

    [is_link='yes'] {
      ::outline {
        line-width: 3;
      }

      line-width: 1;
    }
  }

  [zoom>=14] {
    ::outline {
      line-width: 9;
    }

    line-width: 4;    

    [is_link='yes'] {
      ::outline {
        line-width: 4;
      }

      line-width: 2.5;
    }
  }

  [zoom>=15] {
    ::casing {
      line-width: 11;
    }

    line-width: 6;

    [is_link='yes'] {
      ::casing {
        line-width: 6.5;
      }

      line-width: 2.25;
    }
  }

  [zoom>=16] {
    ::casing {
      line-width: 13;
    }

    line-width: 7.5;

    [is_link='yes'] {
      ::casing {
        line-width: 7;
      }

      line-width: 2.5;
    }
  }

  [zoom>=17] {
    ::casing {
      line-width: 24;
    }

    line-width: 15;

    [is_link='yes'] {
      ::casing {
        line-width: 9;
      }

      line-width: 5;
    }
  }

  [zoom>=18] {
    ::casing {
      line-width: 39;
    }    

    line-width: 28;

    [is_link='yes'] {
      ::casing {
        line-width: 14;
      }

      line-width: 10;
    }
  }

  // [zoom>=19] {
  //   ::casing {
  //     line-width: 49;
  //   }

  //   line-width: 35;

  //   [is_link='yes'] {
  //     ::casing {
  //       line-width: 20;
  //     }

  //     line-width: 16;
  //   }
  // }
}

#roads[kind='major_road'],
#roads_med[kind='major_road']
{

  [zoom<=12] {
    line-color: @color_transport;    
  }

  [zoom>=9] {
    line-width: 0.15;
  }

  [zoom>=10] {
    line-width: 0.5;
  }

  [zoom>=11] {
    ::outline {
      line-width: 1.25;
      line-color: @color_transport_casing;
    }

    line-width: 0.7;
  }

  [zoom>=12] {
    ::outline {
      line-width: 4;
    }

    line-width: 2;

    [is_link='yes'] {
      ::outline {
        line-width: 0;
      }

      line-width: 1;
    }
  }

  [zoom>=13] {
    ::outline {
      line-width: 5;
    }

    line-width: 3;
  }

  [zoom>=14] {
    ::outline {
      line-width: 6;
    }

    line-width: 4;

    [is_link='yes'] {
      ::outline {
        line-width: 5;
      }

      line-width: 2;
    }
  }

  [zoom>=15] {
    ::casing {
      line-width: 8;
    }

    line-width: 5;

    [is_link='yes'] {
      ::casing {
        line-width: 5.5;
      }

      line-width: 2.5;
    }
  }

  [zoom>=16] {
    ::casing {
      line-width: 0;//10;
    }

    line-width: 7;

    [is_link='yes'] {
      ::casing {
        line-width: 0; //6;
      }

      line-width: 4;
    }
  }

  [zoom>=17] {
    ::outline {
      // line-width: 20;
    }

    line-width: 14;

    [is_link='yes'] {
      ::casing{
        // line-width: 14;
      }

      line-width: 7;
    }
  }

  [zoom>=18] {
    ::outline {
      // line-width: 25;
    }

    line-width: 17;

    [is_link='yes'] {
      ::casing {
        // line-width: 19;
      }

      line-width: 10;
    }
  }

  // [zoom>=19] {
  //   ::casing {
  //     line-width: 30;
  //   }

  //   line-width: 26;

  //   [is_link='yes'] {
  //     ::casing {
  //       line-width: 17;
  //     }

  //     line-width: 13;
  //   }
  // }
}

#roads[kind='minor_road'],
#roads_med[kind='minor_road']
{
  line-color: @color_transport_minor;

  [zoom>=10] {
    line-width: 1;
  }

  [zoom>=11][highway='trunk'],
  [zoom>=11][highway='primary'],
  [zoom>=11][highway='secondary'] {
    ::casing{
      line-width: 1.9;
      line-color: @color_transport_casing;
    }
    line-width: 1.5;
  }

  [zoom>=12][highway='trunk'],
  [zoom>=12][highway='primary'],
  [zoom>=12][highway='secondary'],
  [zoom>=12][highway='tertiary'] {
    ::casing{
      line-width: 1.9;
      line-color: @color_transport_casing;
    }
    line-width: 1.5;
  }

  [zoom>=13] {
    line-width: 1.5;
    line-color: @color_transport;
  }

  [zoom>=14] {
    ::casing {
      line-width: 3.5;
      line-color: @color_transport_casing;
    }
    line-width: 2.5;
  }

  [zoom>=15] {
    ::casing {
      line-width: 6.5;
    }
    line-width: 4;
  }

  [zoom>=16] {
    ::casing {
      line-width: 0; //7.5;
    }    
    line-width: 4;    
  }

  [zoom>=17] {
    ::casing {
      // line-width: 11.5;
    }
    line-width: 8;
  }

  [zoom>=18] {
    ::casing {
      // line-width: 14.5;
    }    
    line-width: 11;
  }

  // [zoom>=19] {
  //   ::casing {
  //     line-width: 20;
  //   }

  //   line-width: 16;
  // }
}

#tunnels[kind='rail'],
#roads[kind='rail'],
#bridges[kind='rail']
{
  ::casing,
  ::outline,
  {
    line-color: @color_transport_rail;
  }

  line-color: @color_transport_rail;

  [zoom>=14] {
    ::casing {
      line-width: 3;
      line-dasharray: 1,3;
    }

    line-width: 1;
  }

  [zoom>=16] {
    ::casing {
      line-width: 5;
      line-dasharray: 1,4;
    }
  }

  [zoom>=18] {
    ::casing {
      line-width: 6;
      line-dasharray: 2,6;
    }

    line-width: 2;
  }

  [zoom>=19] {
    line-width: 4;
  }
}

#tunnels[highway='service'],
#roads[highway='service'],
#bridges[highway='service'],
{
  [zoom>=15] {
    ::casing {
     line-width: 2.8; 
    }

    line-width: 1.8;
  }

  [zoom>=16] {
    ::casing {
      line-width: 0;
    }

    line-width: 2;
  }

  [zoom>=17] {
    line-width: 4;
  }
}

#tunnels[kind='path'],
#roads[kind='path'],
#bridges[kind='path'],
{
  line-color: @color_transport_path;

  [zoom>=15] {
    line-width: 0.5;
    line-cap: butt;
    line-dasharray: 2, 3;
  }

  [zoom>=16] {
    line-width: 0.7;
  }

  [zoom>=17] {
    line-width: 1.2;
    line-dasharray: 4, 6;
  }
}

#lc500mMODIS_low {
  [zoom>=0][zoom<9] {
    raster-opacity:1;
    raster-scaling:gaussian;
    image-filters: agg-stack-blur(0,0);
  }
  [zoom>=7] { raster-opacity:0.9; }
  [zoom>=8] { raster-opacity:0.8; }
}

#lc500mMODIS_med {
  [zoom>=9] {
    raster-opacity:0.7;
    raster-scaling:gaussian;
    image-filters: agg-stack-blur(3,3);
  }
  [zoom>=10] { raster-opacity:0.6; }
  [zoom>=11] {
    raster-opacity:0.5;
    image-filters: agg-stack-blur(10,10);
  }
  [zoom>=12] { raster-opacity:0.4; }
  [zoom>=13] { raster-opacity:0.3; }
}

#lc500mMODIS_high {
  [zoom>=14] {
    raster-opacity:0.2;
    raster-scaling:gaussian;
    image-filters: agg-stack-blur(20,20);
  }
  [zoom>=15] { raster-opacity:0.2; }
  [zoom>=16] { raster-opacity:0.15; }
  [zoom>=17] { raster-opacity:0.1; }
  [zoom>=18] { raster-opacity:0.05; }
}

// A special landover raster with urban areas only, so we can keep them full opacity
#lc500mMODIS_urban {
  raster-scaling:gaussian;
  image-filters: agg-stack-blur(10,10);
  raster-opacity:1;
}

.urban-landuse {
  polygon-fill: @color_urban;
  image-filters: agg-stack-blur(10,10);
}

#land {
  polygon-fill: @color_physical;
}
