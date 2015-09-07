/* aeroways, tunnels, bridges, railways, paths, service roads  */ 

#aeroways {
  line-color: @color_airport_runways;
  line-cap: square;
  line-join: miter;

  [type='runway'] {
    [zoom=10] {
      line-width: 1;
    }
    [zoom=11] {
      line-width: 1.5;
    }
    [zoom=12] {
      line-width: 2;
    }

    [zoom=13] {
      line-width: 4;
    }

    [zoom=14] {
      line-width: 8;
    }

    [zoom=15] {
      line-width: 16;
    }

    [zoom=16] {
      line-width: 32;
    }

    [zoom=17] {
      line-width: 64;
    }

    [zoom>=18] {
      line-width: 128;
    }
  }

  [type='taxiway'] {
    [zoom=13] {
      line-width: 1;
    }

    [zoom=14] {
      line-width: 2;
    }

    [zoom=15] {
      line-width: 4;
    }

    [zoom=16] {
      line-width: 8;
    }

    [zoom=17] {
      line-width: 16;
    }

    [zoom>=18] {
      line-width: 32;
    }
  }
}

#tunnels,
#roads,
#roads_med,
#highways_med,
#bridges {
  ::casing,
  ::outline,
  {
    line-cap: butt;
    line-width: 0;
    line-color: @color_transport_casing;
  }

  line-join: round;
  line-cap: round;
  line-width: 1;
  line-color: @color_transport;
}

#tunnels {
  [zoom>=14] {
    ::outline
    {
      line-opacity: 0.7;
      line-color: @color_transport_tunnel;
    }

    line-opacity: 0.5;
    line-width: 4;
  }
}

#tunnels[kind='highway'] {
  [zoom>=15] {
    ::outline {
      line-width: 5.5;
    }

    line-width: 4;
  }

  [zoom>=16] {
    ::outline {
      line-width: 7;
      line-opacity: 0.4;
    }

    line-opacity: 0.7;
    line-color: @color_transport_tunnel;

    [is_link='yes'] {
      ::outline {
        line-color: @color_transport_casing;
      }
    }
  }

  [zoom>=17] {
    ::outline {
      line-width: 18;
    }

    line-width: 12;

    [is_link='yes'] {
      ::outline {
        line-width: 9;
      }
    }
  }

  [zoom>=18] {
    ::outline {
      line-width: 22;
      line-color: @color_transport;
    }

    line-width: 18;
    line-color: @color_transport_inline;
  }

  [zoom>=19] {
    ::outline {
      line-width: 30;
    }

    line-width: 26;

    [is_link='yes'] {
      ::outline {
        line-width: 13;
      }
    }
  }
}

#tunnels[kind='major_road'] {
  [zoom>=15] {
    ::outline {
      line-width: 5;
      line-opacity: 0.7;
      line-color: @color_transport_tunnel;
    }

    line-width: 3;
    line-opacity: 0.5;
  }

  [zoom>=16] {
    ::outline {
      line-width: 7;
      line-opacity: 0.4;
    }

    line-opacity: 0.7;
    line-color: @color_transport_tunnel;

    [is_link='yes'] {
      ::outline {
        line-color: @color_transport_casing;
      }
    }
  }

  [zoom>=17] {
    ::outline {
      line-width: 18;
    }

    line-width: 12;

    [is_link='yes'] {
      ::outline {
        line-width: 9;
      }
    }
  }

  [zoom>=18] {
    ::outline {
      line-width: 22;
    }

    line-width: 18;
  }

  [zoom>=19] {
    ::outline {
      line-width: 30;
    }

    line-width: 26;

    [is_link='yes'] {
      ::outline {
        line-width: 13;
      }
    }
  }
}

#tunnels[kind='minor_road'] {
  [zoom>=15] {
    ::outline {
      line-opacity: 0.7;
      line-color: @color_transport_tunnel;
    }

    line-color: @color_transport_minor;
    line-width: 1.5;
    line-opacity: 0.5;
  }

  [zoom>=16] {
    ::outline {
      line-width: 7;
    }

    line-width: 4;
    line-color: @color_transport;
  }

  [zoom>=17] {
    ::outline {
      line-width: 9;
    }

    line-width: 7;
  }

  [zoom>=18] {
    ::outline {
      line-width: 17;
      line-color: @color_transport;
    }

    line-width: 13;
    line-color: @color_transport_casing;
  }

  [zoom>=19] {
    ::outline {
      line-width: 20;
    }

    line-width: 16;
  }
}

