/*** 
  Global Variables 
  - "map" is also defined here (at the bottom)
***/

@color_physical: #dee0be;
@color_physical_bright: #fff;
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
@color_green_areas: darken(#c0d3b5,20);

@text_font_transport: 'PT Sans Narrow Regular', 'Unifont Medium';
@text_font_shield: 'PT Sans Bold', 'Unifont';
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
  background-color: @color_water;
  font-directory: url("fonts/");
  buffer-size: 128;
}