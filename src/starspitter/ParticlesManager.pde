class ParticlesManager{
  
  //TODO: particles in unidimensional array with Sector and Area properties?
  
  Particle[][][] particlesSectors;
  Particle[] particlesBackground;
  
  ParticlesManager( ShapesManager SM ){
    RShape tempShape;
    
    particlesSectors = new Particle[ 5 ][ 5 ][ ];
    
    for( int sectorIndex = 0; sectorIndex < 5; sectorIndex++ ){
      tempShape = SM.getSectorShape( sectorIndex );
      for(int areaIndex = 0; areaIndex < 5; areaIndex++){
        particlesSectors[ sectorIndex ][ areaIndex ] = new Particle[ tempShape.children[areaIndex].countChildren() ];
        for( int shapeIndex = 0; shapeIndex < tempShape.children[areaIndex].countChildren(); shapeIndex++ ){
          particlesSectors[ sectorIndex ][ areaIndex ][ shapeIndex ] = new Particle( 
              tempShape.children[ areaIndex ].children[ shapeIndex ], 
              tempShape.children[ areaIndex ].children[ shapeIndex ].getCenter( ).dist( new RPoint( width / 2, height / 2 ) )
          );
        }
      }   
    }
  }
  
  public void update( TweenManager tm ){
    float distance;
    Particle p;
    
    for( int sectorIndex = 0; sectorIndex < 5; sectorIndex++ ){
      for( int areaIndex = 0; areaIndex < 5; areaIndex++ ){
        for( int shapeIndex = 0; shapeIndex < particlesSectors[ sectorIndex ][ areaIndex ].length; shapeIndex++ ){
          p = particlesSectors[ sectorIndex ][ areaIndex ][ shapeIndex ];
          
          distance = p.getDistance2Center( ) - tm.getTweenValue( sectorIndex );
          
          if(distance > 0){
            if(distance <= 20){
              p.setScale( map( distance, 20, 0, 0, 1 ) );
            } else {
              p.setScale(0);
            }
          } else {
            p.setScale(1);
          }
        }
      }
    }
  }
  
  public Particle[][][] getParticles(){
    return particlesSectors;
  }
}
