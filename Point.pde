class Point {

  float x;
  float y;
  float angle;

  Point(float angleP) {
    angle = normalizeAngle(angleP);
    x = cx + r*cos(angle);
    y = cy + r*sin(angle);
  }


  Point() {
  }
}
