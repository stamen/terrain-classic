@text_font_transport: 'CaslonAntiqueVL Regular';
@text_font_administrative: 'CaslonAntiqueVL Regular';
@text_font_city: 'CaslonAntiqueVL Regular';
@text_font_parks: 'Caslon Antique Italic';

@label_color_transport: #524c4c;
@label_color_administrative: #2e2115;
@label_color_city: #2e2115;

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
  text-placement: interior;
  text-name: [name];
  text-vertical-alignment: bottom;
  text-face-name: @text_font_city;
  text-fill: @label_color_city;
  text-min-distance: 5;

  [zoom>=4] {
    text-size: 16;
  }

  [zoom>=6] {
    text-size: 17;
  }

  [font_size=14] {
    text-size: 19;
  }

  [font_size=16] {
    text-size: 20;
  }

  [font_size=18] {
    text-size: 21;
  }
}

#city_labels_z7,
#city_labels_z8, {
  text-name: [name];
  text-vertical-alignment: bottom;
  text-face-name: @text_font_city;
  text-fill: @label_color_city;
  text-size: 13;
  text-min-distance: 5;

  [zoom>=7] {
    text-size: 16;
  }

  [zoom>=8] {
    text-size: 18;
  }

  [font_size=18] {
    text-size: 22;
  }

  [font_size=20] {
    text-size: 23;
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

