ArrayList<Ball> ballList;

void setup() {
  size(1000, 800);
  ballList = new ArrayList<Ball>();
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    float x = mouseX;
    float y = height / 2;
    float xVel = 0;
    float yVel = 2;
    ballList.add(new Ball(x, y, xVel, yVel));
  }
}

void draw() {
  background(173, 216, 230);
  PVector gravity = new PVector(0, 0.1);
  boolean applyWind = mousePressed && mouseButton == RIGHT;
  PVector wind = null;
  if (applyWind) {
    float windAngle = random(TWO_PI);
    float windStrength = random(0.5, 0.15);
    wind = PVector.fromAngle(windAngle).mult(windStrength);
  }
  for (Ball b : ballList) {
    b.applyForce(gravity);
    if (wind != null) {
      b.applyForce(wind);
    }
    b.move();
    b.bounce();
    b.display();
  }
  
  fill(0);
  text(ballList.size(), 20, 40);
}
