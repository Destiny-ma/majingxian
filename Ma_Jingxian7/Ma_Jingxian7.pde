import geomerative.*;

RFont f;
RShape grp;
RPoint[] points;

void setup(){
  size(630,891);
  frameRate(60);
  background(255);
  fill(134,151,96);
  noStroke();
  RG.init(this);
  grp = RG.getText("DESTINY", "sjtu2022-ma-jing-xian.ttf", 120, CENTER);
}

void draw(){
  background(255);  
  translate(width/2, 3*height/4); 
  noFill();
  stroke(0,0,200,150);
  RG.setPolygonizer(RG.ADAPTATIVE);
  grp.draw();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));
  points = grp.getPoints();
  if(points != null){
    noFill();
    stroke(162,96,87);
    beginShape();
    for(int i=0; i<points.length; i++){
      vertex(points[i].x, points[i].y);
    }
    endShape();
  
    fill(236,209,137);
    noStroke();
    for(int i=0; i<points.length; i++){
      ellipse(points[i].x, points[i].y,10,10);  
    }
  }
}
