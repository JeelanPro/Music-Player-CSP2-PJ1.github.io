// Dynamic Programming v Static
//
// Library - Minim
//
// Global Variables
int appWidth, appHeight;
float imageX, imageY, imageWidth, imageHeight;
//
float ANP; // 1 cm for Width
float BNP; // 1 cm for Height

import processing.sound.*;
// import processing.video.*;
SoundFile file;

void setup() {
  // Display
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  ANP = 0.05714285714285714; // 1 cm for Width (1/17.5)
  BNP = 0.06666666666666667; // 1 cm for Height (1/15)
  //
  imageX = displayWidth * (ANP * 0.5);
  imageY = displayHeight * (ANP * 0.5);
  imageWidth = displayWidth * (ANP * 1);
  imageHeight = displayHeight * (ANP * 1.5);
  
  
  // file = new SoundFile(this, "skibidi-toilet.mp3");
  //
  // rect(X, Y Width, Height);
  //
  
  mr(0.5, 0.5, 1, 1.5);
  mrc(0.5, 0.5, 1, 1.5);
  mr(4.5, 0.5, 8.5, 1.5);
  mr(14.5, 0.5, 2.5, 1.5);
  mrc(14.5, 0.5, 2.5, 1.5);
  mr(0.5, 2.5, 16.5, 9.5);
  mrcft("a1", 0.5, 2.5, 16.5, 9.5);
  float[] bottomBtnA = {0.5, 2, 3.5, 5, 6.5};
  for (int i = 0; i < 5; i++) {
    //mr(bottomBtnA[i], 12.5, 1, 1);
    mrc(bottomBtnA[i], 12.5, 1, 1);
    //mrcf(("a" + str(i + 1)), bottomBtnA[i], 12.5, 1, 1);
    mrcf(a("a", i), bottomBtnA[i], 12.5, 1, 1);
  }
  //mr(8, 12.5, 1.5, 1);
  mrc(8, 12.5, 1.5, 1);
  mrcf(a("c", 0), 8, 12.5, 1.5, 1);
  for (int i = 0; i < 5; i++) {
    //mr(9.5 + bottomBtnA[i], 12.5, 1, 1);
    mrc(9.5 + bottomBtnA[i], 12.5, 1, 1);
    mrcf(a("b", i), 9.5 + bottomBtnA[i], 12.5, 1, 1);
  }
  mr(0.5, 14, 16.5, 0.5);
}

String a(String section, int num) {
  return section + str(num + 1);
}

void mr(float x, float y, float w, float h) {
  rect(
    displayWidth * ANP * x,
    displayHeight * BNP * y,
    displayWidth * ANP * w,
    displayHeight * BNP * h
  );
}

void mrc(float x, float y, float w, float h) {
  float smallerSide = 
  ((displayWidth * ANP * w) < 
  (displayHeight * BNP * h)) ? 
  (displayWidth * ANP * w) : 
  (displayHeight * BNP * h);
  float biggerSide = 
  ((displayWidth * ANP * w) > 
  (displayHeight * BNP * h)) ? 
  (displayWidth * ANP * w) : 
  (displayHeight * BNP * h);
  float innerX = displayWidth * ANP * x;
  float innerY = displayHeight * BNP * y;
  
  float finalInnerX = (biggerSide - smallerSide)/2;
  
  rect(
    innerX + finalInnerX,
    innerY,
    smallerSide,
    smallerSide
  );
}

