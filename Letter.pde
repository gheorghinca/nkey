class Letter {

  int id; // based on this id we split the array in two and we increase and calculate the new centerPoints for each
  Point centerPoint, leftPoint, rightPoint;
  int noBigLetterNear=2;
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
    
    
    increaseDiameter(rightPoint, true);
    increaseDiameter(leftPoint, false);
       
    
    fill(255, 239, 0);
    textSize(25);
    textAlign(CENTER, CENTER);
    text(text, centerPoint.x, centerPoint.y);
  }
  
  
  Point increaseDiameter(Point p1, boolean isClockwise){
    Point p2 = p1;
    if (isClockwise){
      for (int i = 0; i<= noBigLetterNear; i++){
        Letter let = rightLetters[i];
        calculatePoints(p2, let, isClockwise);
        p2 = let.rightPoint;
      }
    }else{
      for (int i = 0; i<= noBigLetterNear; i++){
        Letter let = leftLetters[i];
        calculatePoints(p2, let, isClockwise);
        p2 = let.leftLetter;
      }
    }
  
  }
  
   
  
  // http://keisan.casio.com/exec/system/1273850202
  void calculatePoints(Point p1, Letter letter, boolean isClockwise){
    
    float diam = letter.currentDiameter/2;
    
    float angle = atan((2* sqrt(r - (diam*diam)/4))/diam);
    
    float distance = r*angle;
    
    Point center = getOtherPoint(p1, distance, isClockwise);
    letter.centerPoint = center;
    
    if (isClockwise){
      letter.leftPoint = p1;
      letter.rightPoint = getOtherPoint(center, distance, isClockwise);
    }else {
      letter.rightPoint = p1;
      letter.leftPoint = getOtherPoint(center, distance, isClockwise);
    }
    
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

