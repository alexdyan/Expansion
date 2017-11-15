//this program draws shapes in random locations and expands their frames
//IMPLEMENT THE COORDINATES AS AN ARRAY

import java.util.Random;

float x, x1, x2, y ,y1 ,y2;
int diameter = 20;

void setup() {
  size(500, 500);
  frameRate(120);
  x = random(0, width);    //random coordinates for where
  x1 = random(0, width);   //the shapes will be drawn
  x2 = random(0, width);
  y = random(0, height);
  y1 = random(0, height);
  y2 = random(0, height);
  
}

void draw() {
  background(60, 0, 0);
  noFill();
  stroke(210, 210, 210);
  strokeWeight(5);
  
  makeCircles();
  makeTriangles();
}

void makeCircles() {
  ellipse(x, y, diameter, diameter);        //make a circle in random location
  ellipse(x, y, diameter-20, diameter-20);  //smaller circles inside the circle
  ellipse(x, y, diameter-60, diameter-60);
  diameter += 5;    //make the circles expand
}

void makeTriangles() {  //triangles don't expand (yet?)
  triangle(x, y, x1, y1, x2, y2);
  triangle(x-10, y-10, x1-10, y1-10, x2-10, y2-10);
  triangle(x+15, y+15, x1+15, y1+15, x2+15, y2+15);
  
}