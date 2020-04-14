// Sushi Rush by Nicole Ajoy

// Import libraries (please read documentation.docx)
import ddf.minim.*;
import gifAnimation.*;

// Create objects
PFont fontGameplay, fontRainy;
Gif gifCat;
Paw paw;
Game game;
Minim minim;
Audio audio;

// Setup for initalizing new objects
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
  
  // Play bg audio and animations
  audio.playBgMusic();
  gifCat.play();
}

// Update and display objects
void draw() {
  paw.display();
  game.update();
  game.display();
}

// MousePressed (available all screens):
// UI buttons for all screens
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

// MouseDragged (only available in level screen):
// draw line from where mouse is originally clicked
// to new mouse position and released
void mouseDragged() {
  if (game.isLevel) {
    pushMatrix();
      strokeWeight(10);
      stroke(#F1CDBE);
      line(paw.oldPos.x, paw.oldPos.y, mouseX, mouseY);
      strokeWeight(1);
      noStroke();
    popMatrix();
    
    // Check if mouse touched the sushi/bomb
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
  
  audio.playChopSound(); // play sound once when mouse released
}
