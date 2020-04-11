// Nicole Ajoy

class Paw {
  // Variables
  PImage img; // paw image representation
  
  // Constructor
  Paw() {
    img = loadImage("image_paw.png");
  }
  
  // Auto updates with cursor position, just display
  void display() {
    cursor(img, 0, 0);
  }
}
