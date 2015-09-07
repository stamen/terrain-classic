@text_font_transport: 'PT Sans Narrow Regular', 'Unifont Medium';
@text_font_administrative: 'PT Sans Narrow Regular', 'Unifont Medium';
@text_font_city: 'PT Sans Narrow Regular', 'Unifont Medium';
@text_font_parks: 'PT Sans Narrow Regular', 'Unifont Medium';
@text_font_water: 'PT Sans Italic', 'Unifont Medium';
@text_font_water_bold: 'PT Sans Bold Italic', 'Unifont Bold';

@label_color_transport: #524c4c;
@label_color_shield: #fff;
@label_color_shield_fed: #333;
@label_color_administrative: #2e2115;
@label_color_city: #2e2115;

@text_font_size_xxsm: 12;
@text_font_size_xsm: 14;
@text_font_size_sm: 15;
@text_font_size_medium: 17;
@text_font_size_medium_plus: 18;
@text_font_size_large: 20;

@text_character_spacing_sm: 0.7;
@text_character_spacing_md: 1.2;
@text_character_spacing_lg: 1.7;
@text_character_spacing_xlg: 2.2;

@text_font_halo_radius_sm: 1.5;
@text_font_halo_radius_large: 2;

@label_color_halo_low: fadeout(rgba(255,255,255,0.7), 30%);
@label_color_halo_high: fadeout(rgba(255,255,255,1), 30%);
@label_color_administrative_halo: fadeout(#fff, 30%);
@label_color_physical: #000;
@label_color_physical_halo: #fff;
@label_color_transport_halo: #F7F7E6;
@label_color_airport_halo: #f7f7e6;
@label_color_places_halo_low: fadeout(rgba(255,255,255, 1), 30%);
@label_color_places_halo_high: fadeout(rgba(255,255,255, 1), 30%);

@label_color_green_area: #374c30; 
@label_color_green_area_halo: #c0d3b5;
@label_color_water: darken(@color_water,20);
@label_color_water_halo: @color_water;

Map {
  font-directory: url("fonts/");
  buffer-size: 128;
}

#minor_road_labels,
#major_road_labels,
{
  text-name: [name];
  text-face-name: @text_font_transport;
  text-size: 16;
  text-placement: line;
  text-max-char-angle-delta: 20;
  text-fill: #444;
  text-spacing: 256;
  text-character-spacing: @text_character_spacing_sm;
  text-avoid-edges: true;
  text-halo-fill: @label_color_transport_halo;
  text-halo-radius: 2;
}

#highway_shields {
  [zoom>=11],
  [highway='motorway'],
  [highway='trunk'],
  [highway='primary'] {
    // arbitrary default shield
    shield-file: url(shields/ca.svg);
    shield-fill: @label_color_shield;
    shield-transform: scale(0.052, 0.052);
    shield-face-name: @text_font_transport;
    shield-name: [ref];
    shield-min-distance: 50;
    // shield-spacing: 250;
    // half the width of the shield to prevent from wrapping
    // shield-min-padding: 10;

    [ref=~'I \d+'] {
      shield-file: url(shields/interstate_2.svg);
      shield-transform: scale(0.033, 0.033);
      shield-size: 9;
      shield-name: "[ref].replace('I ', '')";
    }

    [ref=~'I \d{3,}'] {
      shield-file: url(shields/interstate_3.svg);
      shield-transform: scale(0.033, 0.033);
      shield-size: 9;
      shield-name: "[ref].replace('I ', '')";
    }

    [ref=~'US \d+'] {
      shield-file: url(shields/us.svg);
      shield-transform: scale(0.052, 0.052);
      shield-size: 10;
      shield-name: "[ref].replace('US ', '')";
      shield-fill: @label_color_shield_fed;
      shield-text-dy: 1;
    }

    [ref=~'CA \d+'] {
      shield-file: url(shields/ca.svg);
      shield-transform: scale(0.052, 0.052);
      shield-size: 10;
      shield-name: "[ref].replace('CA ', '')";
      shield-text-dy: 2.5;
    }
  }
}

