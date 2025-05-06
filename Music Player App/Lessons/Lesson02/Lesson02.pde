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
  
  // Music Population
  minim = new Minim(this);
  playList[0] = minim.loadFile("Audio/skibidi-toilet.mp3");
  playList[1] = minim.loadFile("Audio/qaseda.mp3");
  playList[0] = minim.loadFile("Audio/Virus.mp3");
  
  // Display Population
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
	if (key == ' ') {
		if (playList[currentAudio].isPlaying()) {
			playList[currentAudio].play();
		} else {
			playList[currentAudio].pause();
		}
	}
	
	if (key == 'p') {
		playList[currentAudio].play();
	}
	
	if (key == 'o') {
		playList[currentAudio].pause();
	}
} // End keyPressed
