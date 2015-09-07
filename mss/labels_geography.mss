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