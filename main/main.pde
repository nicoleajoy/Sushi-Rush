// Sushi Rush by Nicole Ajoy

/************************** IMPORTS **************************/
// Import libraries (documentation.docx for install guide)

import ddf.minim.*;
import gifAnimation.*;

/************************** GLOBAL **************************/
// Create global objects

PFont fontGameplay, fontRainy;
Gif gifCat;
Paw paw;
Game game;
Minim minim;
Audio audio;

/************************** SETUP **************************/
// Initalize global objects, start bg music, play gifs

void setup() {
  size(1000, 1000);
  
  // Initialize objects
  fontGameplay = createFont("font_gameplay.ttf", 100);
  fontRainy = createFont("font_rainyhearts.ttf", 100);
  gifCat = new Gif(this, "image_cat.gif");
  paw = new Paw();
  game = new Game();
  minim = new Minim(this);
  audio = new Audio();
  
  // Background music and gif animations
  audio.playBgMusic();
  gifCat.play();
}

/************************** DRAW **************************/
// Update and display objects every frame

void draw() {
  paw.display();
  game.update();
  game.display();
}

/************************** MOUSEPRESSED **************************/
// Used for:
// - level selection in the title screen (mouse button clicks)
// - tracking original mouse position for slice in level screen

void mousePressed() {
  // Track old mouse position
  paw.oldPos.x = mouseX;
  paw.oldPos.y = mouseY;
  
  // Title UI
  if (game.isTitle) {
    // START button
    if (100<mouseX&&mouseX<300 && 850<mouseY&&mouseY<950) {
      game.isLevel = true; // turn on level UI
      game.isTitle = false; // turn off title UI
      game.isEnd = false; // turn off end UI
      game.reset(); // reset values
    }
    // MODE button
    else if (400<mouseX&&mouseX<600 && 850<mouseY&&mouseY<950) { 
      if (game.difficulty == "EASY") {
        game.difficulty = "HARD";
      }
      else if (game.difficulty == "HARD") {
        game.difficulty = "EASY";
      }
    }
    // QUIT button
    else if (700<mouseX&&mouseX<900 && 850<mouseY&&mouseY<950) { 
      exit(); // terminate program
    }
  }
  // Level UI
  else if (game.isLevel) {
    // Return to title screen
    if (0<mouseX&&mouseX<100 && 0<mouseY&&mouseY<100) { 
      game.isTitle = true; // turn on title UI
      game.isLevel = false; // turn off level UI
      game.isEnd = false; // turn off end UI
    }
  }
  // End UI
  else if (game.isEnd) {
    // Return to title screen
    if (0<mouseX&&mouseX<100 && 0<mouseY&&mouseY<100) { 
      game.isTitle = true; // turn on title UI
      game.isLevel = false; // turn off level UI
      game.isEnd = false; // turn off end UI
    }
  }
}

/************************** MOUSEDRAGGED **************************/
// Used for:
// - draw line from original mouse click to release point (dragged)
// - check if mouse position collides with sushi/bomb
// - play chop sound once when released

void mouseDragged() {
  if (game.isLevel) {
    // Draw chop line
    strokeWeight(10);
    stroke(#F1CDBE);
    line(paw.oldPos.x, paw.oldPos.y, mouseX, mouseY);
    strokeWeight(1);
    noStroke();
    
    // Check collision
    if (game.rsgTimer.isDone()) {
      for (int i = 0; i < game.sushis.length; i++) {
        game.sushis[i].checkCollision();
      }
      for (int i = 0; i < game.bombs.length; i++) {
        game.bombs[i].checkCollision();
        if (game.lives <= 0) {
          game.isEnd = true;
          game.isLevel = false;
          game.isTitle = false;
        }
      }
    }
  }
  
  // Play chop sound
  audio.playChopSound(); 
}
