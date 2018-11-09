/* Ball object to demonstrate the addition and multiplication of vectors
   Velocity, forces, and accelation.*/
   
class Ball {
  PVector position;                      //  x, y postion of ball
  PVector velocity;                      //  dx, dy of ball
  PVector acceleration;                  //  acceleration of ball due to force
  float damping;                         //  a reduction of energy due to other forces
  float size;                            //  size of ball, also seen as mass
  
  Ball(float x, float y, float sz) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    damping = 0.98;
    size = sz;
  }
  
  //  This method will accumulate all the force to accelation
  void applyForce(PVector f) {
    acceleration.add(f);
  }
  
  //  This function will update the ball based on its acceleration
  void update() {
    velocity.add(acceleration);
    velocity.mult(damping);
    position.add(velocity);
    
    // check if hit left right boundaries 
    if (position.x < size/2) {
      velocity.x *= -damping;
      position.x = 0;
    }
    
    if (position.x > width) {
      velocity.x *= -damping;
      position.x = width;
    }
      
    // check if hit top bounds
    if (position.y < size/2)
      velocity.y *= -damping;
    
    if (position.y > height) {
      velocity.y *= -damping;
      position.y = height;
    }
    
    // Since we’re adding all the forces together at any given moment, 
    // we have to make sure that we clear acceleration (i.e. set it to zero) 
    // before each time update() is called.
    acceleration.mult(0);
  }
  
  //  This function displays the ball
  void display() {
    fill(255);
    ellipse(position.x, position.y, size, size);
  }
}
