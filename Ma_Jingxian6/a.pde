
boolean globalLock = false; 

class ScrollBar{
  int xpos, ypos;  
  int sbWidth, sbHeight; 
  float spos, newspos; 
  int smin, smax, sRange; 
  int loose = 8;  
  float vmin, vmax, vRange; 
  float initValue;
  boolean over = false; 
  boolean locked = false;
  color barColor       = color(244, 244, 244); 
  color frameOffColor  = color(177, 177, 177);
  color frameOnColor   = color(255, 144, 0); 
  color sliderOffColor = color(102, 102, 102); 
  color sliderOnColor  = color(200, 50, 60); 
  String tag;
  ScrollBar (int xp, int yp, int sWidth, int sHeight, float minValue, float maxValue, float startValue, String st){
    sbWidth = max(40, sWidth);
    sbHeight = max(8, sHeight);
    xpos = max(0, xp);
    ypos = max(0, yp - sbHeight/2);
    spos = xpos + sbWidth/2 - sbHeight/2;
    newspos = spos;
    smin = xpos;
    smax = xpos + sbWidth - sbHeight;
    sRange = smax - smin - 1;
    vmin = minValue;
    vmax = maxValue;
    vRange = vmax - vmin;
    tag = st;
    initValue = constrain (startValue, vmin, vmax);
    setValue (initValue);
  }

  void colorize (color bar, color frameOff, color frameOn, color sliderOff, color sliderOn){
    barColor = bar;
    frameOffColor = frameOff;
    frameOnColor = frameOn;
    sliderOffColor = sliderOff;
    sliderOnColor = sliderOn;
  }


  float update(){
    over = isMouseOver();
    if (!globalLock && mousePressed && over){ 
      locked = true;
      globalLock = true;
    }

    if (locked){ 
      newspos = constrain(mouseX-sbHeight/2, smin, smax);
      if (abs(newspos - spos) >= 0.1)
        spos = spos + (newspos - spos) / loose;
    }

    if (!mousePressed){ 
      locked = false;
      globalLock = false;
    }

    colorMode(RGB);
    fill (barColor);
    if (locked) stroke(frameOnColor);
    else        stroke(frameOffColor);
    rect(xpos, ypos, sbWidth, sbHeight); 
   
    if ((over && !globalLock)
      || locked) fill(sliderOnColor);
    else       fill(sliderOffColor);
    rect(spos, ypos, sbHeight, sbHeight); 
    fill(sliderOffColor);

    return value();
  }
  
  boolean isMouseOver(){ 
    return (mouseX > xpos && mouseX < xpos+sbWidth && mouseY > ypos && mouseY < ypos+sbHeight);
  }

  void setValue (float value){
    value = constrain (value, vmin, vmax);
    spos = smin + sRange * (value-vmin) / vRange;
    newspos = spos;
  }

  void resetValue(){ 
    setValue(initValue);
  }

  void randomize(){ 
    setValue (vmin + random(vRange));
  }

  int position(){ 
    return round(spos);
  }

  float value(){ 
    return vmin + vRange * (int(spos)-smin) / sRange;
  }
}
