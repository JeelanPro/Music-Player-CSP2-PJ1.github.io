/* Button Template: all buttons
 - TBA
 */
//
//Library - minim
//
//Global Variable
float divX, divY, divWidth, divHeight;
float musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight;
//
void setup() {
  //Display
  fullScreen(); //displayWidth, displayHeight
  int appWidth = displayWidth;
  int appHeight = displayHeight;
  //
  //Population
  divX = appWidth * 1/4;
  divY = appHeight * 1/4;
  divWidth = appWidth * 1/2;
  divHeight = appHeight * 1/2;
  float smallerSide = (divWidth < divHeight ) ? divWidth : divHeight;
  musicButtonX = divX;
  musicButtonY = divY;
  musicButtonWidth = smallerSide;
  musicButtonHeight = smallerSide;
  //
  //DIV: musicButtonDIV
  //rect(X, Y, Width, Height);
  rect(divX, divY, divWidth, divHeight);
  rect(musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight);
} //End setup
//
void draw() {
  
} // End draw
//
void mousePressed() {
  
} // End mousePressed
//
void keyPressed() {
  
} //End keyPressed
//
// End MAIN Program
