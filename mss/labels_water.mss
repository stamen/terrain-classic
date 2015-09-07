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