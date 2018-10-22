//grid size
int sz = 500;
int g = 10;
int gsz = sz/g;

Bullet bullet;
ArrayList<Bullet> bullets;

Player player;

ArrayList<Enemy> enemies;

boolean a; 
boolean d;
int w;

int num = 50;

void setup() {
  size(500, 500);
  w = 500;
  frameRate(20);
  
  player = new Player(w, w);
  
  bullets = new ArrayList<Bullet>();
  bullet = new Bullet(player.x, player.y);
  bullets.add(bullet);
  
  enemies = new ArrayList<Enemy>();
  //enemy = new Enemy();
  //enemies.add(enemy);
  
  initEnemy();
  
}

void initEnemy(){
  for(int i = 0; i<num; i++){
    float x = random(gsz, width-gsz);
    float y = random(gsz, height/2);
    Enemy e = new Enemy(x,y);
    enemies.add(e);
  }
}

void keyPressed() {
  if (key == 'a') 
    a = true;
  if (key == 'd')
    d = true;
  if (key == ' ')
    player.shoot();
}

void keyReleased() {
  if (key == 'a')
    a = false; 
  if (key == 'd')
    d = false;
}

void allBullets(){
  for(int i = 0; i<bullets.size(); i++){
    bullets.get(i).update();
    bullets.get(i).show();
  }
}

void allEnemies(){
  for(int i = 0; i<enemies.size(); i++){
    enemies.get(i).show();
    enemies.get(i).death();
  }
}

void draw() {
  background(0);
  player.show();
  player.move();
  
  allBullets();
  allEnemies();
  
}
