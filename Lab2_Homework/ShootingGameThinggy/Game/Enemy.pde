class Enemy {
  // global variables
  int x;
  int y;
  float dx;

  // constructor
  Enemy(float x, float y) {
    this.x = snapToGrid(x);
    this.y = snapToGrid(y);
    dx = 0.2*gsz;
  }

  int snapToGrid(float k) {
    float gszm1 = 1.0/gsz;
    return round(k*gszm1)*gsz;
  }

  void movement() {
    x += dx;
    if(x>width-gsz || x < gsz)
     dx *= -1;
  }

  void show() {
    fill(255);
    noStroke();
    ellipse(x, y, gsz*0.3, gsz*0.3);
    movement();
  }

  void death() {
    for(int i = 0; i< bullets.size(); i++){
      Bullet b_ = bullets.get(i);
      float distbtwn = dist(b_.x, b_.y, this.x, this.y );
      if(distbtwn < 15)
        enemies.remove(this);
        bullets.remove(b_);
    }
  }
}
