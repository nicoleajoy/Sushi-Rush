// Nicole Ajoy

/************************** GLOBAL **************************/
// Global variables

AudioPlayer audioBg;
AudioPlayer audioChop;

/************************** AUDIO CLASS **************************/

class Audio {
  // Constructor
  Audio() {
    audioBg = minim.loadFile("audio_bg.mp3");
    audioChop = minim.loadFile("audio_chop.mp3");
  }
  
  // Play background music
  void playBgMusic() {
    audioBg.play();
  }
  
  // Played chop sound
  void playChopSound() {
    audioChop.rewind();
    audioChop.play();
  }
}

/************************** STOP **************************/
// Close the program safely (no crash or corrupted files)

void stop() {
  audioBg.close();
  minim.stop();
  super.stop();
}
