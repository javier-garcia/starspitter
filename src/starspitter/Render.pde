class Render{
  PApplet context;
  ShapesManager sm;
  
  Render( PApplet theContext, ShapesManager SM){
    context = theContext; 
    sm = SM;
  }
  
  public void render( ParticlesManager pm ){
    
    renderBackground( pm );
    
    sm.getTemplate( ).draw( );
    
    renderParticles( pm );
    
    sm.getLines( ).draw( );
    sm.getCenterShape( ).draw( );
    sm.getOutline( ).draw( );
  }
  
  private void renderBackground( ParticlesManager pm ){
    Particle[] particles;
    Particle p;
    RShape tempShape;
    
    particles = pm.getBackgroundParticles( );
    
    for( int particleIndex = 0; particleIndex < particles.length; particleIndex++ ){
      p = particles[ particleIndex ];
      
      if( p.getScale( ) > 0 ){
        tempShape = new RShape( p.getShape( ) );
        tempShape.scale( p.getScale( ), tempShape.getCenter().x, tempShape.getCenter().y );
        tempShape.draw();
      }
    }
  }
  
  private void renderParticles( ParticlesManager pm ){
    Particle[][][] particles;
    Particle p;
    RShape tempShape;
    
    particles = pm.getSectorsParticles();
    
    
    
    for( int sectorIndex = 0; sectorIndex < 5; sectorIndex++ ){
      for( int areaIndex = 0; areaIndex < 5; areaIndex++ ){
        for( int particleIndex = 0; particleIndex < particles[ sectorIndex ][ areaIndex ].length; particleIndex++ ){
          p = particles[ sectorIndex ][ areaIndex ][ particleIndex ];
          
          if( p.getScale( ) > 0 ){
            tempShape = new RShape( p.getShape( ) );
            tempShape.scale( p.getScale( ), tempShape.getCenter().x, tempShape.getCenter().y );
            tempShape.draw();
          }
        }
      }
    }
  }
}
