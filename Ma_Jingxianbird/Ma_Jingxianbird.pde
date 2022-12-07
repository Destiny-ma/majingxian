PImage img;

void steup(){
  size(600,600);
  colorMode(HSB,360,100,100,100);
 // imageMode(CORNERS);
  img=loadImage("niao.jpeg");
  img.resize(600,600);
  //img.filter(POSTERIZE, 4);
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

   image(img,0,0);
}
