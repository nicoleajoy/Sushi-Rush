// Nicole Ajoy

/************************** POWERUP CLASS **************************/

class Powerup {
  // Variables
  PImage imgIce, imgStar; // powerup image representation
  boolean isIce, isStar; // determine which powerup
  PVector pos, vel, acc; // phsyics data
  boolean isCut; // what to display when cut
  boolean isCounted; // ensures is counted once

  // Constructor
  Powerup() {
    // Choose random powerup
    int i = (int)random(1, 3);
    if (i == 1) {
      isIce = true;
      isStar = false;
      imgIce = loadImage("image_ice.png");
    } 
    else if (i == 2) {
      isStar = true;
      isIce = false;
      imgStar = loadImage("image_star.png");
    }

    pos = new PVector(0, 50);
    vel = new PVector(random(5, 13), random(-30, -20));
    acc = new PVector(0, 9.81);
    isCut = false;
    isCounted = false;
  }

  // Check mouse collision
  void checkCollision() {
    if (mousePressed) {
      boolean xCheck = false;
      boolean yCheck = false;
      if (isIce) {
        xCheck = pos.x*10 <= mouseX && mouseX <= pos.x*10+imgIce.width;
        yCheck = pos.y*10 <= mouseY && mouseY <= pos.y*10+imgIce.height;
      } 
      else if (isStar) {
        xCheck = pos.x*10 <= mouseX && mouseX <= pos.x*10+imgStar.width;
        yCheck = pos.y*10 <= mouseY && mouseY <= pos.y*10+imgStar.height;
      }
      if (xCheck && yCheck)
        isCut = true;
        game.powerupTimer.update();
    }
  }

  // Update physics
  void update() {
    // If easy mode, keep things chill
    if (game.difficulty == "EASY") {
      float dt = 2.0/frameRate;
      pos.x += vel.x*dt + acc.x*dt*dt/2;
      pos.y += vel.y*dt + acc.y*dt*dt/2;
      vel.x += acc.x*dt;
      vel.y += acc.y*dt;
    }
    // If hard mode, increase speed of objects
    else if (game.difficulty == "HARD") {
      if (!game.powerupActive || game.powerupTimer.isDone()) {
        float dt = 3.75/frameRate;
        pos.x += vel.x*dt + acc.x*dt*dt/2;
        pos.y += vel.y*dt + acc.y*dt*dt/2;
        vel.x += acc.x*dt;
        vel.y += acc.y*dt;
      }
      else {
        float dt = 1.5/frameRate;
        pos.x += vel.x*dt + acc.x*dt*dt/2;
        pos.y += vel.y*dt + acc.y*dt*dt/2;
        vel.x += acc.x*dt;
        vel.y += acc.y*dt;
      }
    }
  }

  // Display powerup
  void display() {
    if (!isCut) {
      if (isIce)
        image(imgIce, pos.x*10, pos.y*10);
      else if (isStar)
        image(imgStar, pos.x*10, pos.y*10);
    } 
    else {
      tint(255, 127); // half opacity
      if (isIce)
        image(imgIce, pos.x*10, pos.y*10);
      else if (isStar)
        image(imgStar, pos.x*10, pos.y*10);
      tint(255, 255); // return full opacity for next reset
    }
  }
}
