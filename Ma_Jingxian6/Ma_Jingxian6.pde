
class Button{
  int locX, locY;    
  int dimX, dimY; 
  int midX, midY; 
  color defaultColor   = color(244, 244, 244); 
  color frameColor     = color(177, 177, 177); 
  color selectColor    = color(255, 144, 0); 
  color highlightColor = color(200, 50, 60); 
  color textColor      = color(0, 0, 0); 
  boolean display      = true; 
  boolean active       = false; 
  String txtLabel;
  Button(int left, int top, int width, int height, String buttonText)  {
    locX = left;
    locY = top;
    dimX = width;
    dimY = height;
    midX = locX + width / 2;
    midY = locY + height/ 2;
   
  }

  void colorize(color bar, color select, color high, color textColor){
    defaultColor   = bar;
    selectColor    = select; 
    highlightColor = high;
  }


  void update(){
    active = (mouseX > locX) && (mouseX < (locX + dimX))
      && (mouseY > locY) && (mouseY < (locY + dimY));
    if (display){
      noLights();
      if (active && mousePressed)  fill(selectColor);
      else                         fill(defaultColor);
      if (active)  stroke(highlightColor);
      else         stroke(frameColor);
      rectMode(CORNER);
      rect(locX, locY, dimX, dimY);
    }
  }


  boolean mouseIsOver(){ 
    return active;
  }
  
  void show(){ 
    display = true;
  }

  void hide(){ 
    display = false;
  }
}
