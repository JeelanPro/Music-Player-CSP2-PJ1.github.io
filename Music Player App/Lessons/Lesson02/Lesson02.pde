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
  size(500, 500);
  appWidth = 500;
  appHeight = 500;
  // fullScreen();
  // appWidth = displayWidth;
  // appHeight = displayHeight;


  // Population
  currentAudio = 0;
  
  minim = new Minim(this);
  playList[0] = minim.loadFile("Audio/skibidi-toilet.mp3");
  playList[1] = minim.loadFile("Audio/qaseda.mp3");
  playList[2] = minim.loadFile("Audio/Virus.mp3");

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
  /*12 important buttons based on the keyboard
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
   keyBoard shotcut:
   Command       | Shotcut
   Play          | p, P, [SPACE]
   Pause         | o, O
   Stop          | s, S
   Loop Once     | l, L
   Loop Infinite | i, I
   Fast Forward  | f, F
   Fast Rewind   | r, R
   Mute          | m, M
   Next Song     | n, N
   Previous Song | b, B
   Shuffle       | h, H
   Exit          | q, Q, [ESC]
  */

  // Play
  if (key == 'p' || key == 'P') {
    playList[currentAudio].play();
  }
  if (key == ' ') {
    if (playList[currentAudio].isPlaying()) {
      playList[currentAudio].pause();
    } else {
      playList[currentAudio].play();
    }
  }

  // Pause
  if (key == 'o' || key == 'O') {
    playList[currentAudio].pause();
  }

  // Stop
  if (key == 's' || key == 'S') {
    if (playList[currentAudio].isPlaying()) {
      playList[currentAudio].pause();
      playList[currentAudio].rewind();
    } else {
      playList[currentAudio].rewind();
    }
  }

  // Loop Once
  if (key == 'l' || key == 'L') {
    playList[currentAudio].loop(0);
  }

  // Loop Infinite
  if (key == 'i' || key == 'I') {
    playList[currentAudio].loop();
  }

  // Fast Forward
  if (key == 'f' || key == 'F') {
    playList[currentAudio].skip(1000);
  }

  // Fast Rewind
  if (key == 'r' || key == 'R') {
    playList[currentAudio].skip(-1000);
  }

  // Mute
  if (key == 'm' || key == 'M') {
    if (playList[currentAudio].isMuted()) {
      playList[currentAudio].unmute();
    } else {
      playList[currentAudio].mute();
    }
  }

  // Next Song
  if (key == 'n' || key == 'N') {
    if (playList[currentAudio].isPlaying()) {
      playList[currentAudio].pause();
      playList[currentAudio].rewind();
      if  (currentAudio == numberOfAudio - 1) {
        currentAudio = 0;
      } else {
        currentAudio++;
      }
      playList[currentAudio].play();

    } else {
      playList[currentAudio].rewind();
      if  (currentAudio == numberOfAudio - 1) {
        currentAudio = 0;
      } else {
        currentAudio++;
      }

    }
  }

  // Previous Song
  if (key == 'b' || key == 'B') {
    if (playList[currentAudio].isPlaying()) {
      playList[currentAudio].pause();
      playList[currentAudio].rewind();
      if  (currentAudio == 0) {
        currentAudio = numberOfAudio - 1;
      } else {
        currentAudio--;
      }
      playList[currentAudio].play();

    } else {
      playList[currentAudio].rewind();
      if  (currentAudio == 0) {
        currentAudio = numberOfAudio - 1;
      } else {
        currentAudio--;
      }

    }
  }

  // Shuffle
  if (key == 'h' || key == 'H') {
    int randomAudio = int(random(0, numberOfAudio));
    if (playList[currentAudio].isPlaying()) {
      playList[currentAudio].pause();
      playList[currentAudio].rewind();
      currentAudio = randomAudio;
      playList[currentAudio].play();

    } else {
      playList[currentAudio].rewind();
      currentAudio = randomAudio;
      playList[currentAudio].play();

    }
  }

  // Exit
  if (key == 'q' || key == 'Q') {
    exit();
  }
  if (key == ESC) {
    exit();
  }
  
} // End keyPressed
