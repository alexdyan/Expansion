//this program draws shapes in random locations and expands their frames

import java.util.Random;

float x, y;
int startSize = 10;
int startSize2 = 10;

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
  
  makeRings();
//  if (startSize > width/8) {
//    makeRings();
//  }
  
//  if (startSize > width/8) {
//    ellipse(x2, y2, startSize2, startSize2);
//    startSize2 += 5;
    //startSize = 10; this restarts the original circle
//  }
}

void makeRings() {
  ellipse(x, y, startSize, startSize);        //make a circle in random location
  ellipse(x, y, startSize-20, startSize-20);  //smaller rings inside the circle
  ellipse(x, y, startSize-60, startSize-60);
  
  startSize += 5;    //make the rings expand
}
/*
void reset() {
  //reset x and y to new random values and reset startSize, so you don't
  //need new variables every time
  x = random(0+startSize, width-startSize);
  y = random(0+startSize, height-startSize);
  startSize = 10;
}*/