// Dynamic Programming v Static
//
// Library - Minim
//
// Global Variables
int appWidth, appHeight;
float imageX, imageY, imageWidth, imageHeight;
//
float ANP = 0.05714285714285714; // 1 cm for Width (1/17.5)
float BNP = 0.06666666666666667; // 1 cm for Height (1/15)

void setup() {
  // Display
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  //
  imageX = displayWidth * (ANP * 0.5);
  imageY = displayHeight * (ANP * 0.5);
  imageWidth = displayWidth * (ANP * 1);
  imageHeight = displayHeight * (ANP * 1.5);
  //
  // rect(X, Y Width, Height);
  //
  
  mr(0.5, 0.5, 1, 1.5);
  mr(4.5, 0.5, 8.5, 1.5);
  mr(14.5, 0.5, 2.5, 1.5);
  mr(0.5, 2.5, 16.5, 9.5);
  float[] bottomBtnA = {0.5, 2, 3.5, 5, 6.5};
  for (int i = 0; i < 5; i++) {
    mr(bottomBtnA[i], 12.5, 1, 1);
  }
  mr(8, 12.5, 1.5, 1);
  for (int i = 0; i < 5; i++) {
    mr(9.5 + bottomBtnA[i], 12.5, 1, 1);
  }
  mr(0.5, 14, 16.5, 0.5);
}

void mr(float x, float y, float w, float h) {
  rect(
    displayWidth * ANP * x,
    displayHeight * BNP * y,
    displayWidth * ANP * w,
    displayHeight * BNP * h
  );
}

//
void draw() {
  // Main rectangle
  //rect(imageX, imageY, imageWidth, imageHeight);
  
  // Additional rectangles based on the diagram
  // Top center main (300 x 9)
} // End draw

//
void mousePressed() {} // End mousePressed
//
void keyPressed() {} // End keyPressed
//
// End Main Program
