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

// Draw is called every frame
void draw() {
  paw.display();
  game.update();
  game.display();
}

// Called when mouse is pressed (better control than mouseClicked)
void mousePressed() {
  if (game.isTitle) {
    // START button
    if (100<mouseX&&mouseX<300 && 850<mouseY&&mouseY<950) { 
      game.isTitle = false; // turn off title background UI
      game.isLevel = true; // turn on level background UI
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
  else if (game.isLevel) {
    // Return to title screen
    if (0<mouseX&&mouseX<100 && 0<mouseY&&mouseY<100) { 
      game.isTitle = true; // turn off title background UI
      game.isLevel = false; // turn on level background UI
    }
  }
}

void mouseDragged() {
  
}
