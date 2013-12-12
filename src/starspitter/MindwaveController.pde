import neurosky.*;
import java.net.*;

class MindwaveController extends PApplet{
  int meditation,
    attention,
    blink_strength,
    signal;

  float delta,
    theta,
    low_alpha,
    high_alpha,
    low_beta,
    high_beta,
    low_gamma,
    mid_gamma;
   
  ThinkGearSocket neuroSocket;
  
  boolean running;
    
  MindwaveController( PApplet TheContext ){
    neuroSocket = new ThinkGearSocket( TheContext );
    
    running = false;
    
    try {
      neuroSocket.start( );
      running = true;
    }
    catch ( Exception e ) {
      //e.printStackTrace( );
    }
  }
  
  public boolean isRunning( ){
    return running;
  }
  
  public int getAttention( ){
    return attention;
  }
  
  public int getBlinkStrength( ){
    return blink_strength;
  }
  
  public int getMeditation( ){
    return meditation;
  }
  
  public int getSignal( ){
    return signal;
  }
  
  public float getDelta( ){
    return delta;
  }
  
  public float getTheta( ){
    return theta;
  }
  
  public float getLowAlpha( ){
    return low_alpha;
  }
  
  public float getHighAlpha( ){
    return high_alpha;
  }
  
  public float getLowBeta( ){
    return low_beta;
  }
  
  public float getHighBeta( ){
    return high_beta;
  }
  
  public float getLowGamma( ){
    return low_gamma;
  }
  
  public float getMidGamma( ){
    return mid_gamma;
  }
  
  public void poorSignalEvent(int Signal) {
    signal = Signal;
  }
  
  public void attentionEvent(int Attention_Level) {
    attention = Attention_Level;
  }  
  
  public void meditationEvent(int Meditation_Level) {
    meditation = Meditation_Level;
  }
  
  public void blinkEvent(int Blink_Strength) {
    blink_strength = Blink_Strength;
  }
  
  public void eegEvent(int Delta, int Theta, int Low_Alpha, int High_Alpha, int Low_Beta, int High_Beta, int Low_Gamma, int Mid_Gamma) {
    delta = Delta;
    theta = Theta;
    low_alpha = Low_Alpha;
    high_alpha = High_Alpha;
    low_beta = Low_Beta;
    high_beta = High_Beta;
    low_gamma = Low_Gamma;
    mid_gamma = Mid_Gamma;
  }
  
  public void rawEvent(int[] raw) {
    //println("rawEvent Level: " + raw);
  }
  
  public void stop(){
    neuroSocket.stop();
  }
}
