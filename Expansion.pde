//This program draws 5 different shapes at random coordinates and
//expands them. When they reach a certain size the coordinates are reset.
//Executed when serial data is read in
//IMPLEMENT THE COORDINATES AS AN ARRAY

import processing.serial.*;
import java.util.Random;

Serial myPort;
int val = 1;

float x, x1, x2, x3, x4, x5, x6, x7, x8,
      y ,y1 ,y2, y3, y4, y5, y6, y7, y8;
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

  background(0);
  noFill();
  strokeWeight(5);
  
  if (val == 0) {    //if you press any of the buttons...
    makeCircles();
    makeTriangles();
    makeQuads();
    makeRectangles();
    makeOvals();
  }
  restart();
}

void makeCircles() {
  stroke(255, 255, 155);
  ellipse(x, y, diameter, diameter);          //make a circle in random location
  ellipse(x-10, y, diameter-20, diameter-20); //smaller circles inside the circle
  ellipse(x, y, diameter-60, diameter-60);
  diameter += 5;                              //make the circles expand
}

void makeTriangles() {
  stroke(155, 248, 255);
  triangle(x1, y1, x2, y2, x3, y3);                   //make a triangle
  triangle(x1-10, y1-10, x2-10, y2-10, x3-10, y3-10); //make slightly different ones
  triangle(x1+15, y1+15, x2+15, y2+15, x3+15, y3+15);
  y1-=3;                                              //make the triangles expand
  x2-=3; y2+=5;
  x3+=3;
}

void makeQuads() {
  stroke(157, 255, 155);
  quad(x4, y4, x5, y5, x6, y6, x7, y7);
  quad(x4+10, y4+10, x5+10, y5+10, x6+10, y6+10, x7+10, y7+10);
  quad(x4-25, y4-25, x5-25, y5-25, x6-25, y6-25, x7-25, y7-25);
  x4-=3;
  x5+=2; y5-=2;
  y6+=2;
  x7+=1; y7+=3;
}

void makeRectangles() {
  stroke(255, 155, 155);
  rect(x4, y4, wide, tall);        //make a rectangle
  rect(x4-20, y4-20, wide, tall);  //make slightly different ones
  rect(x4-50, y4-50, wide, tall);
  y4-=1;
  wide += 3;                       //make the rectangles expand
  tall += 2;
}

void makeOvals() {
  stroke(245, 155, 255);
  ellipse(x8, y8, tall, wide);           //make an oval
  ellipse(x8+25, y8, tall-15, wide+40);  //make slightly different ones
  ellipse(x8, y8-20, tall-20, wide+15);
  tall += 2;                             //make the ovals expand
  wide += 5;
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
  x6 = random(0+100, width-100);
  x7 = random(0+100, width-100);
  x8 = random(0+100, width-100);
  y = random(0+100, height-100);
  y1 = random(0+100, height-100);
  y2 = random(0+100, height-100);
  y3 = random(0+100, height-100);
  y4 = random(0+100, height-100);
  y5 = random(0+100, height-100);
  y6 = random(0+100, height-100);
  y7 = random(0+100, height-100);
  y8 = random(0+100, height-100);
  diameter = 10;
  wide = 25;
  tall = 10;
}