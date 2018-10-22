class Bullet {
  // global variables
  float x;
  float y;
  float dy;
  
  
  // constructor
  Bullet(float x, float y) {
    this.x = x;
    this.y= y;
    dy = 0;
  }
  
  void update(){
    dy = 10;
  }
  
  void show(){
    y -= dy;
    stroke(255,0,0);
    line(x,y,x,y-10);
  }
}