void mrcf(String op, float x, float y, float w, float h) {
  float smallerSide = 
  ((displayWidth * ANP * w) < 
  (displayHeight * BNP * h)) ? 
  (displayWidth * ANP * w) : 
  (displayHeight * BNP * h);
  float biggerSide = 
  ((displayWidth * ANP * w) > 
  (displayHeight * BNP * h)) ? 
  (displayWidth * ANP * w) : 
  (displayHeight * BNP * h);
  float innerX = displayWidth * ANP * x;
  float innerY = displayHeight * BNP * y;
  
  float finalInnerX = (biggerSide - smallerSide)/2;
  float gridSelectorX;
  float gridSelectorY;
  
  if (op.equals("a1")) { // Stop
    rect(
      innerX + finalInnerX + (smallerSide/4 * 1),
      innerY + (smallerSide/4 * 1),
      smallerSide/4 * 2,
      smallerSide/4 * 2
    );
  }
  else if (op.equals("a2")) { // Pause
    gridSelectorX = smallerSide/16;
    gridSelectorY = smallerSide/4;
    rect(
      innerX + finalInnerX + (gridSelectorX * 4),
      innerY + (gridSelectorY * 1),
      gridSelectorX * 2, // Width
      gridSelectorY * 2  // Height
    );
    rect(
      innerX + finalInnerX + (gridSelectorX * 10),
      innerY + (gridSelectorY * 1),
      gridSelectorX * 2, // Width
      gridSelectorY * 2  // Height
    );
  }
  else if (op.equals("a3")) { // Fast Forward
    /*rect(
      innerX + finalInnerX + (gridSelectorX * 4),
      innerY + (gridSelectorY * 1),
      gridSelectorX * 2, // Width
      gridSelectorY * 2  // Height
    );*/
    /*gridSelectorX = smallerSide/4;
    gridSelectorY = smallerSide/4;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      innerX + finalInnerX + gsx*2, innerY + gsy*1, 
      innerX + finalInnerX + gsx*2, innerY + gsy*3, 
      innerX + finalInnerX + gsx*1, innerY + gsy*2
    );
    triangle(
      innerX + finalInnerX + gsx*3, innerY + gsy*1, 
      innerX + finalInnerX + gsx*3, innerY + gsy*3, 
      innerX + finalInnerX + gsx*2, innerY + gsy*2
    );*/
  }
  else if (op.equals("a4")) { // Next
    gridSelectorX = smallerSide/4;
    gridSelectorY = smallerSide/4;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      innerX + finalInnerX + gsx*3, innerY + gsy*1, 
      innerX + finalInnerX + gsx*3, innerY + gsy*3, 
      innerX + finalInnerX + gsx*1.5, innerY + gsy*2
    );
    rect(
      innerX + finalInnerX + gsx*1,
      innerY + gsy*1,
      gridSelectorX * 0.5, // Width
      gridSelectorY * 2  // Height
    );
  }
  else if (op.equals("a5")) {
    /*rect(
      innerX + finalInnerX + (gridSelectorX * 4),
      innerY + (gridSelectorY * 1),
      gridSelectorX * 2, // Width
      gridSelectorY * 2  // Height
    );*/
    gridSelectorX = smallerSide/4;
    gridSelectorY = smallerSide/4;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      innerX + finalInnerX + gsx*2, innerY + gsy*1, 
      innerX + finalInnerX + gsx*2, innerY + gsy*3, 
      innerX + finalInnerX + gsx*1, innerY + gsy*2
    );
    triangle(
      innerX + finalInnerX + gsx*3, innerY + gsy*1, 
      innerX + finalInnerX + gsx*3, innerY + gsy*3, 
      innerX + finalInnerX + gsx*2, innerY + gsy*2
    );
  }
  else if (op.equals("b1")) { // Fast Backward
    /*rect(
      innerX + finalInnerX + (gridSelectorX * 4),
      innerY + (gridSelectorY * 1),
      gridSelectorX * 2, // Width
      gridSelectorY * 2  // Height
    );*/
    gridSelectorX = smallerSide/4;
    gridSelectorY = smallerSide/4;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      innerX + finalInnerX + gsx*1, innerY + gsy*1, 
      innerX + finalInnerX + gsx*1, innerY + gsy*3, 
      innerX + finalInnerX + gsx*2, innerY + gsy*2
    );
    triangle(
      innerX + finalInnerX + gsx*2, innerY + gsy*1, 
      innerX + finalInnerX + gsx*2, innerY + gsy*3, 
      innerX + finalInnerX + gsx*3, innerY + gsy*2
    );
  }
  else if (op.equals("b2")) { // Previous
    gridSelectorX = smallerSide/4;
    gridSelectorY = smallerSide/4;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      innerX + finalInnerX + gsx*1, innerY + gsy*1, 
      innerX + finalInnerX + gsx*1, innerY + gsy*3, 
      innerX + finalInnerX + gsx*2.5, innerY + gsy*2
    );
    rect(
      innerX + finalInnerX + gsx*2.5,
      innerY + gsy*1,
      gridSelectorX * 0.5, // Width
      gridSelectorY * 2  // Height
    );
  }
  else if (op.equals("b3")) {
    /*rect(
      innerX + finalInnerX + (gridSelectorX * 4),
      innerY + (gridSelectorY * 1),
      gridSelectorX * 2, // Width
      gridSelectorY * 2  // Height
    );*/
    /*gridSelectorX = smallerSide/4;
    gridSelectorY = smallerSide/4;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      innerX + finalInnerX + gsx*2, innerY + gsy*1, 
      innerX + finalInnerX + gsx*2, innerY + gsy*3, 
      innerX + finalInnerX + gsx*1, innerY + gsy*2
    );
    triangle(
      innerX + finalInnerX + gsx*3, innerY + gsy*1, 
      innerX + finalInnerX + gsx*3, innerY + gsy*3, 
      innerX + finalInnerX + gsx*2, innerY + gsy*2
    );*/
  }
  else if (op.equals("b4")) {
    /*rect(
      innerX + finalInnerX + (gridSelectorX * 4),
      innerY + (gridSelectorY * 1),
      gridSelectorX * 2, // Width
      gridSelectorY * 2  // Height
    );*/
    /*gridSelectorX = smallerSide/4;
    gridSelectorY = smallerSide/4;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      innerX + finalInnerX + gsx*1, innerY + gsy*1, 
      innerX + finalInnerX + gsx*1, innerY + gsy*3, 
      innerX + finalInnerX + gsx*2, innerY + gsy*2
    );
    triangle(
      innerX + finalInnerX + gsx*2, innerY + gsy*1, 
      innerX + finalInnerX + gsx*2, innerY + gsy*3, 
      innerX + finalInnerX + gsx*3, innerY + gsy*2
    );*/
  }
  else if (op.equals("b5")) {
    /*rect(
      innerX + finalInnerX + (gridSelectorX * 4),
      innerY + (gridSelectorY * 1),
      gridSelectorX * 2, // Width
      gridSelectorY * 2  // Height
    );*/
    /**gridSelectorX = smallerSide/4;
    gridSelectorY = smallerSide/4;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      innerX + finalInnerX + gsx*1, innerY + gsy*1, 
      innerX + finalInnerX + gsx*1, innerY + gsy*3, 
      innerX + finalInnerX + gsx*3, innerY + gsy*2
    );*/
    gridSelectorX = smallerSide/4;
    gridSelectorY = smallerSide/4;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
  }
  else if (op.equals("c1")) { // Play
    gridSelectorX = smallerSide/4;
    gridSelectorY = smallerSide/4;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      innerX + finalInnerX + gsx*1, innerY + gsy*1, 
      innerX + finalInnerX + gsx*1, innerY + gsy*3, 
      innerX + finalInnerX + gsx*3, innerY + gsy*2
    );
  }
  else {
    rect(
      innerX + finalInnerX + (smallerSide/4 * 1),
      innerY + (smallerSide/4 * 1),
      smallerSide/4 * 2,
      smallerSide/4 * 2
    );
  }
}

