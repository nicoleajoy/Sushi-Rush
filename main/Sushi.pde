// Nicole Ajoy

class Sushi {
  // Variables
  PImage img, imgCut; // sushi image representation
  PVector pos, vel, acc; // physics data
  int size; // for collision detection
  int value; // positive to add points to total
  boolean isCut; // to display sushi cut in half
  boolean isCounted; // prevent double points from being added
  
  // Constructor
  Sushi() {
    String randomImgNum = String.valueOf((int)random(1,7));
    img = loadImage("image_sushi" + randomImgNum + ".png");
    imgCut = loadImage("image_sushi" + randomImgNum + "_CUT.png");
    pos = new PVector(0, 50);
    vel = new PVector(random(5,10), random(-30, -20));
    acc = new PVector(0, 9.81);
    size = 20;
    value = 10;
    isCut = false;
    isCounted = false;
  }

  void checkCollision() {
    if (mousePressed) {
      boolean xCheck = pos.x*10 <= mouseX && mouseX <= pos.x*10+img.width;
      boolean yCheck = pos.y*10 <= mouseY && mouseY <= pos.y*10+img.height;
      if (xCheck && yCheck)
        isCut = true;
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
  
  // Display sushi
  void display() {
    if (!isCut) {
      image(img, pos.x*10, pos.y*10);
    }
    else {
      tint(255, 127); // half opacity
      image(imgCut, pos.x*10, pos.y*10);
      tint(255, 255); // full opacity
    }
  }
}
