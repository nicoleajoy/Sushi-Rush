// Nicole Ajoy

/************************** GAME CLASS **************************/

class Game {
  // Variables
  int currentScore, highScore, lives; // scoreboard and health
  PImage imgTitle, imgLevel, imgEnd; // background images
  PImage imgHealth; // three lives for health
  boolean isTitle, isLevel, isEnd; // screen type
  String difficulty; // "EASY" or "HARD"
  Sushi[] sushis; // sushi collection
  Bomb[] bombs; // bomb collection
  Powerup[] powerups; // powerup collection
  Timer rsgTimer, powerupTimer; // timers
  boolean powerupActive; // ice powerup trigger
  
  // Constructor
  Game() {
    currentScore = 0;
    highScore = 0;
    lives = 3;
    isTitle = true;
    isLevel = false;
    isEnd = false;
    difficulty = "EASY";
    imgTitle = loadImage("bg_title.png");
    imgLevel = loadImage("bg_level.png");
    imgEnd = loadImage("bg_end.png");
    imgHealth = loadImage("image_health.png");
    sushis = new Sushi[5];
    bombs = new Bomb[2];
    powerups = new Powerup[1];
    for (int i = 0; i < sushis.length; i++) {
      sushis[i] = new Sushi();
    }
    for (int i = 0; i < bombs.length; i++) {
      bombs[i] = new Bomb();
    }
    for (int i = 0; i < powerups.length; i++) {
      powerups[i] = new Powerup();
    }
    rsgTimer = new Timer();
    powerupTimer = new Timer();
    powerupActive = false;
  }
  
  // Title screen UI
  void titleScreen() {
    background(imgTitle);
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
  }
  
  // Level screen UI
  void levelScreen() {
    background(imgLevel);
    
    // Return button
    fill(#95614B, 150); // brown color
    rect(50, 50, 75, 75, 25, 25, 25, 25);
    textAlign(CENTER, CENTER);
    fill(#FFC98C, 150); // beige color
    textFont(fontGameplay);
    textSize(45);
    text("X", 50, 50);
    
    // Score board
    textSize(30);
    fill(#FFC98C); // orange color
    textAlign(CENTER, CENTER);
    text("CURRENT SCORE: " + game.currentScore, width/2, 30);
    fill(#FFC98C, 125); // orange color
    text("HIGH SCORE: " + game.highScore, width/2, 70);
    
    // Timer: ready -> set -> go
    textSize(75);
    fill(#E3AD7E); // orange color
    if (rsgTimer.counter == 3) {
      text("READY?", width/2, height/2);
    }
    if (rsgTimer.counter == 2) {
      text("SET?", width/2, height/2);
    }
    if (rsgTimer.counter == 1) {
      text("GO!", width/2, height/2);
    }
    
    // Draw health
    if (lives == 3) {
      image(imgHealth, 775, 20);
    }
    else if (lives == 2) {
      PImage imgTwo = imgHealth.get(67, 0, 134, 60); 
      image(imgTwo, 775, 20); 
    }
    else if (lives == 1) {
      PImage imgOne = imgHealth.get(134, 0, 67, 60); 
      image(imgOne, 775, 20); 
    }
  }
  
  // End screen UI
  void endScreen() {
    background(imgEnd);
    
    // Return button
    fill(#B8DAEB, 150); // blue color
    rect(50, 50, 75, 75, 25, 25, 25, 25);
    textAlign(CENTER, CENTER);
    fill(#929292, 150); // gray color
    textFont(fontGameplay);
    textSize(45);
    text("X", 50, 50);
    
    // Game over
    textSize(75);
    fill(#676767); // orange color
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, 200);
    fill(#676767, 175); // orange color
    textSize(40);
    text("CURRENT SCORE: " + game.currentScore, width/2, height/2-30);
    text("HIGH SCORE: " + game.highScore, width/2, height/2+30);
  }
  
  // Update game stats
  void update() {
    if (isLevel) {
      rsgTimer.update();
      if (powerupActive) {
        powerupTimer.update();
      }
      else {
        powerupActive = false;
        powerupTimer.reset();
      }
      if (rsgTimer.isDone()) {
        // Check sushi collisions
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
        }
        // Check bomb collisions
        for (int i = 0; i < bombs.length; i++) {
          bombs[i].update();
          if (bombs[i].pos.y > 100) {
            bombs[i] = new Bomb();
          }
          bombs[i].checkCollision();
          if (bombs[i].isCut && !bombs[i].isCounted) {
            lives--;
            if (lives > 0) { // do not deduct if on last life
              currentScore += bombs[i].value;
            }
            bombs[i].isCounted = true;
          }
        }
        // Check powerup collisions
        if (difficulty == "HARD") {
          for (int i = 0; i < powerups.length; i++) {
            powerups[i].update();
            if (powerups[i].pos.y > 100) {
              powerups[i] = new Powerup();
            }
            powerups[i].checkCollision();
            if (powerups[i].isCut && !powerups[i].isCounted) {
              if (powerups[i].isStar) {
                currentScore += 50; // double sushi value
                powerups[i].isCounted = true;
              }
              else if (powerups[i].isIce) {
                powerupTimer = new Timer();
                powerupActive = true;
              }
            }
          }
        }
        // Save high score
        if (currentScore >= highScore) {
            highScore = currentScore;
        }
        // Check number of lives
        if (lives <= 0) {
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
      if (rsgTimer.isDone()) {
        for (int i = 0; i < sushis.length; i++) {
          sushis[i].display();
        }
        if (difficulty == "HARD") {
          for (int i = 0; i < powerups.length; i++) {
            powerups[i].display();
          }
        }
        for (int i = 0; i < bombs.length; i++) {
          bombs[i].display();
        }
      }
    }
    else if (isEnd && !isTitle && !isLevel) {
      endScreen();
    }
  }
  
  // Reset values every "START" button click
  void reset() {
    // Reset current score (but keep high score)
    currentScore = 0;
    
    // Easy = 3 lives | Hard = 1 life
    if (difficulty == "EASY") {
      lives = 3;
    }
    else if (difficulty == "HARD") {
      lives = 1;
    }
    
    // Reset sushi and bomb spawns
    for (int i = 0; i < sushis.length; i++) {
      sushis[i] = new Sushi();
    }
    for (int i = 0; i < bombs.length; i++) {
      bombs[i] = new Bomb();
    }
    if (difficulty == "HARD") {
      for (int i = 0; i < powerups.length; i++) {
        powerups[i] = new Powerup();
      }
    }
    
    powerupActive = false;
    rsgTimer.reset();
  }
}
