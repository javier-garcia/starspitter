class TweenManager{
  PercentTween[ ] tweens;
  PercentTween bgTween;
  
  TweenManager( ){
    tweens = new PercentTween[ 5 ];
    
    for( int i = 0; i < 5; i++ ){
      tweens[ i ] = new PercentTween( );
    }
    
    bgTween = new PercentTween( );
  }
  
  public void update( ){
    for( int i = 0; i < 5; i++ ){
      tweens[ i ].update( millis( ) );
    }
    
    bgTween.update( millis( ) );
  }
  
  public float getTweenValue(int TweenIndex){
    return tweens[ TweenIndex ].getValue( );
  }
  
  public void reset( ){
    for( int i = 0; i < 5; i++ ){
      tweens[ i ].setEndValue( 0 );
    }
    
    bgTween.setEndValue( 0 );
  }
  
  public void setTweenEndValue( int TweenIndex, float EndValue ){
    tweens[ TweenIndex ].setEndValue( EndValue );
  }
  
  public void setBackgroundTweenEndValue( float EndValue ){
    bgTween.setEndValue( EndValue );
  }
  
  public float getBackgroundTweenValue( ){
    return bgTween.getValue( );
  }
}
