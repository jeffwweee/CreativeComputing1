class Enemy {
  // class variables
  PVector enemy;                // pos of enemy
  float dx;                     // velocity
  float angle = 0;

  Enemy() {
  }

  Enemy(float x, float y) {
    enemy = new PVector( snapToGrid(x), snapToGrid(y) );
    dx = 5;
  }

  // adds a new bullet into the arraylist everytime shoot is invoked
  void shoot() {
    Bullet b = new Bullet(enemy.x, enemy.y, 5);
    bullets.add(b);
  }

  // gridding function
  float snapToGrid(float k) {
    float snap = 1.0/gsz;
    return round(k*snap)*gsz;
  }

  // check if bullet hit
  boolean checkHit() {
    for ( int i = 0; i < bullets.size(); i++ ) {
      Bullet b = bullets.get(i);
      float distbtwn = dist(b.bullet.x, b.bullet.y, enemy.x, enemy.y);
      if (distbtwn < 15 && b.dy < 0) {                                          
        bullets.remove(b);
        return true;
      }
    }
    return false;
  }

  // remove the enemies
  void deathByBullet() {
    enemies.remove(this);
  }

  // move the targets
  void move() {
    enemy.x += dx;
    if (enemy.x>width-gsz || enemy.x < gsz) {
      dx *= -1;
      enemy.y = enemy.y + gsz;
    }
  }

  void show() {
    fill(255);
    noStroke();
    pushMatrix();
    translate(enemy.x, enemy.y);
    rotate(angle);
    rect(-10, -10, 20, 20);
    popMatrix();
    move();
    angle += 0.05;
  }
}
