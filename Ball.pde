class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  color c;
  float mass;

  Ball(float x, float y, float xVel, float yVel) {
    location = new PVector(x, y);
    velocity = new PVector(xVel, yVel);
    acceleration = new PVector(0, 0);
    c = color(random(255), random(255), random(255));
    mass = random(0.2, 2);
  }

  void move() {
    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);
    acceleration.mult(0); 
  }

  void bounce() {
    if (location.x < 0 || location.x > width) {
      velocity.x *= -1;
      location.x = constrain(location.x, 0, width);
    }
    if (location.y < 0 || location.y > height) {
      velocity.y *= -1;
      location.y = constrain(location.y, 0, height);
    }
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void display() {
    stroke(1);
    strokeWeight(2);
    fill(c);
    ellipse(location.x, location.y, 50 * mass, 50 * mass);
  }
}
