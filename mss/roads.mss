#ne-roads[zoom=7][scalerank<=4],
#ne-roads[zoom>=8][scalerank<=8] {
  ::casing {
    line-color: @color_transport_casing;
    line-opacity: 0.5;
    line-width: 1.5;

    [zoom=8][scalerank<=6] {
      line-width: 3;
    }
  }

  line-color: @color_transport;
  line-width: 0;

  [zoom=8][scalerank<=6] {
    line-width: 1;
  }
}

#roads,
#roads_med,
#highways_med {
  ::casing,
  ::outline,
  {
    line-cap: butt;
    line-width: 0;
    line-color: @color_transport_casing;
  }

  line-join: round;
  line-cap: round;
  line-width: 0;
  line-color: @color_transport;

  [is_link='yes']
  {
    [zoom>=16]
    {
      ::casing {
        line-width: 8;
      }

      line-width: 4;
    }
  }
}

#roads[kind='highway'],
#highways_med[kind='highway']
{    
  [zoom>=9] {
    ::outline {
      line-width: 3;
      line-color: @color_transport_casing_z10;
    }

    line-width: 1.5;    
  }

  [zoom>=10] {
    ::outline {
      line-width: 5;
    }

    line-width: 2;
  }

  [zoom>=11] {
    ::outline {
      line-width: 5;
      line-color: @color_transport_casing;
    }

    line-width: 3;
    line-color: @color_transport_hwy;    
  }

  [zoom>=12] {
    ::outline {
      line-width: 5;
    }

    line-width: 3;

    [is_link='yes'] {
      ::outline {
        line-width: 0;
      }

      line-width: 0.5;
    }
  }

  [zoom>=13] {
    ::outline {
      line-width: 8;
    }

    line-width: 4;

    [is_link='yes'] {
      ::outline {
        line-width: 3;
      }

      line-width: 1;
    }
  }

  [zoom>=14] {
    ::outline {
      line-width: 9;
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
    ::casing {
      line-width: 11;
    }

    line-width: 6;

    [is_link='yes'] {
      ::casing {
        line-width: 6.5;
      }

      line-width: 2.25;
    }
  }

  [zoom>=16] {
    ::casing {
      line-width: 13;
    }

    line-width: 7.5;

    [is_link='yes'] {
      ::casing {
        line-width: 7;
      }

      line-width: 2.5;
    }
  }

  [zoom>=17] {
    ::casing {
      line-width: 24;
    }

    line-width: 15;

    [is_link='yes'] {
      ::casing {
        line-width: 9;
      }

      line-width: 5;
    }
  }

  [zoom>=18] {
    ::casing {
      line-width: 39;
    }    

    line-width: 28;

    [is_link='yes'] {
      ::casing {
        line-width: 14;
      }

      line-width: 10;
    }
  }

  // [zoom>=19] {
  //   ::casing {
  //     line-width: 49;
  //   }

  //   line-width: 35;

  //   [is_link='yes'] {
  //     ::casing {
  //       line-width: 20;
  //     }

  //     line-width: 16;
  //   }
  // }
}

#roads[kind='major_road'],
#roads_med[kind='major_road']
{

  [zoom<=12] {
    line-color: @color_transport;
  }

  [zoom>=9] {
    line-width: 0.15;
  }

  [zoom>=10] {
    line-width: 0.5;
  }

  [zoom>=11] {
    ::outline {
      line-width: 1.25;
    }

    line-width: 0.7;
  }

  [zoom>=12] {
    ::outline {
      line-width: 4;
    }

    line-width: 2;

    [is_link='yes'] {
      ::outline {
        line-width: 0;
      }

      line-width: 1;
    }
  }

  [zoom>=13] {
    ::outline {
      line-width: 5;
    }

    line-width: 3;
  }

  [zoom>=14] {
    ::outline {
      line-width: 6;
    }

    line-width: 4;

    [is_link='yes'] {
      ::outline {
        line-width: 5;
      }

      line-width: 2;
    }
  }

  [zoom>=15] {
    ::casing {
      line-width: 8;
    }

    line-width: 5;

    [is_link='yes'] {
      ::casing {
        line-width: 5.5;
      }

      line-width: 2.5;
    }
  }

  [zoom>=16] {
    ::casing {
      line-width: 0;//10;
    }

    line-width: 7;

    [is_link='yes'] {
      ::casing {
        line-width: 0; //6;
      }

      line-width: 4;
    }
  }

  [zoom>=17] {
    ::outline {
      // line-width: 20;
    }

    line-width: 14;

    [is_link='yes'] {
      ::casing{
        // line-width: 14;
      }

      line-width: 7;
    }
  }

  [zoom>=18] {
    ::outline {
      // line-width: 25;
    }

    line-width: 17;

    [is_link='yes'] {
      ::casing {
        // line-width: 19;
      }

      line-width: 10;
    }
  }

  // [zoom>=19] {
  //   ::casing {
  //     line-width: 30;
  //   }

  //   line-width: 26;

  //   [is_link='yes'] {
  //     ::casing {
  //       line-width: 17;
  //     }

  //     line-width: 13;
  //   }
  // }
}

#roads[kind='minor_road'],
#roads_med[kind='minor_road']
{
  line-color: @color_transport_minor;

  [zoom>=10] {
    line-width: 1;
  }

  [zoom>=13] {
    line-width: 1.5;
    line-color: @color_transport;
  }

  [zoom>=14] {
    ::casing {
      line-width: 3.5;
      line-color: @color_transport_casing;
    }
    line-width: 2.5;
  }

  [zoom>=15] {
    ::casing {
      line-width: 6.5;
    }
    line-width: 4;
  }

  [zoom>=16] {
    ::casing {
      line-width: 0; //7.5;
    }    
    line-width: 4;    
  }

  [zoom>=17] {
    ::casing {
      // line-width: 11.5;
    }
    line-width: 8;
  }

  [zoom>=18] {
    ::casing {
      // line-width: 14.5;
    }    
    line-width: 11;
  }
}