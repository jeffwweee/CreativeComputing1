/*Snake object
 This class will control the movement and the creation of the snake and its body*/

class Snake {
  ArrayList<PVector> body = new ArrayList<PVector>();
  int len;
  int dy;
  int dx;

  // constructor method
  Snake(int w, int h) {
    body.add(new PVector(floor(w/2), floor(h/2)));
    len = 0;
    dy = 0;
    dx = 0;
  }

  // this method will allow the snake to change its direction
  // it will first check if the snake is at 1 block, if it is, 
  // the snake will be able to move left when its moving right, 
  // move up when its moving down.
  // otherwise, the direction will be locked, instead of ending 
  // the game as seen on reference
  void dir(int x, int y) {
    if (body.size()!=1) { 
      if (dx != -x || dy!= -y) {
        dx = x;
        dy = y;
      }
    } else { 
      dx = x;
      dy = y;
    }
  }

  // check endGame
  boolean endGameWall() {
    PVector head = myCopy(body.get(body.size()-1));
    // hits border
    if (head.x>width-1 || head.y>height-1 || head.x<0 || head.y<0)
      return true;
    return false;
  }

  boolean endGameSelf() {
    PVector head = myCopy(body.get(body.size()-1));
    // or it hits himself
    for (int i = 2; i < body.size() - 1; i++) {
      PVector part = body.get(i);
      if (part.x == head.x && part.y == head.y)
        return true;
    }
    return false;
  }

  // this method will check if the snake has eaten the food
  boolean eat(PVector food) {
    float x = body.get(body.size()-1).x;
    float y = body.get(body.size()-1).y;
    if (x == food.x && y == food.y) {
      grow();
      return true;
    } else
      return false;
  }

  // this method will create a new object for the arraylist after eating the food
  void grow() {
    len++;
    PVector head = myCopy(body.get(body.size()-1));
    body.add(head);
  }

  // refreshes new coordinates for the snake
  void update() {
    PVector head = myCopy(body.get(body.size()-1));
    body.remove(0);
    head.x += dx;
    head.y += dy;
    body.add(head);
    //body.get(0).x += dx;
    //body.get(0).y += dy;
  }
  // copy method for 3 and below
  // copy the 1st guy of the snake, return as a PVector to be stored
  // as another part of the snake
  PVector myCopy(PVector o) {
    PVector c = new PVector(o.x, o.y);
    return c;
  }
  // displaying the snake
  void show() {
    for (int i = 0; i<= len; i++) {
      fill(0);
      stroke(255);
      rect(body.get(i).x, body.get(i).y, gsz, gsz);
    }
  }
}
