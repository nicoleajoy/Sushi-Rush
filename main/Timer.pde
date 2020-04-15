class Timer {
  int currentTime;
  int counter;
  
  Timer() {
    currentTime = millis();
    counter = 3;
  }

  void update() {
    // Wait two seconds every counter increment
    if ((millis() > currentTime+2000) && (counter > 0)) {
      currentTime = millis();
      counter--;
    }
  }
  
  boolean begin() {
    if (counter == 0) {
      return true;
    }
    return false;
  }
  
  void reset() {
    counter = 3;
  }
}
