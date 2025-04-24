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
  PVector wind = new PVector(0.1, 0);
  boolean applyWind = mousePressed && mouseButton == RIGHT;

  for (Ball b : ballList) {
    b.applyForce(gravity);
    if (applyWind) {
      b.applyForce(wind);
    }
    b.move();
    b.bounce();
    b.display();
  }
  
  fill(0);
  text(ballList.size(), 20, 40);
}
