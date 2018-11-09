/* Forces with PVectors */

ArrayList<Ball> balls;
PVector grav;

void setup() {
  size(512, 512);
  frameRate(30);
  background(0);
  balls = new ArrayList<Ball>();

  for (int i = 0; i < 20; i++) {
    balls.add(new Ball(floor(random(width)), floor(random(height)), random(20, 50)));
  }
}

void draw() {
  background(0);
  PVector wind = new PVector(noise(-2, 2), noise(-2, 2));
  for (Ball b : balls) {
    grav = new PVector (0, 0.1*b.size);
    b.applyForce(grav);
    PVector wind_ = wind.mult(b.size);
    //b.applyForce(wind_);
    b.display();
    b.update();
  }
}
