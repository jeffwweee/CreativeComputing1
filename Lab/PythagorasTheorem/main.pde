
float a, b;
float angle = 0;
float i = 0.01;

void setup() {
  size(400, 400);
  frameRate(20);
  a = width/3;
  b = 2*width/3;
}

void draw() {
  background(0);
  // triangle 1
  pushMatrix();
  translate(a, 0);
  rotate(angle);
  triangle (-a, 0, 0, 0, -a, b);
  popMatrix();

  // triange 2
  pushMatrix();
  translate(b, height);
  //rotate(-PI/2);
  rotate(-angle);
  triangle(0, 0, -b, 0, -b, -a);
  popMatrix();

  // triangle 3
  pushMatrix();
  translate(width, height);
  rotate(-PI);
  triangle(0, 0, a, 0, 0, b);
  popMatrix();

  // triangle 4
  pushMatrix();
  translate(width, 0);
  rotate(-3*PI/2);
  triangle(0, 0, a, 0, 0, b);
  popMatrix();

  angle -= i;

  if (angle < -(PI/2) || angle > 0) {
    i *= -1;
  }
}
