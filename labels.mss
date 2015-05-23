@text_font_transport: 'PT Sans Narrow Regular';
@text_font_administrative: 'PT Sans Narrow Regular';
@text_font_city: 'PT Sans Narrow Regular';
@text_font_parks: 'PT Sans Narrow Regular';

/*
@text_font_transport: 'CaslonAntiqueVL Regular';
@text_font_administrative: 'CaslonAntiqueVL Regular';
@text_font_city: 'CaslonAntiqueVL Regular';
@text_font_parks: 'Caslon Antique Italic';
*/

@label_color_transport: #524c4c;
@label_color_administrative: #2e2115;
@label_color_city: #2e2115;

// Currently very small font sizes, just for testing
@text_font_size_xxsm: 4;
@text_font_size_xsm: 8;
@text_font_size_sm: 8;
@text_font_size_medium: 8;
@text_font_size_medium_plus: 8;
@text_font_size_large: 10;

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
  text-avoid-edges: true;
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
    text-fill: #374c30;
    text-size: 15;

    [zoom>=11] {
      text-fill: #586e50;
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
  text-size: 32;
  text-line-spacing: -12;
  text-fill: #2e2115;
}

#admin0-labels-z3[longfrom>3] {
    text-name: "[shortname]";
    text-face-name: @text_font_administrative;
    text-wrap-width: 80;
    text-size: 18;
    text-fill: @label_color_administrative;
    text-min-distance: 5;
}

#admin0-labels-z3[longfrom<=3] {
    text-name: "[name]";
    text-face-name: @text_font_administrative;
    text-size: 24;
    text-line-spacing: -8;
    text-wrap-width: 100;
    text-fill: @label_color_administrative;
}

#admin0-labels-z4 {
    text-name: [name];
    text-face-name: @text_font_administrative;
    text-wrap-width: 80;
    text-size: 24;
    text-min-distance: 15;
    text-fill: @label_color_administrative;
}

#admin0-labels-z5 {
  text-name: [name];
  text-face-name: @text_font_administrative;
  text-wrap-width: 80;
  text-size: 24;
  text-fill: @label_color_administrative;
}

#admin0-labels-z6 {
  text-name: [name];
  text-face-name: @text_font_administrative;
  text-wrap-width: 80;
  text-size: 24;
  text-fill: @label_color_administrative;
}

#city_labels_z4,
#city_labels_z5,
#city_labels_z6 {
  // for debugging
  ::outline {
    polygon-fill: #fff;
    polygon-opacity: 0.1;
  }
  text-name: [name];
  text-face-name: @text_font_city;
  text-fill: @label_color_city;
  text-placement: interior;
  text-vertical-alignment: bottom;
  text-min-distance: 5;

  [justified='left'] {
    text-horizontal-alignment: left;
    //text-horizontal-alignment: middle;
    //text-dx: -5;
  }

  [justified='right'] {
    text-horizontal-alignment: right;
    //text-horizontal-alignment: middle;
    //text-dx: 5;
  }

  [zoom>=4]  {
    text-size: @text_font_size_xxsm;
  }

  [zoom>=5] {
    text-size: @text_font_size_xsm;
  }

  [font_size=14] {
    text-size: @text_font_size_medium;
  }

  [font_size=16] {
    text-size: @text_font_size_medium_plus;
  }

  [font_size=18] {
    text-size: @text_font_size_large;
  }
}

#city_labels_z7,
#city_labels_z8, {
  // for debugging
  ::outline {
    polygon-fill: #fff;
    polygon-opacity: 0.1;
  }
  text-name: [name];
  text-face-name: @text_font_city;
  text-fill: @label_color_city;
  text-size: @text_font_size_sm;
  text-min-distance: 5;
  text-allow-overlap: true;

  [zoom>=7] {
    text-size: @text_font_size_xsm;
  }

  [font_size=18] {
    text-size: @text_font_size_large;
  }

  [font_size=20] {
    text-size: @text_font_size_large;
  }
}

#city_labels_z9,
#city_labels_z10 {
  text-name: [name];
  text-face-name: @text_font_city;
  text-fill: @label_color_city;
  text-size: 18;

  [font_size=20] {
    text-size: 32;
  }
}

#city_points_z4,
#city_points_z5, 
#city_points_z6,
#city_points_z7,
#city_points_z8 {
  marker-ignore-placement: true;
  marker-width: 5;
  marker-fill: #2e2115;
  marker-line-width: 0;
}

