/**
 * Zoom 13 buildings.
 * Already filtered by size upon import.
 */
#buildings-med[type!='no'] {
  polygon-fill: @color_building;
  line-width: 0.5;
  line-color: @color_building_outline;
}

/**
 * Zoom 14+ buildings.
 * Includes all buildings.
 */
#buildings-high[type!='no'] {
  [zoom=14] {
    [area>=5000] {
      polygon-fill: @color_building;
      line-width: 0.5;
      line-color: @color_building_outline;
    }
  }

  /**
   * This is for outlines and no stripe. Catches small buildings.
   * Larger buildings will be overridden with stripes below.
   */
  [zoom>=15][area>=2000],
  [zoom>=16] {
    polygon-fill: @color_building;
    line-width: 0.5;
    line-color: @color_building_outline;
  }

  [zoom=15][area>=3000],
  [zoom=16][area>=2000],
  [zoom=17][area>=1000],
  [zoom>=18],
  {
    polygon-fill: @color_building;
    line-width: 0.5;
    line-color: @color_building_outline;
  }

  // Stamen HQ fancy candycane striping
  [zoom>=18] {
    [osm_id=260351411],
    [osm_id=224030635], // Seth's house
    [osm_id=248153467], // Sean's house
    [osm_id=291796473], // Stamen South
    {
      polygon-fill: @color_building;
      line-width: 1.5;
      line-color: @color_building_outline_special;
    }
  }
}