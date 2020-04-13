// Nicole Ajoy

class Game {
  // Variables
  int currentScore, highScore; // score counter
  PImage imgTitle, imgLevel, imgEnd; // background images
  boolean isTitle, isLevel, isEnd; // screen type
  String difficulty; // "EASY" or "HARD"
  Sushi[] sushis; // sushi collection
  Bomb[] bombs; // bomb collection
  
  // Constructor
  Game() {
    currentScore = 0;
    highScore = 0;
    isTitle = true;
    isLevel = false;
    isEnd = false;
    imgTitle = loadImage("bg_title.png");
    imgLevel = loadImage("bg_level.png");
    imgEnd = loadImage("bg_end.png");
    difficulty = "EASY";
    sushis = new Sushi[5];
    bombs = new Bomb[2];

    for (int i = 0; i < sushis.length; i++) {
      sushis[i] = new Sushi();
    }
    for (int i = 0; i < bombs.length; i++) {
      bombs[i] = new Bomb();
    }
  }
  
  // Title screen function
  void titleScreen() {
    background(imgTitle);
    pushMatrix();
      // Title
      image(gifCat, 250, 600);
      fill(#D04026, 200); // salmon color
      rectMode(CENTER);
      textFont(fontGameplay);
      textAlign(CENTER, CENTER);
      text("SUSHI RUSH", width/2, 125);
      // START button
      fill(#D04026, 200); // salmon color
      rect(200, 900, 200, 100, 25, 25, 25, 25);
      textFont(fontRainy);
      textSize(40);
      fill(#FFC98C, 150); // orange color
      textAlign(CENTER, CENTER);
      text("START", 200, 900);
      // DIFFICULTY button
      fill(#D04026, 200); // salmon color
      rect(500, 900, 200, 100, 25, 25, 25, 25);
      textFont(fontRainy);
      textSize(40);
      fill(#FFC98C, 150); // orange color
      textAlign(CENTER, CENTER);
      text(difficulty, 500, 900);
      // QUIT button
      fill(#D04026, 200); // salmon color
      rect(800, 900, 200, 100, 25, 25, 25, 25);
      textFont(fontRainy);
      textSize(40);
      fill(#FFC98C, 150); // orange color
      textAlign(CENTER, CENTER);
      text("QUIT", 800, 900);
    popMatrix();
  }
  
  void levelScreen() {
    background(imgLevel);
    pushMatrix();
      fill(#95614B, 150); // black color
      rect(50, 50, 75, 75, 25, 25, 25, 25);
      textAlign(CENTER, CENTER);
      fill(#FFC98C, 150); // orange color
      textFont(fontGameplay);
      textSize(45);
      text("X", 50, 50);
    popMatrix();
  }
  
  // End screen function
  void endScreen() {
    background(imgEnd);
  }
  
  // Update game stats
  void update() {
    if (isLevel) {
      for (int i = 0; i < sushis.length; i++) {
        sushis[i].update();
        if (sushis[i].pos.y > 100) {
          sushis[i] = new Sushi();
        }
      }
      for (int i = 0; i < bombs.length; i++) {
        bombs[i].update();
        if (bombs[i].pos.y > 100) {
          bombs[i] = new Bomb();
        }
      }
    }
  }
  
  // Display current screen
  void display() {
    if (isTitle) {
      titleScreen();
    }
    else if (isLevel) {
      levelScreen();
      for (int i = 0; i < sushis.length; i++) {
        sushis[i].display();
      }
      for (int i = 0; i < bombs.length; i++) {
        bombs[i].display();
      }
    }
    else if (isEnd) {
      endScreen();
    }
  }
}
