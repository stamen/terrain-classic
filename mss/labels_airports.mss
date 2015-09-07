#airports {
  [zoom>=10] {
    text-name: [abbrev];
    text-face-name: @text_font_transport;
    text-fill: #444;
    text-size: @text_font_size_medium_plus;
    
    text-halo-fill: @label_color_airport_halo;
    text-halo-radius: @text_font_halo_radius_large;
    
    text-wrap-width: 128;
    text-dy: 14;  
  }

  [zoom>=13] {
    text-name: [name];
  }

  [zoom=14][natlscale>.04],
  [zoom=15][natlscale>.02],
  [zoom>=16][natlscale>.01]
  {
      text-dy: 20;
  }   

  [zoom=8][natlscale>2.3][type='major'],
  [zoom=9][natlscale>1.2][type='major'],
  [zoom=10][natlscale>0.57][type='major'],
  [zoom=11][natlscale>0.29][type='major'],
  [zoom=12][natlscale>0.29][type='major'],
  [zoom=13][natlscale>0.29][type='major']
  {
    point-file: url('icons/airport_major_l.png');
  }

  [zoom=14][natlscale>.29][type='major'],
  [zoom=15][natlscale>.29][type='major'],
  [zoom>=16][natlscale>.29][type='major']
  {
      point-file: url('icons/airport_major_xl.png');
  }

  [zoom=8][natlscale>2.3][type='small'],
  [zoom=9][natlscale>1.2][type='small'],
  [zoom=10][natlscale>.57][type='small'],
  [zoom=11][natlscale>.29][type='small'],
  [zoom=12][natlscale>.29][type='small'],
  [zoom=13][natlscale>.29][type='small']
  {
      point-file: url('icons/airport_small_l.png');
  }

  [zoom=14][natlscale>.29][type='small'],
  [zoom=15][natlscale>.29][type='small'],
  [zoom>=16][natlscale>.29][type='small']
  {
      point-file: url('icons/airport_small_xl.png');
  }

  [zoom=8][natlscale>2.3][type='military'],
  [zoom=9][natlscale>1.2][type='military'],
  [zoom=10][natlscale>.57][type='military'],
  [zoom=11][natlscale>.29][type='military'],
  [zoom=12][natlscale>.29][type='military'],
  [zoom=13][natlscale>.29][type='military']
  {
      point-file: url('icons/airport_military_l.png');
  }

  [zoom=14][natlscale>.29][type='military'],
  [zoom=15][natlscale>.29][type='military'],
  [zoom>=16][natlscale>.29][type='military']
  {
      point-file: url('icons/airport_military_xl.png');
  }

  [zoom=8][natlscale>2.3][type='spaceport'],
  [zoom=9][natlscale>1.2][type='spaceport'],
  [zoom=10][natlscale>.57][type='spaceport'],
  [zoom=11][natlscale>.29][type='spaceport'],
  [zoom=12][natlscale>.29][type='spaceport'],
  [zoom=13][natlscale>.29][type='spaceport']
  {
      point-file: url('icons/intergalactic_l.png');
  }

  [zoom=14][natlscale>.29][type='spaceport'],
  [zoom=15][natlscale>.29][type='spaceport'],
  [zoom>=16][natlscale>.29][type='spaceport']
  {
      point-file: url('icons/intergalactic_xl.png');
  }
}
