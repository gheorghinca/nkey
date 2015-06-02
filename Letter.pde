class Letter {

  int id; // based on this id we split the array in two and we increase and calculate the new points for each
  Point point;
  float distance;
  float diameterLetter;
  float currentDiameter;
  String text;
  int col;
  float arcSegment;


  Letter(int id1, String textLetter, float angle) {
    id = id1;
    text = textLetter;
    col = 10*id;
    point = new Point(angle);
    diameterLetter = TWO_PI*r / noLetters;
  }


  void drawInit() {

    fill(0);
    ellipse(point.x, point.y, diameterLetter, diameterLetter);
    fill(255, 239, 0);
    textSize(25);
    textAlign(CENTER, CENTER);
    text(text, point.x, point.y);
  }

  void drawBallMove() {
    currentDiameter = diameterLetter*distance;
    if (id == idCenter) {
      fill(255, 50, 50);
      ellipse(point.x, point.y, diameterLetter*distance, diameterLetter*distance);
      
      // get the start and end point.
      // based on direction use getOtherPoint to aquire the center based on prev point
      // calculate diameter end points to right
      // calculate diameter and 
    }
    fill(255, 239, 0);
    textSize(25);
    textAlign(CENTER, CENTER);
    text(text, point.x, point.y);
  }

  float calculateDiameter(float diameterLetter, Point p1) {
    float hDistance = diameterLetter/2;
    Point leftPoint = getOtherPoint(p1, hDistance, true);
    Point rightPoint = getOtherPoint(p1, hDistance, false);

    return (float)dist(leftPoint.x, rightPoint.x, leftPoint.y, rightPoint.y);
  }

  Point getOtherPoint(Point p1, float distance, boolean isPositive) {

    float angle = distance/r;
    Point secondPoint;
    float newAngle;
    if (isPositive) {
      newAngle = p1.angle - angle;
    } else {
      newAngle = p1.angle + angle;
    }

    return new Point(newAngle);
  }
}

