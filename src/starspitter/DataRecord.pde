class DataRecord{
  String recordDatetime;
  
  int attention,
    meditation;
  
  float delta,
    theta,
    lowAlpha,
    highAlpha,
    lowBeta,
    highBeta,
    lowGamma,
    highGamma;
    
  int blinkStrength,
    signalNoise;
  
  DataRecord(String RecordDatetime,
    int Attention,
    int Meditation,
    float Delta,
    float Theta,
    float LowAlpha,
    float HighAlpha,
    float LowBeta,
    float HighBeta,
    float LowGamma,
    float HighGamma,
    int BlinkStrength,
    int SignalNoise){
    
    recordDatetime = RecordDatetime;
    attention = Attention;
    meditation = Meditation;
    delta = Delta;
    theta = Theta;
    lowAlpha = LowAlpha;
    highAlpha = HighAlpha;
    lowBeta = LowBeta;
    highBeta = HighBeta;
    lowGamma = LowGamma;
    highGamma = HighGamma;
    blinkStrength = BlinkStrength;
    signalNoise = SignalNoise;
  }
  
  public String getRecordDatetime(){
    return recordDatetime;
  }
  
  public int getAttention(){
    return attention;
  }
  
  public int getMeditation(){
    return meditation;
  }
  
  public float getDelta(){
    return delta;
  }
  
  public float getTheta(){
    return theta;
  }
  
  public float getLowAlpha(){
    return lowAlpha;
  }
  
  public float getHighAlpha(){
    return highAlpha;
  }
  
  public float getLowBeta(){
    return lowBeta;
  }
  
  public float getHighBeta(){
    return highBeta;
  }
  
  public float getLowGamma(){
    return lowGamma;
  }
  
  public float getHighGamma(){
    return highGamma;
  }
  
  public int getBlinkStrength(){
    return blinkStrength;
  }
  
  public int getSignalNoise(){
    return signalNoise;
  }
}
