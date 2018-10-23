class Enemy {
  // class variables
  PVector enemy;                                                          // pos of enemy
  float dx;                                                               // velocity

  Enemy(float x, float y) {
    enemy = new PVector( snapToGrid(x), snapToGrid(y) );
    dx = 10;
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
      if (distbtwn < 15) {
        bullets.remove(b);
        return true;
      }
    }
    return false;
  }

  // remove the enemies and bullets
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
    ellipse(enemy.x, enemy.y, gsz*0.3, gsz*0.3);
    move();
  }
}
