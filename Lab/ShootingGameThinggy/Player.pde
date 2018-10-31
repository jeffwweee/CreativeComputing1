class Player {
  // class variables
  PVector ship;                    // position of the ship
  int sh; 
  int sw;                  // the ship's height clearance

  Player( int h, int w ) {
    ship = new PVector( floor( w/2 ), floor( 3.5*h/4 ) );
    sw = 30;
    sh = 15;
  }

  // adds a new bullet into the arraylist everytime shoot is invoked
  void shoot() {
    Bullet b = new Bullet(ship.x, ship.y, -10);
    bullets.add(b);
  }

  // check if hit by enemy
  boolean checkHit() {
    for ( int i = 0; i < enemies.size(); i++ ) {
      Enemy e = enemies.get(i);
      float distbtwn = dist(e.enemy.x, e.enemy.y, ship.x, ship.y);
      if (distbtwn < 15)
        return true;
    }
    return false;
  }

  // check if bullet hit
  boolean checkHitBullet() {
    for ( int i = 0; i < bullets.size(); i++ ) {
      Bullet b = bullets.get(i);
      float distbtwn = dist(b.bullet.x, b.bullet.y, ship.x, ship.y);
      if (distbtwn < 10 && b.dy > 0) {                                          
        bullets.remove(b);
        return true;
      }
    }
    return false;
  }

  void move() {
    // check if keypress == true, then check if the player is in the boundaries
    // of gsz and width-gsz. then it will allow the ship to move.
    if ( l )
      if ( ship.x > gsz)
        ship.x -= 15;
    if ( r )
      if ( ship.x < width-gsz )
        ship.x += 15;
  }

  // display the ship
  void show() {
    noFill();
    stroke(255);
    triangle(ship.x, ship.y, ship.x-sh, ship.y+sw, ship.x+sh, ship.y+sw);
  }
}
