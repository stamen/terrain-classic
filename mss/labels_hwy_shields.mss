#highway_shields {
  [zoom>=11],
  [highway='motorway'],
  [highway='trunk'],
  [highway='primary'] {
    // arbitrary default shield
    shield-file: url(shields/state-25.png);
    shield-fill: @label_color_shield_fed;    
    shield-transform: scale(1.2, 1.2);
    shield-face-name: @text_font_shield;
    shield-name: [ref];
    shield-size: 10;
    shield-min-distance: 44;
    shield-spacing: 20;
    // half the width of the shield to prevent from wrapping
    shield-min-padding: 10;

    [ref=~'I \d+'] {
      shield-file: url(shields/interstate_2.svg);
      shield-transform: scale(0.033, 0.033);
      shield-fill: @label_color_shield;
      shield-size: 9;
      shield-name: "[ref].replace('I ', '')";

      [zoom>=13] {
        shield-size: 11;
        shield-transform: scale(0.038, 0.038);
        shield-min-distance: 65;
      }

      [zoom>=15] {
        shield-size: 13;
        shield-transform: scale(0.045, 0.045);
      }

      [zoom>=17] {
        shield-size: 15;
        shield-transform: scale(0.05, 0.05);
      }      
    }

    [ref=~'I \d{3,}'] {
      shield-file: url(shields/interstate_3.svg);
      shield-transform: scale(0.033, 0.033);
      shield-fill: @label_color_shield;
      shield-size: 9;
      shield-name: "[ref].replace('I ', '')";

      [zoom>=13] {
        shield-size: 11;
        shield-transform: scale(0.038, 0.038);
        shield-min-distance: 40;
      }

      [zoom>=15] {
        shield-size: 13;
        shield-transform: scale(0.045, 0.045);
      }

      [zoom>=17] {
        shield-size: 13;
        shield-transform: scale(0.05, 0.05);
      }         
    }

    [ref=~'US \d+'] {
      shield-file: url(shields/us.svg);
      shield-transform: scale(0.062, 0.062);
      shield-size: 10;
      shield-name: "[ref].replace('US ', '')";
      shield-fill: @label_color_shield_fed;
      shield-text-dy: 1;
      shield-character-spacing: -1;

      [zoom>=13] {
        shield-size: 12;
        shield-transform: scale(0.075, 0.075);
      }

      [zoom>=15] {
        shield-size: 14;
        shield-transform: scale(0.088, 0.088);
      }

      [zoom>=17] {
        shield-size: 16;
        shield-transform: scale(0.091, 0.091);
      }         
    }

    [ref=~'CA \d+'] {
      shield-file: url(shields/ca.svg);
      shield-fill: @label_color_shield;
      shield-transform: scale(0.052, 0.052);
      shield-size: 10;
      shield-name: "[ref].replace('CA ', '')";
      shield-dy: -2.5;
      shield-character-spacing: -1;

      [zoom>=13] {
        shield-size: 12;
        shield-transform: scale(0.060, 0.060);
        shield-min-distance: 50;
      }

      [zoom>=14] {
        shield-min-distance: 80;
      }

      [zoom>=15] {
        shield-size: 14;
        shield-transform: scale(0.080, 0.080);
        shield-dy: -3.5;
      }

      [zoom>=17] {
        shield-size: 16;
        shield-transform: scale(0.090, 0.090);        
      }       
    }
  }
}