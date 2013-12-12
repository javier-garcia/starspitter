import controlP5.*;

class ControlsManager implements ControlListener{
  //CONSTANTS

  public static final int CONST_MODUS_LIVE = 0;
  public static final int CONST_MODUS_FILE = 1;
  
  //private variables
  ControlP5 cp5;
  RadioButton modusControl;
  Group liveControls;
  Group fileControls;
  Textfield fileInput;
  Textarea messageText;
  
  boolean fileLoaded;
  
  //constructor  
  ControlsManager(PApplet TheContext){
    cp5 = new ControlP5(TheContext);
    initControls( );
    
    fileControls.hide();
    
    cp5.addListener(this);
    
    fileLoaded = false;
  }
  
  //creates the controls
  private void initControls(){      
    modusControl = cp5.addRadioButton( "Modus" )
         .setPosition( 20, 20 )
         .setSize( 10,10 )
         .setColorForeground( color( 120 ))
         .setColorActive( color( 255 ) )
         .setColorLabel( color( 255 ) )
         .setItemsPerRow( 2 )
         .setSpacingColumn( 50 )
         .addItem( "Live", 0 )
         .addItem( "File", 1 )
         .setNoneSelectedAllowed( false )
         .activate( 0 );
    
    liveControls = cp5.addGroup( "Live Controls" )
        .setPosition( 20, 50 )
        .setSize( 220, 100 )
        .setBackgroundHeight( 100 )
        .setBackgroundColor( color( 255, 50 ) );
      
    cp5.addToggle( "Record" )
        .setPosition( 10, 10 )
        .setSize( 10, 10 )
        .setGroup( liveControls );

    cp5.addTextarea( "txt" )
        .setPosition( 10, 40 )
        .setSize( 200, 200 )
        .setFont( createFont( "arial", 10 ) )
        .setLineHeight( 14 )
        .setColor( color( 128 ) )
        .setText( "samples: 0" )
        .setGroup( liveControls );
        
    fileControls = cp5.addGroup( "File Controls" )
        .setPosition( 20, 50 )
        .setSize( 220, 100 )
        .setBackgroundHeight( 100 )
        .setBackgroundColor( color( 255, 50 ) );
        
    fileInput = cp5.addTextfield( "file" )
        .setPosition( 10, 20 )
        .setSize( 200, 20 )
        .setGroup( fileControls );

    fileInput.getCaptionLabel( )
      .style( )
      .marginTop = -35;
    
    cp5.addButton( "Load File" )
        .setValue( 0 )
        .setPosition( 10, 50 )
        .setSize( 200, 19 )
        .setGroup( fileControls );
        
    //Pause/Play, Next, Prev, First, Last, Average
    //File-Info
    
    messageText = cp5.addTextarea( "Message Text" )
        .setPosition( 20, 150 )
        .setSize( 200, 200 )
        .setFont( createFont( "arial", 10 ) )
        .setLineHeight( 14 )
        .setColor( color( 128 ) );
  }
  
  //controls events handler, inherited from ControlP5 ControlListener class
  void controlEvent( ControlEvent e ) {
    if( e.getName( ) == "Modus" ){
        modusControlHandler( e );
    }
    
    if( e.getName( ) == "Load File" ){
        //onLoadFileButton Method on "starspit.pde" file
        onLoadFileButton( fileInput.getText( ) );
    }
  }
  
  private void modusControlHandler( ControlEvent e ){
    switch( ( int )modusControl.getValue( ) ){
      case CONST_MODUS_LIVE:
        fileControls.hide( );
        liveControls.show( );
        break;
      case CONST_MODUS_FILE:
        liveControls.hide( );
        fileControls.show( );
        break;        
    }
  }
   
  public void setFileStatus( boolean FileStatus ){
    fileLoaded = FileStatus;
    if( !fileLoaded ){
      messageText.setText( "Select a file." );
    }
  }
  
  public void setMessageText( String Text ){
    messageText.setText( Text );
  }
  
  //getters
  public int getModus(){
    return ( ( int )modusControl.getValue( ) );
  }
}
