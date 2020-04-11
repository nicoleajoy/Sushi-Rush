// Nicole Ajoy

class Bomb {
  // Variables
  PImage img; // bomb image representation
  PVector loc, vel, accel; // phsyics data
  int radius; // for collision detection
  int value; // negative to deduct points from total
  boolean isCut; // to display game-over screen
  
  // Constructor
  Bomb(PVector l, PVector v, PVector a) {
    img = loadImage("image_bomb.png");
    loc = l;
    vel = v;
    accel = a;
    radius = 20;
    value = -5;
    isCut = false;
  }
  
  // Update physics
  void update() {
    
  }
  
  // Display bomb
  void display() {
    
  }
}
