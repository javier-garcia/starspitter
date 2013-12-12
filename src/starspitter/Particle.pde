class Particle{
  float scale;
  RShape shape;
  float distance2Center;
  
  Particle(RShape TheShape, float Distance2Center){    
    shape = TheShape;
    scale = 1;
    distance2Center = Distance2Center;
  }
  
  public float getDistance2Center(){
    return distance2Center;
  }
  
  public void setScale(float Value){
    scale = Value;
  }
  
  public float getScale(){
    return scale;
  }
  
  public RShape getShape(){
    return shape;
  }
}
