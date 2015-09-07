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