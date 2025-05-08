// Library


// Global Variable
int appWidth, appHeight;

float logoX, logoY, logoWidth, logoHeight;
float titleX, titleY, titleWidth, titleHeight;
float imageX, imageY, imageWidth, imageHeight;
float playButtonX, playButtonY, playButtonWidth, playButtonHeight;
float pauseButtonX, pauseButtonY, pauseButtonWidth, pauseButtonHeight;
float stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight;
float loopOnceButtonX, loopOnceButtonY, loopOnceButtonWidth, loopOnceButtonHeight;
float loopInifinitButtonX, loopInifinitButtonY, loopInifinitButtonWidth, loopInifinitButtonHeight;
float fastForwardButtonX, fastForwardButtonY, fastForwardButtonWidth, fastForwardButtonHeight;
float fastRewindButtonX, fastRewindButtonY, fastRewindButtonWidth, fastRewindButtonHeight;
float muteButtonX, muteButtonY, muteButtonWidth, muteButtonHeight;
float nextButtonX, nextSongButtonY, nextSongButtonWidth, nextSongButtonHeight;
float previousButtonX, previousButtonY, previousButtonWidth, previousButtonHeight;
float shuffleButtonX, shuffleButtonY, shuffleButtonWidth, shuffleButtonHeight;
float exitButtonX, exitButtonY, exitButtonWidth, exitButtonHeight;
float timeLineX, timeLineY, timeLineWidth, timeLineHeight;
float timeX, timeY, timeWidth, timeHeight;


void setup() {
  // Display
  size(500, 500);
  appWidth = 500;
  appHeight = 500;
  // fullScreen();
  // appWidth = displayWidth;
  // appHeight = displayHeight;

  
  // Population
  // logo
  logoX = appWidth/4 * 1;
  logoY = appHeight/4 * 1;
  logoWidth = appWidth/4 * 2;
  logoHeight = appHeight/4 * 1;

    // title


  // Draw
  rect(logoX, logoY, logoWidth, logoHeight);
  rect(titleX, titleY, titleWidth, titleHeight);
  rect(imageX, imageY, imageWidth, imageHeight);
  rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  rect(pauseButtonX, pauseButtonY, pauseButtonWidth, pauseButtonHeight);
  rect(stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight);
  rect(loopOnceButtonX, loopOnceButtonY, loopOnceButtonWidth, loopOnceButtonHeight);
  rect(loopInifinitButtonX, loopInifinitButtonY, loopInifinitButtonWidth, loopInifinitButtonHeight);
  rect(fastForwardButtonX, fastForwardButtonY, fastForwardButtonWidth, fastForwardButtonHeight);
  rect(fastRewindButtonX, fastRewindButtonY, fastRewindButtonWidth, fastRewindButtonHeight);
  rect(muteButtonX, muteButtonY, muteButtonWidth, muteButtonHeight);
  rect(nextButtonX, nextSongButtonY, nextSongButtonWidth, nextSongButtonHeight);
  rect(previousButtonX, previousButtonY, previousButtonWidth, previousButtonHeight);
  rect(shuffleButtonX, shuffleButtonY, shuffleButtonWidth, shuffleButtonHeight);
  rect(exitButtonX, exitButtonY, exitButtonWidth, exitButtonHeight);
  rect(timeLineX, timeLineY, timeLineWidth, timeLineHeight);
  rect(timeX, timeY, timeWidth, timeHeight);
  


} // End Setup


void draw() {
} // End draw


void mousePressed() {
} // End mousePressed


void keyPressed() {
} // End keyPressed

