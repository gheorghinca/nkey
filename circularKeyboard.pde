
String letterText = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,r,s,t,u,v,x,y,z";
int noLetters, idCenter, dWidth, dHeight;
float initLetterAngleSize, maxAngleSize, minAngleSize;
int noOfBigLetters = 4;
float cx, cy, diameter, r;
String[] charText;
Letter centerLetter;
Letter[] letters;
Point p1, p2, p3;
Ball ball = null;


void setup() {
  
  dWidth = 600;
  dHeight = 600;
  // int dWidth= displayWidth;
  // int dHeight= displayHeight;
  
  size( dWidth, dHeight );
  background( 255 );
  smooth();
  // noStroke();
  size(dWidth, dHeight);
  cx = dWidth/2;
  cy = dHeight/2;
  diameter = dWidth-200;
  r = diameter/2;

  charText = new String[noLetters];
  charText = splitTokens(letterText, ",");
  noLetters = charText.length;
  letters = new Letter[noLetters];

  initLetterAngleSize = TWO_PI / noLetters;
  maxAngleSize = PI/4;
  minAngleSize = TWO_PI / (noLetters*2);

  // create letters
  for (int i = 0; i < noLetters; i++) {
    letters[i] = new Letter(i, charText[i], i*initLetterAngleSize );
  }
  
  ball = new Ball(cx, cy);
}


void draw() {

  noStroke();
  background( 255 );

  fill(50, 100, 150);
  arc(cx, cy, diameter, diameter, 0, TWO_PI);

  fill(50, 100, 0);
  ball.move();
  ball.draw();
  
  for (int i=0; i < noLetters; i++) { 
    if (ball.moving == false){   
      letters[i].drawInit();
    } else {
      calculateDiameter();
      letters[i].drawBallMove();
    }
  }
}

void calculateDiameter() {

  // distance from mouse to all letters 
  for (Letter let : letters) {
    float distanceToLetter = dist(let.centerPoint.x, let.centerPoint.y, mouseX, mouseY);
    if (distanceToLetter > diameter)
       distanceToLetter = diameter;
    let.distance = map(distanceToLetter, 0, diameter, 3, 0);
    //println(let.distance);
  }
  

  float maxDistance = 0;
  // detect closest letter to make sure we don't change the current posX, posY,
  for (Letter let : letters) {
    if (let.distance > maxDistance) {
      maxDistance = let.distance;
      centerLetter = let;
    }
  }

  // use idNumber to get the two arrays of Letters on the right and on the left of the element
  int halfLetters = (noLetters-1)/2;
  int noLettersLeft, noLettersRight;
  if (noLetters % 2 != 0) {
    noLettersLeft = halfLetters;
    noLettersRight = halfLetters;
  } else {
    noLettersLeft = halfLetters;
    noLettersRight = halfLetters+1;
  }

  int[] leftLetters = new int[noLettersLeft];
  int[] rightLetters = new int[noLettersRight];

  // add ids = for left and right
  idCenter = centerLetter.id;

  int iter = idCenter+1;
  int ii = 0;
  while (ii < noLettersRight) {
    if (iter > noLetters-1) {
      iter = 0;
    }
    rightLetters[ii] = iter;
    ii++;
    iter++;
  }

  iter = idCenter-1;
  int jj = 0;
  while (jj < noLettersLeft) {
    if (iter < 0) {
      iter = noLetters-1;
    }
    leftLetters[jj] = iter;
    jj++;
    iter--;
  }

  detectLetterCollision();

  for (int i=0; i<leftLetters.length; i++) {
  }
  for (int i=0; i<rightLetters.length; i++) {
  }
}

void detectLetterCollision(){
   // check collision
  for (int i=0; i < noLetters; i++) { 
    if ((dist(letters[i].centerPoint.x, letters[i].centerPoint.y, ball.x, ball.y) < (letters[i].currentDiameter/2)+(ball.radius/2)) && (letters[i].id == centerLetter.id)) {
      fill(0);
      textSize(25);
      textAlign(CENTER, CENTER);
      text(letters[i].text, 40, 40);
    }
  }
}

void mousePressed() {
  if (ball.mouseOver(mouseX, mouseY)) {
    ball.mousePressed();
  }
}

void mouseReleased() {
  ball.mouseReleased();
}


static float angleBetween(Point p1, Point p2) {
  return (float)Math.acos(p1.x*p2.x + p1.y*p2.y);
}

// Get any angle between 0 and 2*PI
static float normalizeAngle(float angle) {
  float na = angle % (TWO_PI);
  if (na < 0) 
    na = TWO_PI + na;
  return na;
}


Point getMidPoint(Point p1, Point p2) {
  float ang = asin(dist(p1.x, p1.y, p2.x, p2.y)/(2*r));
  float angle;
  if (abs(p1.angle - p2.angle) > PI) {
    angle = max(p1.angle, p2.angle) + ang;
  } else {
    angle = min(p1.angle, p2.angle) + ang;
  }
  Point returnPoint = new Point(angle);
  return returnPoint;
}











