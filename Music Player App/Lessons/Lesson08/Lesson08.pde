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
AudioMetaData[] playListMetaData = new AudioMetaData[ numberOfAudio ];

float divX, divY, divWidth, divHeight;


void setup() {
  // Display
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;

  // Population
  divX = appWidth/4 * 1;
  divY = appHeight/4 * 1;
  divWidth = appWidth/4 * 2;
  divHeight = appHeight/4 * 2;

  currentAudio = 0;
  minim = new Minim(this);
  playList[currentAudio] = minim.loadFile("Audio/skibidi-toilet.mp3");
  playListMetaData[currentAudio] = playList[currentAudio].getMetaData();
  println(playListMetaData[currentAudio].title());
  currentAudio = 1;
  playList[currentAudio] = minim.loadFile("Audio/qaseda.mp3");
  playListMetaData[currentAudio] = playList[currentAudio].getMetaData();
  println(playListMetaData[currentAudio].title());
  currentAudio = 2;
  playList[currentAudio] = minim.loadFile("Audio/Virus.mp3");
  playListMetaData[currentAudio] = playList[currentAudio].getMetaData();
  println(playListMetaData[currentAudio].title());
  currentAudio = 0;

  
  // Draw
  rect(divX, divY, divWidth, divHeight);
  
} // End Setup

void draw() {
} // End draw

void mousePressed() {
} // End mousePressed

void keyPressed() {
} // End keyPressed
