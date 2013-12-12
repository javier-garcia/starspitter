import geomerative.*;

class ShapesManager{
  RShape background;
  RShape[] sectors;
  RShape centerShape;
  RShape template;
  RShape outline;
  RShape lines;  
  
  ShapesManager(PApplet TheContext, String SVGFile){
    RG.init(TheContext);
    
    RShape s = RG.loadShape(SVGFile);
    
    background = s.getChild("background");
  
    sectors = new RShape[5];
    sectors[0] = s.getChild("sector0");
    sectors[1] = s.getChild("sector1");
    sectors[2] = s.getChild("sector2");
    sectors[3] = s.getChild("sector3");
    sectors[4] = s.getChild("sector4");
    
    centerShape = s.getChild("center");
    
    template = s.getChild("template");
    
    outline = s.getChild("outline");
    
    lines = s.getChild("lines");
  }
 
 public RShape getBackground(){
   return background;
 }
 
 public RShape getTemplate(){
   return template;
 }
 
 public RShape getCenterShape(){
   return centerShape;
 }
 
 public RShape getLines(){
   return lines;
 }
 
 public RShape getOutline(){
   return outline;
 }
 
 public RShape getSectorShape( int SectorIndex ){
   return sectors[ SectorIndex ];
 }
}
