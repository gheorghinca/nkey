class Ball {
  float x, y;
  int radius;
  boolean moving = false;
 
  Ball(float x, float y) {
    this.x = x;
    this.y = y;
    this.radius = 40;
  }

  void mousePressed() {
    moving = true;
  }

  void mouseReleased() {
    x = cx;
    y = cy;
    moving = false;
  }

  boolean mouseOver(int mx, int my) {
    return ((x - mx)*(x - mx) + (y - my)*(y - my)) <= radius*radius;
  }

  void move() {
    if (moving) {
      this.x = mouseX;
      this.y = mouseY;
    }
  }

  void draw() {
    if (moving) {
      fill(#ffff00);
    } else {
      fill(#0000ff);
    }
    ellipse(x, y, radius, radius);
  }
}
