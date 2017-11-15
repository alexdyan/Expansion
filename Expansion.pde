//this program draws shapes in random locations and expands their frames
//IMPLEMENT THE COORDINATES AS AN ARRAY

import java.util.Random;

float x, x1, x2, x3, x4, y ,y1 ,y2, y3, y4;
float diameter = 20;
float rectWidth = 40;
float rectHeight = 20;

void setup() {
  size(500, 500);
  frameRate(120);
  x = random(0+100, width-100);    //random coordinates for triangles
  x1 = random(0+100, width-100);
  x2 = random(0+100, width-100);
  y = random(0+100, height-100);
  y1 = random(0+100, height-100);
  y2 = random(0+100, height-100);
  
}

void draw() {
  background(60, 0, 0);
  noFill();
  stroke(210, 210, 210);
  strokeWeight(5);
  
  //if you press button1
  makeCircles();
  //if you press button2
  makeTriangles();
  //if you press button3
  makeRectangles();
}

void makeCircles() {
  ellipse(x, y, diameter, diameter);        //make a circle in random location
  ellipse(x, y, diameter-20, diameter-20);  //smaller circles inside the circle
  ellipse(x, y, diameter-60, diameter-60);
  diameter += 5;    //make the circles expand
}

void makeTriangles() {
  triangle(x1, y1, x2, y2, x3, y3);                   //make a triangle
  triangle(x1-10, y1-10, x2-10, y2-10, x3-10, y3-10); //make slightly different ones
  triangle(x1+15, y1+15, x2+15, y2+15, x3+15, y3+15);
  y1-=5;          //make the triangles expand
  x2-=5;
  x3+=5;
  
}

void makeRectangles() {
  rect(x4, y4, rectWidth, rectHeight);        //make a rectangle
  rect(x4-20, y4-20, rectWidth, rectHeight);  //now make slightly different ones
  rect(x4-50, y4-50, rectWidth, rectHeight);
  rectWidth += 5;      //make the rectangles expand
  rectHeight += 5;
}