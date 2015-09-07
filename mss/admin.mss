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
  [zoom>=6][featurecla='Map unit boundary'][adm0_a3='GBR'] {
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

#admin1-lines-osm,
{
  line-width: 2.0;
  line-color: @color_administrative_medium_high2;
  line-dasharray: 1,5;
  line-cap: round;
}