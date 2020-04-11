// Nicole Ajoy

class Sushi {
  // Variables
  PImage img; // sushi image representation
  PVector loc, vel, accel; // physics data
  int size; // for collision detection
  int value; // positive to add points to total
  boolean isCut; // to display sushi cut in half
  
  // Constructor
  Sushi(PVector l, PVector v, PVector a) {
    img = loadImage("image_sushi" + random(1,4) + ".png");
    loc = l;
    vel = v;
    accel = a;
    size = 20;
    value = 10;
    isCut = false;
  }
  
  // Update physics
  void update() {
    
  }
  
  // Display sushi
  void display() {
    
  }
}
