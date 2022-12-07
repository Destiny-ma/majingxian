PImage img;

void setup() {
  size(600, 620);
  background(255);
  img = loadImage("niao.jpeg");
  img.resize(600,600);
  tint(168, 228, 243);
  image(img, 0, 0, width, height);
}
