class Letter {

  int id; // based on this id we split the array in two and we increase and calculate the new centerPoints for each
  Point centerPoint, leftPoint, rightPoint;
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
    centerPoint = new Point(angle);
    diameterLetter = TWO_PI*r / noLetters;
  }


  void drawInit() {

    fill(0);
    ellipse(centerPoint.x, centerPoint.y, diameterLetter, diameterLetter);
    fill(255, 239, 0);
    textSize(25);
    textAlign(CENTER, CENTER);
    text(text, centerPoint.x, centerPoint.y);
  }

  void drawBallMove() {
    
    currentDiameter = diameterLetter*distance;
    // calculate start and end points
    calculateStartEndPoints(currentDiameter, centerPoint);
    
    if (id == idCenter) {
      fill(255, 50, 50);
      ellipse(centerPoint.x, centerPoint.y, currentDiameter, currentDiameter);
    }
    
    
    // go to the right 
    for()
    
    // go to the left
    for()
    
    // split the remaining distance to the others letters
    
    
    
      
      
      // based on direction use getOthercenterPoint to aquire the center based on prev centerPoint
      // calculate diameter end centerPoints to right
      // calculate diameter and 
    
    
    
    fill(255, 239, 0);
    textSize(25);
    textAlign(CENTER, CENTER);
    text(text, centerPoint.x, centerPoint.y);
  }

  float calculateStartEndPoints(float diameterLetter, Point p1) {
    float hDistance = diameterLetter/2;
    leftPoint = getOtherPoint(p1, hDistance, true);
    rightPoint = getOtherPoint(p1, hDistance, false);

    return (float)dist(leftPoint.x, rightPoint.x, leftPoint.y, rightPoint.y);
  }

  Point getOtherPoint(Point p1, float distance, boolean isClockwise) {

    float angle = distance/r;

    float newAngle;
    if (isClockwise) {
      newAngle = p1.angle - angle;
    } else {
      newAngle = p1.angle + angle;
    }

    return new Point(newAngle);
  }
}