#ne_110m_geography_marine_polys[zoom=2][scalerank=0][changed!=''],
#ne_110m_geography_marine_polys[zoom=3][changed!=''],
#ne_50m_geography_marine_polys[zoom=4][scalerank<4][changed!=''] {
    text-name: [name];
    
    [namealt!=''] {
      text-name: [name] + '\n(' + [namealt] + ')';
    }
    
    text-face-name: @text_font_water_bold;
    text-wrap-width: 40;
    text-wrap-character: ' ';
    text-size: @text_font_size_sm;
    text-character-spacing: @text_character_spacing_xlg;
    text-align: center;

    text-fill: @label_color_water;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_water_halo;
}

#ne_50m_geography_marine_polys[zoom=5][scalerank<4][changed!=''],
#ne_10m_geography_marine_polys[zoom>=6][zoom<=8][scalerank<7][changed!='']
{
    text-name: [name];

    [namealt!=''] {
      text-name: [name] + '\n(' + [namealt] + ')';
    }

    [name = 'Hecate Straight'] {
      text-name: 'Hecate Strait' + [namealt]; // Becase we know namealt is empty
    }

    [name = 'Queen Charlotte Straight'] {
      text-name: 'Queen Charlotte Strait' + [namealt]; // Becase we know namealt is empty
    }

    text-face-name: @text_font_water_bold;
    text-wrap-width: 50;
    text-size: @text_font_size_medium;
    text-character-spacing: @text_character_spacing_lg;
    text-fill: @label_color_water;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_water_halo;
}

#water-bodies-labels-low,
#water-bodies-labels-med,
#water-bodies-labels-high {
  [zoom=9][area>100000000],
  [zoom=10][area>100000000],
  [zoom=11][area>25000000],
  [zoom=12][area>5000000],
  [zoom=13][area>2000000],
  [zoom=14][area>200000],
  [zoom=15][area>50000],
  [zoom=16][area>10000],
  [zoom>=17] {
    text-name: "[name]";
    text-face-name: @text_font_water;
    text-placement: interior;
    text-max-char-angle-delta: 30;
    text-wrap-width: 40;
    text-halo-radius: @text_font_halo_radius_large;
    text-fill: @label_color_water;
    text-halo-fill: @label_color_water_halo;
    text-size: @text_font_size_xsm;

    [zoom>9][zoom<12] {
      text-spacing: 200;
      text-wrap-width: 50;
    }
    [zoom=12] {
      text-size: @text_font_size_xsm;
      text-spacing: 200;
      text-wrap-width: 70;
    }
    [zoom=13] {
      text-size: @text_font_size_xsm;
      text-spacing: 100;
      text-wrap-width: 70;
    }
    [zoom=14] {
      text-size: @text_font_size_xsm;
      text-spacing: 100;
      text-wrap-width: 70;
    }
    [zoom>=15] {
      text-size: @text_font_size_sm;
      text-spacing: 100;
      text-wrap-width: 40;
    }
  }
}

#green-areas-labels-low,
#green-areas-labels-med,
#green-areas-labels-high {
  [zoom=8][area>100000000],
  [zoom=9][area>100000000],
  [zoom=10][area>100000000],
  [zoom=11][area>5000000],
  [zoom=12][area>1000000],
  [zoom=13][area>400000],
  [zoom=14][area>200000],
  [zoom=15][area>50000],
  [zoom=16][area>10000],
  [zoom>=17] {
    text-name: [name];
    text-face-name: @text_font_parks;
    text-placement: interior;
    text-wrap-width: 96;
    text-wrap-before: true;
    text-line-spacing: -3;
    text-fill: @label_color_green_area;
    text-size: 15;

    [zoom>=8] {
      text-halo-fill: @label_color_green_area_halo;
      text-halo-radius: @text_font_halo_radius_sm;      
    }

    [zoom>=11] {
      text-fill: #586e50;
      text-halo-radius: @text_font_halo_radius_large;
    }

    [zoom>=15] {
      text-size: 20;
      text-line-spacing: -7;
    }
  }
}

#continents
{
  text-name: [name];
  text-face-name: @text_font_administrative;
  text-wrap-width: 32;
  text-size: 24;
  text-line-spacing: -12;
  text-fill: #2e2115;
  text-halo-radius: @text_font_halo_radius_sm;
  text-halo-fill: @label_color_halo_low;   
}

#admin1-labels-50m-z4 {
    text-face-name: @text_font_administrative;
    text-wrap-width: 80;
    text-fill: @label_color_administrative;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_halo_low; 
    text-name: "[label_z4]";
    text-size:  @text_font_size_xsm;
}

