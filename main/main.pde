// Sushi Rush by Nicole Ajoy

// Import libraries (please read documentation on where to install)
import ddf.minim.*;
import gifAnimation.*;

// Initalize objects
PFont fontGameplay, fontRainy; // fonts
Gif gifCat; // cute cat gif
Paw paw; // cursor
Game game; // game
Minim minim; // audio
Audio audio; // audio

// Setup for initalizing new objects
void setup() {
  size(1000, 1000);
  fontGameplay = createFont("font_gameplay.ttf", 100);
  fontRainy = createFont("font_rainyhearts.ttf", 100);
  gifCat = new Gif(this, "image_cat.gif");
  
  // Game objects
  paw = new Paw();
  game = new Game();
  
  // Audio objects
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
