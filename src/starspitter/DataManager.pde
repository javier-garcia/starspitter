class DataManager{
  private final int CONST_MAX_AVERAGE_ATTENTION = 100;
  private final int CONST_MIN_AVERAGE_ATTENTION = 0;
  private final int CONST_MAX_AVERAGE_MEDITATION = 100;
  private final int CONST_MIN_AVERAGE_MEDITATION = 0;
  private final int CONST_MAX_AVERAGE_DELTA = 399240;
  private final int CONST_MIN_AVERAGE_DELTA = 0;
  private final int CONST_MAX_AVERAGE_THETA = 3057580;
  private final int CONST_MIN_AVERAGE_THETA = 0;
  private final int CONST_MAX_AVERAGE_LOW_ALPHA = -1;
  private final int CONST_MIN_AVERAGE_LOW_ALPHA = 0;
  private final int CONST_MAX_AVERAGE_HIGH_ALPHA = 147640;
  private final int CONST_MIN_AVERAGE_HIGH_ALPHA = 0;
  private final int CONST_MAX_AVERAGE_LOW_BETA = -1;
  private final int CONST_MIN_AVERAGE_LOW_BETA = 0;
  private final int CONST_MAX_AVERAGE_HIGH_BETA = 140309;
  private final int CONST_MIN_AVERAGE_HIGH_BETA = 0;
  private final int CONST_MAX_AVERAGE_LOW_GAMMA = -1;
  private final int CONST_MIN_AVERAGE_LOW_GAMMA = 0;
  private final int CONST_MAX_AVERAGE_HIGH_GAMMA = 141156;
  private final int CONST_MIN_AVERAGE_HIGH_GAMMA = 0;
  private final int CONST_MAX_AVERAGE_BLINK_STRENGTH = 255;
  private final int CONST_MIN_AVERAGE_BLINK_STRENGTH = 0; 
  private final int CONST_MAX_AVERAGE_SIGNAL_NOISE = 255;
  private final int CONST_MIN_AVERAGE_SIGNAL_NOISE = 0;
  
  DataSet dataset;
  DataRecord actualDataRecord;
  int actualRecordIndex;
  
  DataManager(){
    actualRecordIndex = 0;
  }
  
  public int loadData(String Name){
    loadCVSData(Name + ".csv");
    
    actualRecordIndex = 0;
    
    actualDataRecord = dataset.getRecord(actualRecordIndex);
    
    return dataset.getRecordsCount();
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
    
    if(dataset == null){
      dataset = new DataSet("", RecordDatetime);
    }  
    
    dataset.addRecord(new DataRecord(RecordDatetime,
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
  
  public int loadNextRecord(){
    //TODO: Check number of Records
    actualRecordIndex++;
    if(actualRecordIndex < dataset.getRecordsCount()){
      actualDataRecord = dataset.getRecord(actualRecordIndex);
    }
    
    return actualRecordIndex;
  }
  
  public int loadLastRecord(){
    actualRecordIndex = dataset.getRecordsCount() - 1;
    
    actualDataRecord = dataset.getRecord(actualRecordIndex);
    
    return actualRecordIndex;
  }
  
  public int getRecordsCount(){
    if( dataset != null ){
      return dataset.getRecordsCount();
    } else {
      return -1;
    }
  }
  
  public float getAttention(){
    return map(actualDataRecord.getAttention(), CONST_MIN_AVERAGE_ATTENTION, CONST_MAX_AVERAGE_ATTENTION, 0, 100);
  }
  
  public float getMeditation(){
    return map(actualDataRecord.getMeditation(), CONST_MIN_AVERAGE_MEDITATION, CONST_MAX_AVERAGE_MEDITATION, 0, 100);
  }
  
  public float getDelta(){
    return map(actualDataRecord.getDelta(), CONST_MIN_AVERAGE_DELTA, CONST_MAX_AVERAGE_DELTA, 0, 100);
  }
  
  public float getTheta(){
    return map(actualDataRecord.getTheta(), CONST_MIN_AVERAGE_THETA, CONST_MAX_AVERAGE_THETA, 0, 100);
  }
  
  public float getLowAlpha(){
    return map(actualDataRecord.getLowAlpha(), CONST_MIN_AVERAGE_LOW_ALPHA, CONST_MAX_AVERAGE_LOW_ALPHA, 0, 100);
  }
  
  public float getHighAlpha(){
    return map(actualDataRecord.getHighAlpha(), CONST_MIN_AVERAGE_HIGH_ALPHA, CONST_MAX_AVERAGE_HIGH_ALPHA, 0, 100);
  }
  
  public float getLowBeta(){
    return map(actualDataRecord.getLowBeta(), CONST_MIN_AVERAGE_LOW_BETA, CONST_MAX_AVERAGE_LOW_BETA, 0, 100);
  }
  
  public float getHighBeta(){
    return map(actualDataRecord.getHighBeta(), CONST_MIN_AVERAGE_HIGH_BETA, CONST_MAX_AVERAGE_HIGH_BETA, 0, 100);
  }
  
  public float getLowGamma(){
    return map(actualDataRecord.getLowGamma(), CONST_MIN_AVERAGE_LOW_GAMMA, CONST_MAX_AVERAGE_LOW_GAMMA, 0, 100);
  }
  
  public float getHighGamma(){
    return map(actualDataRecord.getHighGamma(), CONST_MIN_AVERAGE_HIGH_GAMMA, CONST_MAX_AVERAGE_HIGH_GAMMA, 0, 100);
  }
  
  public float getBlinkStrength(){
    return map(actualDataRecord.getBlinkStrength(), CONST_MIN_AVERAGE_BLINK_STRENGTH, CONST_MAX_AVERAGE_BLINK_STRENGTH, 0, 100);
  }
  
  public float getSignalNoise(){
    return map(actualDataRecord.getSignalNoise(), CONST_MAX_AVERAGE_SIGNAL_NOISE, CONST_MAX_AVERAGE_SIGNAL_NOISE, 0, 100);
  }
  
  private void loadCVSData(String FileName){
    String[] record;    
    String[] records = loadStrings("data/" + FileName);
    
    record = split(records[1], ',');
    
    dataset = new DataSet(record[DataSet.CONST_FIELD_INDEX_SUBJECT_NAME], record[DataSet.CONST_FIELD_INDEX_START_DATETIME]);
    
    for(int recordIndex = 1; recordIndex < records.length; recordIndex++){
      record = split(records[recordIndex], ',');
      
      dataset.addRecord(record[DataSet.CONST_FIELD_INDEX_RECORD_DATETIME],
        parseInt(record[DataSet.CONST_FIELD_INDEX_ATTENTION]),
        parseInt(record[DataSet.CONST_FIELD_INDEX_MEDITATION]),
        parseFloat(record[DataSet.CONST_FIELD_INDEX_DELTA]),
        parseFloat(record[DataSet.CONST_FIELD_INDEX_THETA]),
        parseFloat(record[DataSet.CONST_FIELD_INDEX_LOW_ALPHA]),
        parseFloat(record[DataSet.CONST_FIELD_INDEX_HIGH_ALPHA]),
        parseFloat(record[DataSet.CONST_FIELD_INDEX_LOW_BETA]),
        parseFloat(record[DataSet.CONST_FIELD_INDEX_HIGH_BETA]),
        parseFloat(record[DataSet.CONST_FIELD_INDEX_LOW_GAMMA]),
        parseFloat(record[DataSet.CONST_FIELD_INDEX_HIGH_GAMMA]),
        parseInt(record[DataSet.CONST_FIELD_INDEX_BLINK_STRENGTH]),
        parseInt(record[DataSet.CONST_FIELD_INDEX_SIGNAL_NOISE]));
    }
  }
}