#admin1-labels-50m-z5 {
    text-face-name: @text_font_administrative;
    text-wrap-width: 80;    
    text-fill: @label_color_administrative;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_halo_low;
    text-halo-comp-op: overlay; 
    text-halo-rasterizer: fast;
    text-name: "[label_z5]";
    text-size:  @text_font_size_medium_plus;
}

#admin1-labels-50m-z6 {
    text-face-name: @text_font_administrative;
    text-wrap-width: 80;
    text-fill: @label_color_administrative;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_halo_low; 
    text-name: "[label_z6]";
    text-size:  @text_font_size_large;
}

#admin1-labels-50m-z7 {
    text-face-name: @text_font_administrative;
    text-wrap-width: 80;
    text-fill: @label_color_administrative;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_halo_low; 
    text-name: "[label_z7]";
    text-size:  @text_font_size_large;
}

#admin0-labels-z3[longfrom>3] {
    text-name: "[shortname]";
    text-face-name: @text_font_administrative;
    text-transform: uppercase;
    text-wrap-width: 80;
    text-character-spacing: @text_character_spacing_sm;
    text-size: 18;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_halo_low;     
    text-fill: @label_color_administrative;
    text-min-distance: 5;
}

#admin0-labels-z3[longfrom<=3] {
    text-name: "[name]";
    text-face-name: @text_font_administrative;
    text-transform: uppercase;
    text-size: 22;
    text-line-spacing: -8;
    text-wrap-width: 100;
    text-character-spacing: @text_character_spacing_sm;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_halo_low;
    text-fill: @label_color_administrative;
}

#admin0-labels-z4 {
    text-name: [name];
    text-face-name: @text_font_administrative;
    text-transform: uppercase;
    text-wrap-width: 80;
    text-character-spacing: @text_character_spacing_lg;
    text-size: 22;
    text-min-distance: 15;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_halo_low;     
    text-fill: @label_color_administrative;
}

#admin0-labels-z5 {
  text-name: [name];
  text-face-name: @text_font_administrative;
  text-transform: uppercase;
  text-wrap-width: 80;
  text-character-spacing: @text_character_spacing_xlg;
  text-size: 24;
  text-halo-radius: @text_font_halo_radius_sm;
  text-halo-fill: @label_color_halo_low;   
  text-fill: @label_color_administrative;
}

#admin0-labels-z6 {
  text-name: [name];
  text-face-name: @text_font_administrative;
  text-transform: uppercase;
  text-wrap-width: 80;
  text-character-spacing: @text_character_spacing_xlg;
  text-size: 34;
  text-halo-radius: @text_font_halo_radius_sm;
  text-halo-fill: @label_color_halo_low;   
  text-fill: @label_color_administrative;
}

#aries-places-labels {
  [zoom=4][scalerank<5],
  [zoom=5][scalerank<6],
  [zoom=6][scalerank<6],
  [zoom=7][scalerank<7],
  [zoom=8][scalerank<8],
  [zoom=9][scalerank<9],
  [zoom=10][scalerank<10],
  [zoom=11][scalerank<11],
  [zoom=12][scalerank<12],
  [zoom=13][scalerank<13], 
  [zoom=14][scalerank<14] 
  [zoom>=15][scalerank<17]{

    text-name: [name];
    text-face-name: @text_font_city;
    text-fill: @label_color_city;
    text-min-distance: 3;
    // text-min-padding: 5;
    text-dy: 5;
    text-dx: 5;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_halo_low;
    // text-allow-overlap: true;
    text-placement-type: simple;
    // text-avoid-edges: true;    

    [zoom>=4] {
      text-size: @text_font_size_xsm;
      text-placements: "W,E,S";
      
      [population>700000] {
        text-size: @text_font_size_xsm * 1.2;
      }

      [population>7000000] {
        text-size: @text_font_size_xsm * 1.3;
      }      
    }

    [zoom>=5]{
      text-size: @text_font_size_sm;
      text-placements: "E,W,N";
      text-min-distance: 5;
      
      [population>700000] {
        text-size: @text_font_size_sm * 1.2;
      }

      [population>7000000] {
        text-size: @text_font_size_sm * 1.3;
        text-allow-overlap: true;
      }       
    }

    [zoom>=6]{
      text-size: @text_font_size_medium;
      text-placements: "W,E,N";

      [population>700000] {
        text-size: @text_font_size_medium * 1.2;
      }

      [population>7000000] {
        text-size: @text_font_size_medium * 1.5;
      }       
    }

    [zoom>=10]{
      text-size: @text_font_size_medium_plus;
      text-halo-radius: @text_font_halo_radius_large;
      text-halo-fill: @label_color_halo_high;
      
      [population>700000] {
        text-size: @text_font_size_large * 1.2;
      }

      [population>7000000] {
        text-size: @text_font_size_large * 1.5;
      }       
    }

  }
}

