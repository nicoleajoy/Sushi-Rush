// Nicole Ajoy

/************************** PAW CLASS **************************/

class Paw {
  // Variables
  PImage img; // paw image representation
  PVector oldPos;
  
  // Constructor
  Paw() {
    img = loadImage("image_paw.png");
    oldPos = new PVector(0, 0);
  }
  
  // Auto updates with cursor position, just display
  void display() {
    cursor(img, 0, 0);
  }
}
