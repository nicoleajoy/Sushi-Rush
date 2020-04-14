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

  void checkCollision() {
    if (mousePressed) {
      boolean xCheck = pos.x*10 <= mouseX && mouseX <= pos.x*10+img.width;
      boolean yCheck = pos.y*10 <= mouseY && mouseY <= pos.y*10+img.height;
      if (xCheck && yCheck) {
        isCut = true;
      }
    }
  }
  
  // Update physics
  void update() {
    if (game.difficulty == "EASY") {
      float dt = 2.0/frameRate;
      pos.x += vel.x*dt + acc.x*dt*dt/2;
      pos.y += vel.y*dt + acc.y*dt*dt/2;
      vel.x += acc.x*dt;
      vel.y += acc.y*dt;
    }
    else if (game.difficulty == "HARD") {
      float dt = 3.0/frameRate;
      pos.x += vel.x*dt + acc.x*dt*dt/2;
      pos.y += vel.y*dt + acc.y*dt*dt/2;
      vel.x += acc.x*dt;
      vel.y += acc.y*dt;
    }
  }
  
  // Display bomb
  void display() {
    image(img, pos.x*10, pos.y*10);
  }
}
