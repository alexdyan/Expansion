//this program draws shapes in random locations and expands their frames
//IMPLEMENT THE COORDINATES AS AN ARRAY

import processing.serial.*;
import java.util.Random;

Serial myPort;
int val = 1;

float x, x1, x2, x3, x4, x5, y ,y1 ,y2, y3, y4, y5;
float diameter;
float wide;
float tall;

void setup() {
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);

  size(800, 800);
  frameRate(120);
  setCoordinates();
}

void draw() {
  if (myPort.available() > 0)
    val = myPort.read();
  
  background(60, 0, 0);
  noFill();
  stroke(210, 210, 210);
  strokeWeight(5);
  
  if (val == 0) {    //if you press any of the buttons...
    makeCircles();
    makeTriangles();
    makeRectangles();
    makeOvals();
  }
  restart();
}

void makeCircles() {
  ellipse(x, y, diameter, diameter);          //make a circle in random location
  ellipse(x-10, y, diameter-20, diameter-20); //smaller circles inside the circle
  ellipse(x, y, diameter-60, diameter-60);
  diameter += 5;                              //make the circles expand
}

void makeTriangles() {
  triangle(x1, y1, x2, y2, x3, y3);                   //make a triangle
  triangle(x1-10, y1-10, x2-10, y2-10, x3-10, y3-10); //make slightly different ones
  triangle(x1+15, y1+15, x2+15, y2+15, x3+15, y3+15);
  y1-=5;                                              //make the triangles expand
  x2-=5;
  x3+=5;
}

void makeRectangles() {
  rect(x4, y4, wide, tall);        //make a rectangle
  rect(x4-20, y4-20, wide, tall);  //make slightly different ones
  rect(x4-50, y4-50, wide, tall);
  wide += 5;                       //make the rectangles expand
  tall += 5;
}

void makeOvals() {
  ellipse(x5, y5, tall, wide);           //make an oval
  ellipse(x5+25, y5, tall-15, wide+40);  //make slightly different ones
  ellipse(x5, y5-20, tall-20, wide+15);
  tall += 2;                             //make the ovals expand
  wide += 6;
}

void restart() {
  if (diameter > width*2) {  //the shapes are off the screen,
    if (val == 0) {          //and the button is pressed
      setCoordinates();      //reset their coordinates
    }
  }
}

void setCoordinates() {
  x = random(0+100, width-100);    //random coordinates for the shapes
  x1 = random(0+100, width-100);
  x2 = random(0+100, width-100);
  x3 = random(0+100, width-100);
  x4 = random(0+100, width-100);
  x5 = random(0+100, width-100);
  y = random(0+100, height-100);
  y1 = random(0+100, height-100);
  y2 = random(0+100, height-100);
  y3 = random(0+100, height-100);
  y4 = random(0+100, height-100);
  y5 = random(0+100, height-100);
  diameter = 10;
  wide = 25;
  tall = 10;
}