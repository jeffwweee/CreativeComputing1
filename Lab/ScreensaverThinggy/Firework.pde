class Firework {
  int hue = floor(random(255));  // using hsb colormode, random <255 will give RGB colors
  Particle firework;
  boolean exploded = false;
  ArrayList<Particle> particles = new ArrayList<Particle>();

  Firework() {
    firework = new Particle(random(width), height, hue, true);
  }

  boolean done() {
    if (exploded && particles.size() == 0)
      return true;
    else
      return false;
  }

  void update() {
    if (!exploded) {
      firework.applyForce(gravity);
      firework.update();
      if (firework.vel.y >= 0) {
        exploded = true;
        explode();
      }
    }

    for (int i = particles.size()-1; i >=0; i--) { 
      particles.get(i).applyForce(gravity);
      particles.get(i).update();
      if (particles.get(i).done()) {
        particles.remove(particles.get(i));          // removing the particles and fireworks will
      }                                              // free up ram lag the system
    }
  }

  void explode() {
    for (int i = 0; i < 100; i++) {
      Particle p = new Particle(this.firework.pos.x, 
        this.firework.pos.y, hue, false);
      particles.add(p);
    }
  }

  void show() {
    if (!exploded) {
      firework.show();
    }
    for (Particle p : particles) { 
      p.show();
    }
  }
}