#aries-places-points {
  [zoom=4][scalerank<5],
  [zoom=5][scalerank<6],
  [zoom=6][scalerank<6],
  [zoom=7][scalerank<7],
  [zoom=8][scalerank<8] {

    marker-fill: #2e2115;
    marker-line-width: 0;
    marker-width: 5;
    marker-ignore-placement: true;

    [population>700000] {
      marker-width: 7;
    }

  }
}

#airports {
  [zoom>=10] {
    text-name: [abbrev];
    text-face-name: @text_font_transport;
    text-fill: #444;
    text-size: @text_font_size_medium_plus;
    
    text-halo-fill: @label_color_airport_halo;
    text-halo-radius: @text_font_halo_radius_large;
    
    text-wrap-width: 128;
    text-dy: 14;  
  }

  [zoom>=13] {
    text-name: [name];
  }

  [zoom=14][natlscale>.04],
  [zoom=15][natlscale>.02],
  [zoom>=16][natlscale>.01]
  {
      text-dy: 20;
  }   

  [zoom=8][natlscale>2.3][type='major'],
  [zoom=9][natlscale>1.2][type='major'],
  [zoom=10][natlscale>0.57][type='major'],
  [zoom=11][natlscale>0.29][type='major'],
  [zoom=12][natlscale>0.29][type='major'],
  [zoom=13][natlscale>0.29][type='major']
  {
    point-file: url('icons/airport_major_l.png');
  }

  [zoom=14][natlscale>.29][type='major'],
  [zoom=15][natlscale>.29][type='major'],
  [zoom>=16][natlscale>.29][type='major']
  {
      point-file: url('icons/airport_major_xl.png');
  }

  [zoom=8][natlscale>2.3][type='small'],
  [zoom=9][natlscale>1.2][type='small'],
  [zoom=10][natlscale>.57][type='small'],
  [zoom=11][natlscale>.29][type='small'],
  [zoom=12][natlscale>.29][type='small'],
  [zoom=13][natlscale>.29][type='small']
  {
      point-file: url('icons/airport_small_l.png');
  }

  [zoom=14][natlscale>.29][type='small'],
  [zoom=15][natlscale>.29][type='small'],
  [zoom>=16][natlscale>.29][type='small']
  {
      point-file: url('icons/airport_small_xl.png');
  }

  [zoom=8][natlscale>2.3][type='military'],
  [zoom=9][natlscale>1.2][type='military'],
  [zoom=10][natlscale>.57][type='military'],
  [zoom=11][natlscale>.29][type='military'],
  [zoom=12][natlscale>.29][type='military'],
  [zoom=13][natlscale>.29][type='military']
  {
      point-file: url('icons/airport_military_l.png');
  }

  [zoom=14][natlscale>.29][type='military'],
  [zoom=15][natlscale>.29][type='military'],
  [zoom>=16][natlscale>.29][type='military']
  {
      point-file: url('icons/airport_military_xl.png');
  }

  [zoom=8][natlscale>2.3][type='spaceport'],
  [zoom=9][natlscale>1.2][type='spaceport'],
  [zoom=10][natlscale>.57][type='spaceport'],
  [zoom=11][natlscale>.29][type='spaceport'],
  [zoom=12][natlscale>.29][type='spaceport'],
  [zoom=13][natlscale>.29][type='spaceport']
  {
      point-file: url('icons/intergalactic_l.png');
  }

  [zoom=14][natlscale>.29][type='spaceport'],
  [zoom=15][natlscale>.29][type='spaceport'],
  [zoom>=16][natlscale>.29][type='spaceport']
  {
      point-file: url('icons/intergalactic_xl.png');
  }
}

