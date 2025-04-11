// Dynamic Programming
//
// Library - Minim
//
// Global Variables
int appWidth, appHeight;
float imageDivX, imageDivY, imageDivWidth, imageDivHeight;
//
PImage myFirstImage;
//
void setup() {
  // Display
  // fullScreen();
  size(700, 700);
  appWidth = width;    // displayWidth
  appHeight = height;  // displayHeight
  //
  // Population
  imageDivX = appWidth/4;
  imageDivY = appHeight/4;
  imageDivWidth = appWidth/4*2;
  imageDivHeight = appHeight/4*2;
  //
  // Image Aspect Ratio Algorithm
  String myFirstImagePathway = "./JPLogo.png";
  myFirstImage = loadImage(myFirstImagePathway);
  //
  // DIV
  rect( imageDivX, imageDivY, imageDivWidth, imageDivHeight );
  //
  // Prototype Images
  image( myFirstImage, imageDivX, imageDivY, imageDivWidth, imageDivHeight );
} // End setup
//
void draw() {
} // End draw
//
void mousePressed() {
} // End mousePressed
//
void keyPressed() {
} // End keyPressed
//
// End Main Program
