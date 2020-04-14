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
      noStroke();
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
      // Return button
      fill(#95614B, 150); // brown color
      rect(50, 50, 75, 75, 25, 25, 25, 25);
      textAlign(CENTER, CENTER);
      fill(#FFC98C, 150); // beige color
      textFont(fontGameplay);
      textSize(45);
      text("X", 50, 50);
      // Scores
      textSize(30);
      fill(#FFC98C); // orange color
      textAlign(CENTER, CENTER);
      text("CURRENT SCORE: " + game.currentScore, width/2, 30);
      fill(#FFC98C, 125); // orange color
      text("HIGH SCORE: " + game.highScore, width/2, 70);
    popMatrix();
  }
  
  // End screen function
  void endScreen() {
    background(imgEnd);
    pushMatrix();
      // Return button
      fill(#B8DAEB, 150); // blue color
      rect(50, 50, 75, 75, 25, 25, 25, 25);
      textAlign(CENTER, CENTER);
      fill(#929292, 150); // gray color
      textFont(fontGameplay);
      textSize(45);
      text("X", 50, 50);
    popMatrix();
  }
  
  // Update game stats
  void update() {
    if (isLevel) {
      for (int i = 0; i < sushis.length; i++) {
        sushis[i].update();
        if (sushis[i].pos.y > 100) {
          sushis[i] = new Sushi();
        }
        sushis[i].checkCollision();
        if (sushis[i].isCut && !sushis[i].isCounted) {
          currentScore += sushis[i].value;
          sushis[i].isCounted = true;
        }
        if (currentScore >= highScore) {
          highScore = currentScore;
        }
      }
      for (int i = 0; i < bombs.length; i++) {
        bombs[i].update();
        if (bombs[i].pos.y > 100) {
          bombs[i] = new Bomb();
        }
        bombs[i].checkCollision();
        if (bombs[i].isCut) {
          isEnd = true;
        }
      }
    }
  }
  
  // Display current screen
  void display() {
    if (isTitle && !isLevel && !isEnd) {
      titleScreen();
    }
    else if (isLevel && !isTitle && !isEnd) {
      levelScreen();
      for (int i = 0; i < sushis.length; i++) {
        sushis[i].display();
      }
      for (int i = 0; i < bombs.length; i++) {
        bombs[i].display();
      }
    }
    else if (isEnd && !isTitle && !isLevel) {
      endScreen();
    }
  }
  
  // Reset sushis, bombs, and current score before every START
  void reset() {
    for (int i = 0; i < sushis.length; i++) {
      sushis[i] = new Sushi();
    }
    for (int i = 0; i < bombs.length; i++) {
      bombs[i] = new Bomb();
    }
    currentScore = 0;
  }
}
