ScrollBar sbar1,sbar2;

Button bt;
float eSize;
float eColor;

void setup() {
  size(600, 600);
  background(0);
  a();
}

void a() {
  sbar1 = new ScrollBar(11, 22, 200, 10, 0, 255, 160, "1");
  sbar1.setValue(161);
  sbar2 = new ScrollBar(11, 42, 200, 10, 0, 255, 160, "2");
  sbar2.setValue(161);
}

void draw(){
  background(0);
  eSize = sbar1.update();
  eColor = sbar2.update();
  fill(eColor);
   noStroke();
  rect(width/2+100, height/2+100, eSize, eSize);
  fill(eColor-120);
   noStroke();
  rect(width/2-50, height/2-50, eSize-30, eSize-30);
  fill(eColor);
  noStroke();
  rect(150, 150, eSize-70, eSize-70);
  fill(eColor+120);
  noStroke();
  rect(230, 230, eSize-100, eSize-100);
   fill(eColor+50);
  noStroke();
  rect(70, 70, eSize-70, eSize-70);
}
