// Library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global Variable
int appWidth, appHeight;

Minim minim;
int numberOfAudio = 3;
int currentAudio;
AudioPlayer[] playList = new AudioPlayer[ numberOfAudio ];

float divX, divY, divWidth, divHeight;


void setup() {
  // Display
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;

  // Population
  currentAudio = 0;
  
  minim = new Minim(this);
  playList[0] = minim.loadFile("Audio/skibidi-toilet.mp3");
  playList[1] = minim.loadFile("Audio/qaseda.mp3");
  playList[0] = minim.loadFile("Audio/Virus.mp3");

  divX = appWidth/4 * 1;
  divY = appHeight/4 * 1;
  divWidth = appWidth/4 * 2;
  divHeight = appHeight/4 * 2;
  
  // Draw
  rect(divX, divY, divWidth, divHeight);
  
} // End Setup

void draw() {
} // End draw

void mousePressed() {
} // End mousePressed

void keyPressed() {
  /* 12 important buttons based on the keyboard
   - Play
   - Pause
   - Stop
   - Loop Once
   - Loop Infinite
   - Fast Forward
   - Fast Rewind
   - Mute
   - Next Song
   - Previous Song
   - Shuffle
   - Exit
  */

  // Play
  // Pause
  // Stop
  // Loop Once
  // Loop Infinite
  // Fast Forward
  // Fast Rewind
  // Mute
  // Next Song
  // Previous Song
  // Shuffle
  // Exit
  
} // End keyPressed
