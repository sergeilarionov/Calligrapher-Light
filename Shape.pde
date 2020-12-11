
class Shape {
  
  float x, y, w, h;
  
  Shape (int index_, int x_, int y_, int w_, int h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }
  void position(float x_, float y_) {
    x = x_;
    y = y_;
  }
  void animate() {
    // Gets overridden by subclasses
  }
  void display() {
    // Gets overridden by subclasses
  }
}
