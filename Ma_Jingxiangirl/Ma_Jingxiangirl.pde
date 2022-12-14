PImage img;

void setup(){
 size(630,800);
   colorMode(HSB,360,100,100,100);
  background(255);
   imageMode(CORNERS);
 img = loadImage("girl.jpeg");
   img.resize(600,1200);
  image(img, 0, 0, width, height);
  loadPixels();
}

void draw(){
  background(360);
  float maxSize=map(mouseX,0,width,20,50);
  float minStep=map(mouseY,0,height,10,20);
  for(int i=0; i<width; i+=minStep){
  for(int j=0; j<height; j+=minStep){
   color imgColor=img.get(i,j);
   float circleSize=map(brightness(imgColor),0,100,maxSize,0);
   noStroke();
   fill(imgColor);
  ellipse(i,j,circleSize,circleSize);
   }
 }
}
