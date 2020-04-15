// Nicole Ajoy

/************************** TIMER CLASS **************************/

class Timer {
  // Variables
  int currentTime;
  int counter;
  
  // Constructor
  Timer() {
    currentTime = millis();
    counter = 3;
  }
  
  // Update current time and reduce counter
  void update() {
    // Wait two seconds every counter increment
    if ((millis() > currentTime+2000) && (counter > 0)) {
      currentTime = millis();
      counter--;
    }
  }
  
  // Check whether or not to display ready-set-go words
  boolean begin() {
    if (counter == 0) {
      return true;
    }
    return false;
  }
  
  // Called every "START" button click
  void reset() {
    counter = 3;
  }
}
