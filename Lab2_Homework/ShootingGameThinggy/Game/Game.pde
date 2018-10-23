/*///////////////////////////////////// INTRO ///////////////////////////////////////
 
 Simple Shooting game: the simple idea behind space invaders.
 
 https://processingtutorials.wordpress.com/2013/05/30/space-invaders-code-2/
 There are other codes online that are better than this ^. Just Google it or 
 YouTube it
 
 This simple game only have simple rules: (As of now)
 1) You can only move left and right
 2) You can only shoot at the targets
 3) You win after shooting all the targets
 
 Updates:
 1) enemies will move forward everytime they bounce off the walls. Once they hit you
    game over.
 2) Game ends when all enemies are cleared
 
 Later itereations (to be implemented)
 - the enemy will be able to shoot at you randomly. Once you're hit,
 your life will drop. 
 - Countdown timer, once 0, game over.
 - Levels and clearance. You will be able to proceed to next level after clearing all
 the enemies. Enemies will increase and time will +20s every time clear.
 
 ///////////////////////////////////////////////////////////////////////////////////*/


// declaring grids
int sz = 500;
int g = 10;
int gsz = sz/g;

// declaring objects
ArrayList<Bullet> bullets;     // an array of bullets. 
ArrayList<Enemy> enemies;      // an array of enemies
Player player;                 // the player's ship object

// other variables
boolean r;                     // bool for key a
boolean l;                     // bool for key d

int num = 10;                  // number of enemies

void setup() {
  size(500, 500);
  frameRate(20);

  // initializing objects
  player = new Player(sz, sz);
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();

  initEnemy();
}

// initializes enemy with the number specified. 
void initEnemy() {
  for ( int i = 0; i < num; i++ ) {
    float x = random(gsz, width-gsz);
    float y = random(gsz, height/2);
    Enemy e = new Enemy(x, y);
    enemies.add(e);
  }
}

// Checking for keyPress, returns true if pressed
// can just do a switch statement for key, it should work the same way
void keyPressed() {
  if ( keyCode == RIGHT)              // checks if keypressed is right arrow
    r = true;
  if ( keyCode == LEFT )              // checks if keypressed is left arrow
    l = true;
  if ( key == ' ' )
    player.shoot();                  // adds into bullets into al, then shoots out line
}

void keyReleased() {
  if ( keyCode == RIGHT )
    r = false;
  if ( keyCode == LEFT )
    l = false;
}

// this method generates bullets
void allEmShots() {
  for ( int i = 0; i < bullets.size(); i++ ) {
    bullets.get(i).move();
    bullets.get(i).show();
  }
}

void allEmEnemies() {
  for ( int i = 0; i < enemies.size(); i++ ) {
    Enemy e = enemies.get(i);
    e.show();
    if(e.checkHit())
      e.deathByBullet();
  }
}

// Main method
void draw() {
  background(0);
  player.show();
  player.move();

  if ( player.checkHit() ) {
    fill( 255, 0, 0);
    rect( 0, 0, width, height );
    noLoop();
  }

  allEmShots();
  allEmEnemies();
  
  if( enemies.size() == 0 ){
    fill( 255, 0, 0 );
    rect( 0, 0, width, height );
    noLoop();
  }
}
