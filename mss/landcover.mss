#lc500mMODIS_low {
  [zoom>=0][zoom<9] {
    raster-opacity:1;
    raster-scaling:gaussian;
    image-filters: agg-stack-blur(0,0);  
  }
}

#lc500mMODIS_med {
  [zoom>=9] {
    raster-opacity:1;
    raster-scaling:gaussian;
    image-filters: agg-stack-blur(3,3);
  }
}

#lc500mMODIS_high {
  [zoom>=14] {
    raster-opacity:0.8;
    raster-scaling:gaussian;
    image-filters: agg-stack-blur(20,20);    
  }
}