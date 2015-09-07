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