void mrcft(String op, float x, float y, float w, float h) {
  float smallerSide = 
  ((displayWidth * ANP * w) < 
  (displayHeight * BNP * h)) ? 
  (displayWidth * ANP * w) : 
  (displayHeight * BNP * h);
  float biggerSide = 
  ((displayWidth * ANP * w) > 
  (displayHeight * BNP * h)) ? 
  (displayWidth * ANP * w) : 
  (displayHeight * BNP * h);
  float innerX = displayWidth * ANP * x;
  float innerY = displayHeight * BNP * y;
  
  float finalInnerX = (biggerSide - smallerSide)/2;
  float gridSelectorX;
  float gridSelectorY;
  
  if (op.equals("a1")) { // Image
    /*rect(
      innerX + finalInnerX,
      innerY,
      smallerSide,
      smallerSide
    );
    rect(
      innerX + finalInnerX + (smallerSide/4 * 1),
      innerY + (smallerSide/4 * 1),
      smallerSide/4 * 2,
      smallerSide/4 * 2
    );*/
    if ((displayWidth * ANP * w) > (displayHeight * BNP * h)) {
      rect(
        innerX + finalInnerX,
        innerY,
        displayHeight * BNP * h,
        displayHeight * BNP * h
      );
    } else {
      rect(
        innerX + finalInnerX,
        innerY,
        displayWidth * ANP * w,
        displayWidth * ANP * w
      );
    }
  }
  else {
    rect(
      innerX + finalInnerX + (smallerSide/4 * 1),
      innerY + (smallerSide/4 * 1),
      smallerSide/4 * 2,
      smallerSide/4 * 2
    );
  }
}

//
void draw() { // Loop Function
  // Main rectangle
  //rect(imageX, imageY, imageWidth, imageHeight);
  
  // Additional rectangles based on the diagram
  // Top center main (300 x 9)
} // End draw

//
//PImage img;
void mousePressed() {
  /*file = new SoundFile(this, "skibidi-toilet.mp3");
  file.play();
  img = loadImage("https://media.tenor.com/cwubAnd8gN4AAAAj/skibidi-skibidi-toilet.gif");
  image(img, 0, 0);*/
} // End mousePressed
//
void keyPressed() {
  /*file = new SoundFile(this, "skibidi-toilet.mp3");
  // file.jumpTo(3);
  file.play();
  img = loadImage("https://media.tenor.com/cwubAnd8gN4AAAAj/skibidi-skibidi-toilet.gif");
  image(img, 0, 0);*/
} // End keyPressed
//
// End Main Program
