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