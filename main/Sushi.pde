// Nicole Ajoy

class Sushi {
  // Variables
  PImage img; // sushi image representation
  PVector pos, vel, acc; // physics data
  int size; // for collision detection
  int value; // positive to add points to total
  boolean isCut; // to display sushi cut in half
  
  // Constructor
  Sushi() {
    String randomImgNum = String.valueOf((int)random(1,4));
    img = loadImage("image_sushi" + randomImgNum + ".png");
    pos = new PVector(0,50);
    vel = new PVector(random(5,10), random(-30,-20));
    acc = new PVector(0,9.81);
    size = 20;
    value = 10;
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
  
  // Display sushi
  void display() {
    image(img, pos.x*10, pos.y*10);
  }
}
