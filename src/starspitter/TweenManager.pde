class TweenManager{
  PercentTween[] tweens;
  
  TweenManager(){
    tweens = new PercentTween[5];
    
    for(int i = 0; i < 5; i++){
      tweens[i] = new PercentTween();
    }
  }
  
  public void update(){
    for(int i = 0; i < 5; i++){
      tweens[i].update(millis());
    }
  }
  
  public float getTweenValue(int TweenIndex){
    return tweens[TweenIndex].getValue();
  }
  
  public void reset(){
    for(int i = 0; i < 5; i++){
      tweens[i].setEndValue( 0 );
    }
  }
  
  public void setTweenEndValue(int TweenIndex, float EndValue){
    tweens[TweenIndex].setEndValue(EndValue);
  }
}
