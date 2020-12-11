
class Rectangle extends Shape {

  float xoff;
  float offset = 0.01;
  float maxOffset = 200;

  Rectangle(int index_, int x_, int y_, int w_, int h_) {
    super(index_, x_, y_, w_, h_);
  }
  void display () {
    rectMode(CENTER);
    stroke(0);
    rect(x + xoff, y, w * scale, h * scale);
  }
  void animate() {    
    offset = offset + .01;
    xoff= noise(offset) * maxOffset;
  }
}
