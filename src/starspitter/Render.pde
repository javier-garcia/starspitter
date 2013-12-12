class Render{
  PApplet context;
  ShapesManager sm;
  
  Render( PApplet theContext, ShapesManager SM){
    context = theContext; 
    sm = SM;
  }
  
  public void render( ParticlesManager pm ){
    //sm.getBackground( ).draw( );
    sm.getTemplate( ).draw( );
    
    renderParticles( pm );
    
    sm.getLines( ).draw( );
    sm.getCenterShape( ).draw( );
    sm.getOutline( ).draw( );
  }
  
  private void renderParticles( ParticlesManager pm ){
    Particle[][][] particles;
    Particle p;
    RShape tempShape;
    
    particles = pm.getParticles();
    
    for( int sectorIndex = 0; sectorIndex < 5; sectorIndex++ ){
      for( int areaIndex = 0; areaIndex < 5; areaIndex++ ){
        for( int shapeIndex = 0; shapeIndex < particles[ sectorIndex ][ areaIndex ].length; shapeIndex++ ){
          p = particles[ sectorIndex ][ areaIndex ][ shapeIndex ];
          
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
