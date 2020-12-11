
class Line extends Shape {
  
  float offset = 0.01;
  float endX, endY;
  float angle;
  
  Line(int index_, int x_, int y_, int w_, int h_) {
    super(index_, x_, y_, w_, h_);
    angle = noise(offset) * 360;
    endX = (w * cos(radians(angle)) + x);
    endY = (w * sin(radians(angle))+ y);
    offset = index_ * offset;
  }
  
  void display() {
    strokeWeight(1);
    stroke(0);
    smooth();
    line(x, y, endX * scale, endY * scale);
  }
  
  void animate() {    
    offset = offset + .01;
    angle= noise(offset) * 360;
    endX=(w * cos(radians(angle)) + x);
    endY=(w * sin(radians(angle))+ y);
  }
}
