ControlsManager cm;
DataManager dm;
ShapesManager sm;
ParticlesManager pm;
TweenManager tm;
MindwaveController mc;

Render render;

int lastUpdate;

void setup( ){
  size( 1000, 1000, P3D );
  frameRate( 30 );
  
  cm = new ControlsManager( this );
  dm = new DataManager( );
  sm = new ShapesManager( this, "penrose_v2.svg" );
  pm = new ParticlesManager( sm );
  tm = new TweenManager( );
  mc = new MindwaveController( this );
  
  render = new Render( this, sm );
  
  RG.init( this );
  
  lastUpdate = millis( );
}

void draw( ){
  background( 0 );
  noStroke( );
  
  int actualRecord;
  float ellapsedTime = millis( ) - lastUpdate;
  
  if( ellapsedTime >= 1000 ){
    if( cm.getModus( ) == ControlsManager.CONST_MODUS_FILE ){
      if( dm.getRecordsCount( ) < 0 ){
        cm.setFileStatus( false );
      } else {
        actualRecord = dm.loadNextRecord( );
        
        tm.setTweenEndValue( 0, map( dm.getTheta( ), 0, 100, 0, 350 ) );
        tm.setTweenEndValue( 1, map( dm.getHighAlpha( ), 0, 100, 0, 350 ) );
        tm.setTweenEndValue( 2, map( dm.getHighGamma( ), 0, 100, 0, 350 ) );
        tm.setTweenEndValue( 3, map( dm.getHighBeta( ), 0, 100, 0, 350 ) );
        tm.setTweenEndValue( 4, map( dm.getDelta( ), 0, 100, 0, 350 ) );
        
        cm.setMessageText( "Record " + actualRecord + " of " + dm.getRecordsCount( ) );        
      }
    } else if( cm.getModus( ) == ControlsManager.CONST_MODUS_LIVE ){
      if( mc.isRunning( ) ){
        addRecord2Dataset();
        
        actualRecord = dm.loadLastRecord();
        
        println("Record " + actualRecord + " of " + dm.getRecordsCount( ));
        
        tm.setTweenEndValue( 0, map( dm.getTheta( ), 0, 100, 0, 350 ) );
        tm.setTweenEndValue( 1, map( dm.getHighAlpha( ), 0, 100, 0, 350 ) );
        tm.setTweenEndValue( 2, map( dm.getHighGamma( ), 0, 100, 0, 350 ) );
        tm.setTweenEndValue( 3, map( dm.getHighBeta( ), 0, 100, 0, 350 ) );
        tm.setTweenEndValue( 4, map( dm.getDelta( ), 0, 100, 0, 350 ) );
      } else {
        cm.setMessageText( "No Mindwave connection" );
      }
    }
    
    lastUpdate = millis( );
  }
  
  tm.update( );
  
  pm.update( tm );
  render.render( pm );
}

void addRecord2Dataset(){
  dm.addRecord( getDateTimeString(),
    mc.getAttention( ),
    mc.getMeditation( ),
    mc.getDelta( ),
    mc.getTheta( ),
    mc.getLowAlpha( ),
    mc.getHighAlpha( ),
    mc.getLowBeta( ),
    mc.getHighBeta( ),
    mc.getLowGamma( ),
    mc.getMidGamma( ),
    mc.getBlinkStrength( ),
    mc.getSignal( ) );
}

String getDateTimeString( ){
  String dateTimeString = year( ) + "." 
      + nf( month( ), 2 ) + "." 
      + nf( day( ), 2 ) + " " 
      + nf( hour( ), 2 ) + ":" 
      + nf( minute( ), 2 ) + ":" 
      + nf( second( ), 2 ) + "." 
      + nf( millis( ), 3 );
  
  return dateTimeString;
}

void onLoadFileButton( String FileName ){
  if( FileName != "" ){
    dm.loadData( FileName );
    tm.reset( );
  }
}

void poorSignalEvent( int Signal ) {
  mc.poorSignalEvent( Signal );
}

void attentionEvent( int Attention_Level ) {
  mc.attentionEvent( Attention_Level );
}  

void meditationEvent( int Meditation_Level ) {
  mc.meditationEvent( Meditation_Level );
}

void blinkEvent( int Blink_Strength ) {
  mc.blinkEvent( Blink_Strength );
}

void eegEvent( int Delta, int Theta, int Low_Alpha, int High_Alpha, int Low_Beta, int High_Beta, int Low_Gamma, int Mid_Gamma ) {
  mc.eegEvent( Delta, Theta, Low_Alpha, High_Alpha, Low_Beta, High_Beta, Low_Gamma, Mid_Gamma );
}

void rawEvent( int[ ] raw ) {
  mc.rawEvent( raw );
}

void stop( ) {
  mc.stop( );
  super.stop( );
}
