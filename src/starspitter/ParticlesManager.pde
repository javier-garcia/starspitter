class ParticlesManager{
  
  private final int reactionDistance = 20;
  
  //TODO: particles in unidimensional array with Sector and Area properties?
  
  Particle[][][] particlesSectors;
  Particle[] particlesBackground;
  float[][] areasRadios;
  
  ParticlesManager( ShapesManager SM ){    
    RShape tempShape;
    
    particlesSectors = new Particle[ 5 ][ 5 ][ ];
    areasRadios = new float[ 5 ][ 2 ];
    areasRadios[ 0 ][ 0 ] = 0;
    areasRadios[ 0 ][ 1 ] = 60;
    areasRadios[ 1 ][ 0 ] = 50;
    areasRadios[ 1 ][ 1 ] = 105;
    areasRadios[ 2 ][ 0 ] = 75;
    areasRadios[ 2 ][ 1 ] = 175;
    areasRadios[ 3 ][ 0 ] = 100;
    areasRadios[ 3 ][ 1 ] = 268;
    areasRadios[ 4 ][ 0 ] = 125;
    areasRadios[ 4 ][ 1 ] = 347;
    
    for( int sectorIndex = 0; sectorIndex < 5; sectorIndex++ ){
      tempShape = SM.getSectorShape( sectorIndex );
      for( int areaIndex = 0; areaIndex < 5; areaIndex++ ){
        particlesSectors[ sectorIndex ][ areaIndex ] = new Particle[ tempShape.children[ areaIndex ].countChildren( ) ];
        for( int shapeIndex = 0; shapeIndex < tempShape.children[areaIndex].countChildren(); shapeIndex++ ){
          particlesSectors[ sectorIndex ][ areaIndex ][ shapeIndex ] = new Particle( 
              tempShape.children[ areaIndex ].children[ shapeIndex ], 
              tempShape.children[ areaIndex ].children[ shapeIndex ].getCenter( ).dist( new RPoint( width / 2, height / 2 ) )
          );
        }
      }
    }
    
    tempShape = SM.getBackground( );
    particlesBackground = new Particle[ tempShape.countChildren( ) ];
    
    for( int shapeIndex = 0; shapeIndex < tempShape.countChildren( ); shapeIndex++ ){
      particlesBackground[ shapeIndex ] = new Particle(
          tempShape.children[ shapeIndex ],
          tempShape.children[ shapeIndex ].getCenter( ).dist( new RPoint( width / 2, height / 2 ) )
      );
    }
  }
  
  public void update( TweenManager tm ){
    float distance;
    Particle p;
    
    for( int sectorIndex = 0; sectorIndex < 5; sectorIndex++ ){
      for( int areaIndex = 0; areaIndex < 5; areaIndex++ ){
        for( int shapeIndex = 0; shapeIndex < particlesSectors[ sectorIndex ][ areaIndex ].length; shapeIndex++ ){
          p = particlesSectors[ sectorIndex ][ areaIndex ][ shapeIndex ];
          
          distance = p.getDistance2Center( ) - map( tm.getTweenValue( sectorIndex ), ( areaIndex == 0 ) ? 0 : areasRadios[ areaIndex - 1 ][ 1 ], areasRadios[ areaIndex ][ 1 ], areasRadios[ areaIndex ][ 0 ], areasRadios[ areaIndex ][ 1 ] );
                    
          if(distance > 0){
            if(distance <= reactionDistance){
              p.setScale( map( distance, reactionDistance, 0, 0, 1 ) );
            } else {
              p.setScale(0);
            }
          } else {
            p.setScale(1);
          }
        }
      }
    }
    
    for( int shapeIndex = 0; shapeIndex < particlesBackground.length; shapeIndex++ ){
      p = particlesBackground[ shapeIndex ];
      
      distance = p.getDistance2Center( ) - tm.getBackgroundTweenValue( );
      
      if(distance > 0){
        if(distance <= reactionDistance){
          p.setScale( map( distance, reactionDistance, 0, 0, 1 ) );
        } else {
          p.setScale(0);
        }
      } else {
        p.setScale(1);
      }
    }
  }
  
  
  
  public void renderRadio( int AreaIndex ){
    stroke(255, 0, 0);
    noFill();
    ellipseMode(RADIUS);
    ellipse( width / 2, height / 2, areasRadios[ AreaIndex ][ 0 ], areasRadios[ AreaIndex ][ 0 ] );
    ellipse( width / 2, height / 2, areasRadios[ AreaIndex ][ 1 ], areasRadios[ AreaIndex ][ 1 ] );
  }
  
  public Particle[][][] getSectorsParticles(){
    return particlesSectors;
  }
  
  public Particle[] getBackgroundParticles(){
    return particlesBackground;
  }
}
