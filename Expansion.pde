//this program draws shapes in random locations and expands their frames

import java.util.Random;

float x, y;
int startSize = 10;

void setup() {
  size(500, 500);
  frameRate(120);
  x = random(0+startSize, width-startSize);    //coordinates
  y = random(0+startSize, height-startSize);
}

void draw() {
  background(60, 0, 0);
  noFill();
  stroke(210, 210, 210);
  strokeWeight(5);
  
  
  makeCircles();
}

void makeCircles() {
  ellipse(x, y, startSize, startSize);        //make a circle in random location
  ellipse(x, y, startSize-20, startSize-20);  //smaller circles inside the circle
  ellipse(x, y, startSize-60, startSize-60);
  
  startSize += 5;    //make the circles expand
}