#bridges[kind='highway'] {
  [zoom>=13] {
    ::outline {
      line-width: 8;
    }

    line-width: 4;
    line-color: @color_transport_hwy;

    [is_link='yes'] {
      ::outline {
        line-width: 0;
      }

      line-width: 1;
      line-color: @color_transport_hwy;
    }
  }

  [zoom>=14] {
    ::outline {
      line-width: 8;
    }

    line-width: 4;

    [is_link='yes'] {
      ::outline {
        line-width: 4;
      }

      line-width: 2.5;
    }
  }

  [zoom>=15] {
    ::outline {
      line-width: 11;
    }

    line-width: 6;

    [is_link='yes'] {
      ::outline {
        line-width: 5.5;
      }

      line-width: 2.5;
    }
  }

  [zoom>=16] {
    ::outline {
      line-width: 14;
    }

    line-width: 9;

    [is_link='yes'] {
      ::outline {
        line-width: 7;
      }

      line-width: 2.5;
    }
  }

  [zoom>=17] {
    ::outline {
      line-width: 20;
    }

    line-width: 15;

    [is_link='yes'] {
      ::outline {
        line-width: 9;
      }

      line-width: 5;
    }
  }

  [zoom>=18] {
    ::outline {
      line-width: 44;
      line-color: @color_transport;
    }

    line-width: 28;
    line-color: @color_transport_inline;

    [is_link='yes'] {
      ::outline {
        line-width: 22;
      }

      line-width: 18;
    }
  }

  [zoom>=19] {
    ::outline {
      line-width: 51;
    }

    line-width: 35;

    [is_link='yes'] {
      ::outline {
        line-width: 21;
      }

      line-width: 16;
    }
  }
}

#bridges[kind='major_road'] {
  line-color: @color_transport;

  [zoom>=14] {
    ::outline {
      line-width: 5;
    }

    line-width: 1.9;
  }

  [zoom>=15] {
    ::outline {
      line-width: 8.5;
    }

    line-width: 5.5;

    [is_link='yes'] {
      ::outline {
        line-width: 5.5;
      }

      line-width: 2.5;
    }
  }

  [zoom>=16] {
    ::outline {
      line-width: 11;
    }

    line-width: 7;

    [is_link='yes'] {
      ::outline {
        line-width: 7;
      }

      line-width: 2.5;
    }
  }

  [zoom>=17] {
    ::outline {
      line-width: 18;
    }

    line-width: 12;

    [is_link='yes'] {
      ::outline {
        line-width: 8;
      }

      line-width: 4;
    }
  }

  [zoom>=18] {
    ::outline {
      line-width: 24;
      line-color: @color_transport;
    }

    line-width: 18;
    line-color: @color_transport_inline;

    [is_link='yes'] {
      ::outline {
        line-width: 14;
      }

      line-width: 9;
    }
  }

  [zoom>=19] {
    ::outline {
      line-width: 32;
    }

    line-width: 26;

    [is_link='yes'] {
      ::outline {
        line-width: 18;
      }

      line-width: 13;
    }
  }
}

#tunnels[kind='rail'],
#roads[kind='rail'],
#bridges[kind='rail']
{
  ::casing,
  ::outline,
  {
    line-color: @color_transport_rail;
  }

  line-color: @color_transport_rail;

  [zoom>=14] {
    ::casing {
      line-width: 3;
      line-dasharray: 1,3;
    }

    line-width: 1;
  }

  [zoom>=16] {
    ::casing {
      line-width: 5;
      line-dasharray: 1,4;
    }
  }

  [zoom>=18] {
    ::casing {
      line-width: 6;
      line-dasharray: 2,6;
    }

    line-width: 2;
  }

  [zoom>=19] {
    line-width: 4;
  }
}

#tunnels[highway='service'],
#roads[highway='service'],
#bridges[highway='service'],
{
  [zoom>=15] {
    ::casing {
     line-width: 2.8; 
    }

    line-width: 1.8;
  }

  [zoom>=16] {
    ::casing {
      line-width: 0;
    }

    line-width: 2;
  }

  [zoom>=17] {
    line-width: 4;
  }
}

#tunnels[kind='path'],
#roads[kind='path'],
#bridges[kind='path'],
{
  line-color: @color_transport_path;

  [zoom>=15] {
    line-width: 0.5;
    line-cap: butt;
    line-dasharray: 2, 3;
  }

  [zoom>=16] {
    line-width: 0.7;
  }

  [zoom>=17] {
    line-width: 1.2;
    line-dasharray: 4, 6;
  }
}