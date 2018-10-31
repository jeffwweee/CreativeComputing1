class Bullet {
  // class varibles
  PVector bullet;              // position of the bullet
  float dy;                    // movement of the bullet

  Bullet(float x, float y, float vel) {
    bullet = new PVector( x, y );
    dy = vel;
  }

  void move() {
    bullet.y += dy;
    if ( bullet.y < 0 || bullet.y > height )     // if bullet hits bounds
      if (bullets.size() > 1)                    // then check if there is at least 1 bul
        bullets.remove( this );                  // it will be removed from the array
  }

  // showing the bullets 
  void show() {
    stroke( 255, 0, 0 );
    line( bullet.x, bullet.y, bullet.x, bullet.y-10);
  }
}
