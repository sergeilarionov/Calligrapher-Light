/**********************************
Calligrapher
December 2020
**********************************

I. Draw
Mouse : Draw varous shapes with your mouse

II. Select Brushes
"1" : Line
"2" : Circle
"3" : Rectangle

III. Adjust Size
"l" : Larger
"s" : Smaller

IV. Export PDF
"r" : Record

**********************************/

import processing.pdf.*;

// Classes
Shape currentShape;
Shape newShape;

// Variables
ArrayList<Shape> shapes = new ArrayList();
color bgColor = color(255, 255, 255);
float startX, startY;
float shapeSpacing = 2;
String currentShapeID = "Line";
float scale = 1;
float scaleIncrement = .1;
int shapeIndex;
boolean record;

void setup () {
  size(1280, 720, P2D);
}

void draw () {

  if (record) {
    beginRecord(PDF, "export/frame-####.pdf");
  }
  background(bgColor);

  // Draw shapes
  for (int i = 0; i < shapes.size(); i++) {
    Shape myShape = shapes.get(i);
    myShape.animate();
    myShape.display();
  }
  if (record) {
    endRecord();
    record = false;
  }
}

void keyPressed() {

  // Controls
  switch(key) {
  case '1': // Line
    currentShapeID = "Line";
    break;
  case '2': // Circle
    currentShapeID = "Circle";
    break;
  case '3': // Rectangle
    currentShapeID = "Rectangle";
    break;
  case 'l':// Larger
    scale+=scaleIncrement;
    break;
  case 's':// Smaller
    scale-=scaleIncrement;
    break;
  case 'd':// Delete
    shapes = new ArrayList();
    break;
  case 'r':// Record
    record = true;
    break;
  }
}

void mouseDragged() {

  // Add shapes only if the mouse moved far enough
  float distance = dist(startX, startY, mouseX, mouseY);
  if (distance >= shapeSpacing) {
    addNewShape(currentShapeID);
    startX = mouseX;
    startY = mouseY;
  }
}

void addNewShape(String type_) {

  switch(type_) {
  case "Circle": 
    newShape = new Circle (shapeIndex, mouseX, mouseY, 20, 20);
    break;
  case "Rectangle": 
    newShape = new Rectangle (shapeIndex, mouseX, mouseY, 100, 10);
    break;
  case "Line": 
    newShape = new Line (shapeIndex, mouseX, mouseY, 100, 100);
    break;
  }

  shapes.add(newShape);
  shapeIndex++;
}
