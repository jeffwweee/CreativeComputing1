class Player {
  // global variables
  PVector ship;
  int dx; 
  int sh; 
  int sw;
  float x; 
  float y;


  // constructor
  Player(int w, int h) {
    ship = new PVector(floor(w/2), floor(3.5*h/4));
    x = ship.x;
    y = ship.y;
    sw = 30;
    sh = 15;
  }

  void move() {
    if (a)
      if (ship.x > gsz)
        ship.x -= gsz;
    if (d) 
      if (ship.x < width-gsz)
        ship.x += gsz;
  }

  void shoot() {
    Bullet b = new Bullet(ship.x, ship.y);
    bullets.add(b);
  }

  void show() {
    noFill();
    stroke(255);
    triangle(ship.x, ship.y, ship.x-sh, ship.y+sw, ship.x+sh, ship.y+sw);
  }
}
