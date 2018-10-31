/*
* Random firework thinggy.
 * Idea from Daniel Shiffman, the Coding Train on Youtube. 
 * Originally a p5.js code
 * Link to video       : https://goo.gl/hfNdTR
 * Tutorial on forces  : https://goo.gl/3i5Ynm
 * Example on forces   : https://goo.gl/4j6ff1
 */

ArrayList<Firework> fireworks;
PVector gravity;

void setup() {
  size(800, 600);
  //sketchFullScreen();
  //fullScreen();
  colorMode(HSB);
  gravity = new PVector(0, 0.2);
  fireworks = new ArrayList<Firework>();
  smooth();
  background(0);
}

void draw() {
  fill(0, 0, 0, 25);
  noStroke();
  rect(-1, -1, width, height);

  // a loop to create ellipse for star like effect
  for (int i = 50; i< 500; i += random(10000, 100000)) {
    fill(255);
    ellipse(random(width), random(height), 3, 3);
  }

  // 10% chance of making a firework
  if (random(1) < 0.1) {
    fireworks.add(new Firework());
  }

  for (int i = fireworks.size()-1; i >=0; i--) {
    Firework f = fireworks.get(i);
    f.update();
    f.show();
    if (f.done()) {
      fireworks.remove(i--);
    }
  }
}
