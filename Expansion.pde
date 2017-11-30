//This program draws 5 different shapes at random coordinates and
//expands them. When they reach a certain size the coordinates are reset.
//Executed when serial data is read in

import processing.serial.*;
import java.util.Random;

Serial myPort;
int val = 0;

float[] x = new float[10];
float[] y = new float[10];
float diameter;
float wide;
float tall;
float size;

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
  
  if (val == 1) {
    makeCircles();
    makeOvals();
  }
  if (val == 2) makeTriangles();
  if (val == 3) makeQuads();
  if (val == 4) makeRectangles();
  restart();
}

void makeCircles() {    //make 3 slightly different circles
  stroke(255, 255, 155);
  ellipse(x[0], y[0], diameter, diameter);
  ellipse(x[0]-10, y[0], diameter-20, diameter-20);
  ellipse(x[0], y[0], diameter-60, diameter-60);
  diameter += 5;        //make the circles expand
}

void makeTriangles() {    //make 3 slightly different triangles
  stroke(155, 248, 255);
  triangle(x[1], y[1], x[2], y[2], x[3], y[3]);
  triangle(x[1]-10, y[1]-10, x[2]-10, y[2]-10, x[3]-10, y[3]-10);
  triangle(x[1]+15, y[1]+15, x[2]+15, y[2]+15, x[3]+15, y[3]+15);
  y[1]-=3;                //make the triangles expand
  x[2]-=3; y[2]+=5;
  x[3]+=3;
}

void makeQuads() {      //make 3 slightly different quad shapes
  stroke(157, 255, 155);
  quad(x[4], y[4], x[5], y[5], x[6], y[6], x[7], y[7]);
  quad(x[4]+10, y[4]+10, x[5]+10, y[5]+10, x[6]+10, y[6]+10, x[7]+10, y[7]+10);
  quad(x[4]-25, y[4]-25, x[5]-25, y[5]-25, x[6]-25, y[6]-25, x[7]-25, y[7]-25);
  x[4]-=3;              //make the quads expand
  x[5]+=2; y[5]-=2;
  x[6]+=1; y[6]+=1;
  x[7]-=2; y[7]+=3;
}

void makeRectangles() {  //make 3 slightly different rectangles
  stroke(255, 155, 155);
  rect(x[8], y[8], wide, tall);
  rect(x[8]-20, y[8]-20, wide, tall);
  rect(x[8]-50, y[8]-50, wide, tall);
  x[8]-=2;               //make the rectangles expand
  y[8]-=1;
  wide += 2;
  tall += 1;
}

void makeOvals() {    //make 3 slightly different ovals
  stroke(245, 155, 255);
  ellipse(x[9], y[9], tall, wide);
  ellipse(x[9]+25, y[9], tall-15, wide+40);
  ellipse(x[9], y[9]-20, tall-20, wide+15);
  tall += 2;          //make the ovals expand
  wide += 5;
}

void restart() {
  for (int i = 0; i < x.length-1; i++) {
    size = x[i+1] - x[i];
    
    if (size > width || diameter > width || wide > width) {
      if (val != 0)          //if the shapes are big enough and a sensor
        setCoordinates();    //is hit, reset the coordinates
    }
  }
}

void setCoordinates() {
  for (int i = 0; i < x.length; i++) {   //fills array with x coordinates
    x[i] = random(0+100, width-100);
  }
  for (int j = 0; j < y.length; j++) {  //fills array with y coordinates
    y[j] = random(0+100, height-100);
  }
  diameter = 10;
  wide = 25;
  tall = 10;
}