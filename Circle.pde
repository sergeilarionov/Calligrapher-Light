
class Circle extends Shape {

  float size;
  float offset = 0.01;
  float maxSize = 100;

  Circle(int index_, int x_, int y_, int w_, int h_) {
    super(index_, x_, y_, w_, h_);
    size = w;
  }
  void display() {
    
    ellipseMode(CENTER);
    stroke(0);
    ellipse(x, y, size * scale, size * scale);
  }
  void animate() {    
    offset = offset + .01;
    size= noise(offset) * maxSize;
  }
}
