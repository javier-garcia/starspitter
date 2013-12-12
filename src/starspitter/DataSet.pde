class DataSet{
  public static final int CONST_FIELD_INDEX_SUBJECT_NAME = 3;
  public static final int CONST_FIELD_INDEX_START_DATETIME = 4;
  public static final int CONST_FIELD_INDEX_RECORD_DATETIME = 5;
  public static final int CONST_FIELD_INDEX_ATTENTION = 6;
  public static final int CONST_FIELD_INDEX_MEDITATION = 7;
  public static final int CONST_FIELD_INDEX_DELTA = 8;
  public static final int CONST_FIELD_INDEX_THETA = 9;
  public static final int CONST_FIELD_INDEX_LOW_ALPHA = 10;
  public static final int CONST_FIELD_INDEX_HIGH_ALPHA = 11;
  public static final int CONST_FIELD_INDEX_LOW_BETA = 12;
  public static final int CONST_FIELD_INDEX_HIGH_BETA = 13;
  public static final int CONST_FIELD_INDEX_LOW_GAMMA = 14;
  public static final int CONST_FIELD_INDEX_HIGH_GAMMA = 15;
  public static final int CONST_FIELD_INDEX_BLINK_STRENGTH = 16;
  public static final int CONST_FIELD_INDEX_SIGNAL_NOISE = 17;
  
  String subjectName;
  String startDatetime;
  ArrayList<DataRecord> dataRecords;
  float sumAttention,
    sumMeditation,
    sumDelta,
    sumTheta,
    sumLowAlpha,
    sumHighAlpha,
    sumLowBeta,
    sumHighBeta,
    sumLowGamma,
    sumHighGamma,
    sumBlinkStrength,
    sumSignalNoise;
  
  DataSet(String SubjectName, String StartDatetime){ 
    subjectName = SubjectName;
    startDatetime = StartDatetime;
    
    dataRecords = new ArrayList<DataRecord>();
  }
  
  public void addRecord(String RecordDatetime,
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

    addRecord(new DataRecord(RecordDatetime,
    Attention,
    Meditation,
    Delta,
    Theta,
    LowAlpha,
    HighAlpha,
    LowBeta,
    HighBeta,
    LowGamma,
    HighGamma,
    BlinkStrength,
    SignalNoise));  
  }
  
  public void addRecord(DataRecord NewRecord){
    dataRecords.add(NewRecord);
    updateSum(NewRecord);
  }
  
  public String getSubjectName(){
    return subjectName;
  }
  
  public String getStartDatetime(){
    return startDatetime;
  }
  
  public int getRecordsCount(){
    return dataRecords.size();
  }
  
  public DataRecord getRecord(int RecordIndex){
    return dataRecords.get(RecordIndex);
  }
  
  void updateSum(DataRecord NewRecord){
    sumAttention += NewRecord.getAttention();
    sumMeditation += NewRecord.getMeditation();
    sumDelta += NewRecord.getDelta();
    sumTheta += NewRecord.getTheta();
    sumLowAlpha += NewRecord.getLowAlpha();
    sumHighAlpha += NewRecord.getHighAlpha();
    sumLowBeta += NewRecord.getLowBeta();
    sumHighBeta += NewRecord.getHighBeta();
    sumLowGamma += NewRecord.getLowGamma();
    sumHighGamma += NewRecord.getHighGamma();
    sumBlinkStrength += NewRecord.getBlinkStrength();
    sumSignalNoise += NewRecord.getSignalNoise();
  }
  
  public float getAverageAttention(){
    return sumAttention / dataRecords.size();
  }
  
  public float getAverageMeditation(){
    return sumMeditation / dataRecords.size();
  }
  
  public float getAverageDelta(){
    return sumDelta / dataRecords.size();
  }
  
  public float getAverageTheta(){
    return sumTheta / dataRecords.size();
  }
  
  public float getAverageLowAlpha(){
    return sumLowAlpha / dataRecords.size();
  }
  
  public float getAverageHighAlpha(){
    return sumHighAlpha / dataRecords.size();
  }
  
  public float getAverageLowBeta(){
    return sumLowBeta / dataRecords.size();
  }
  
  public float getAverageHighBeta(){
    return sumHighBeta / dataRecords.size();
  }
  
  public float getAverageLowGamma(){
    return sumLowGamma / dataRecords.size();
  }
  
  public float getAverageHighGamma(){
    return sumHighGamma / dataRecords.size();
  }
  
  public float getAverageBlinkStrength(){
    return sumBlinkStrength / dataRecords.size();
  }
  
  public float getAverageSignalNoise(){
    return sumSignalNoise / dataRecords.size();
  }
}
