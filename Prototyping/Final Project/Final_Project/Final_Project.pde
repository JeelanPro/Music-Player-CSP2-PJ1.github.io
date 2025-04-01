//
// Global Vriable

// Setup
int appHeight;
int appWidth;

// Play
float playButtonX;
float playButtonY;
float playButtonWidth;
float playButtonHeight;

// End Global Variable
//
void setup() {
  // Setup
  fullScreen();
  appHeight = displayHeight;
  appWidth = displayWidth;

  // Play
  playButtonWidth = appWidth / 4;
  playButtonHeight = appHeight / 8;
  playButtonX = appWidth / 2 - playButtonWidth / 2;
  playButtonY = appHeight / 2 - playButtonHeight / 2;

  // Draw
  rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  

  // Template rect(X, Y, Width, Height)
} // End setup()
//
void draw() {
  
} // End draw()
//
void mousePressed() {
  
} // End mousePressed()
//
void keyPressed() {
  
} // End keyPressed()
//
