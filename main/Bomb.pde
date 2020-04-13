// Nicole Ajoy

class Bomb {
  // Variables
  PImage img; // bomb image representation
  PVector pos, vel, acc; // phsyics data
  int radius; // for collision detection
  int value; // negative to deduct points from total
  boolean isCut; // to display game-over screen
  
  // Constructor
  Bomb() {
    img = loadImage("image_bomb.png");
    pos = new PVector(0, 50);
    vel = new PVector(random(5, 10), random(-30, -20));
    acc = new PVector(0, 9.81);
    radius = 20;
    value = -5;
    isCut = false;
  }
  
  // Update physics
  void update() {
    float dt = 1.0/frameRate;
    pos.x += vel.x*dt + acc.x*dt*dt/2;
    pos.y += vel.y*dt + acc.y*dt*dt/2;
    vel.x += acc.x*dt;
    vel.y += acc.y*dt;
  }
  
  // Display bomb
  void display() {
    image(img, pos.x*10, pos.y*10);
  }
}
