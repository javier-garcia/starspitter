class PercentTween{
  float endValue;
  float startValue;
  float valueChange;
  int duration;
  int startTime;
  float actualValue;
  float speed; //Value change in 1000 milliseconds
  
  PercentTween(){
    actualValue = 0;
    duration = 0;
    //speed = 75;
  }
  
  void update(int Time){
    if(duration > 0){
      int ellapsedTime = Time - startTime;
    
      if(ellapsedTime < duration){
        actualValue = linearTween(ellapsedTime, startValue, valueChange, duration);
      } else {
        actualValue = endValue;
      }
    }
  }
  
  private float linearTween(int t, float b, float c, int d ) {
    return c * t / d + b;
  }
  
  public void setEndValue(float Value){
    startTime = millis();
    endValue = Value;
    startValue = actualValue;
    valueChange = endValue - startValue;
    //duration = abs(round(valueChange * 1000 / speed));
    duration = 1000;
  }
  
  public float getValue(){
    return actualValue;
  }
}
