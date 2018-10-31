/* Classic snake game 
 General: 
 1) UP/DOWN/LEFT/RIGHT to move the snake
 2) Snake will die when hit the bounds (Note to self: improve to appear at 
 same axis and continue)
 3) Snake will die when snake hit any of its own body
 4) Menu screens assessible using 'P', 'Q', keys in game. 
 
 Additions:
 1) game menus
 
 
 References:
 1) The Coding Train's Snake Game on JS:
 Link: https://editor.p5js.org/codingtrain/sketches/HkDVpSvDm */

/* General idea of the code 
 1) Game.pde is the main class, which consist of setup and draw
 2) Snake object to control the length of snake, death of snake, moevement of snake
 3) Food object to control the location of food
 -------------------------- to be implemented -----------------------------------------
 1) Menu object, allowing player to choose mode
 2) Game over object
 Maybe an object class is an overkill, probably doing it as a method
 --------------------------------------------------------------------------------------*/

// init grid
int w = 400; // size of window
int gl = 20; // num of grid
float gsz = w/gl; // grid size

// snake object and food object and menu object
Snake snake;
PVector food;
Menu menu;

// menu state
int state = 0;
final int MAIN_MENU = 0;
final int GAME = 1;
final int END_GAME = 2;
final int PAUSE = 3;
final int RESTART = 4;
final int QUIT = 5;
final int RETURNM = 6;

void setup() {
  size(400, 400);
  frameRate(8);
  menu = new Menu();
  snake = new Snake(w, w);
  foodLoc();

  reset();
}

// this will reset the snake to default. 
void reset() {
  snake = new Snake(w, w);
  foodLoc();
}

// food object
void foodLoc() {
  float snap = 1.0/gsz;
  float a = round((random(w-gsz))*snap)*gsz;
  float b = round((random(w-gsz))*snap)*gsz;
  food = new PVector(a, b);
}

void keyPressed() {
  // this will allow the snake to move according to the grid size specified at 400/40
  // switch statement
  switch(keyCode) {
  case UP   : 
    snake.dir(0, -(int)(gsz));
    break;
  case DOWN : 
    snake.dir(0, (int)(gsz));
    break;
  case LEFT : 
    snake.dir(-(int)(gsz), 0);
    break;
  case RIGHT: 
    snake.dir((int)(gsz), 0);
    break;
  }
}

// this contains the codes for the game. 
// use a calling method to keep switch statement simple
void game() {
  background(220);

  if (snake.eat(food)) {
    foodLoc();
  }

  snake.update();
  snake.show();

  if (snake.endGameWall() || snake.endGameSelf()) {
    state = 2;
  }

  noStroke();
  fill(255, 0, 0);
  rect(food.x, food.y, gsz, gsz);

  if (keyPressed == true) {
    if (key == 'q' || key == 'Q')
      state = 6;
    if (key == 'r' || key == 'R')
      state = 4;
  }
}

// main method
void draw() {
  switch(state) {
  case MAIN_MENU : // state = 0
    reset();
    menu.mainMenu();
    if (keyPressed == true) {
      if (key == 'q' || key == 'Q')
        state = 5;
      else
        state = 1;
    }
    break;
  case GAME      : // state = 1
    game();
    break;
  case END_GAME  : // state = 2
    menu.endGameMenu();
    if (keyPressed == true)
      state = 0;
    break;
  case RESTART   : // state = 4
    menu.restartMenu();
    if (keyPressed == true) {
      reset();
      state = 0;
    }
    break;
  case QUIT      : // state = 5
    menu.quitMenu();
    if (keyPressed == true) {
      if (key == 'y' || key == 'Y')
        exit();
      if (key == 'n' || key == 'N')
        state = 0;
    }
    break;
  case RETURNM   : // state = 6
    menu.returnToMenu();
    if (keyPressed == true) {
      if (key == 'y' || key == 'Y')
        state = 0;
      if (key == 'n' || key == 'N')
        state = 3;
    }
    break;
  }
}
