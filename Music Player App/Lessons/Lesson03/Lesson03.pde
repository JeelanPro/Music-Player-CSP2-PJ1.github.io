// Library


// Global Variable
int appWidth, appHeight;

float logoX, logoY, logoWidth, logoHeight;
float logoBoxX, logoBoxY, logoBoxWidth, logoBoxHeight;

float titleX, titleY, titleWidth, titleHeight;
float imageX, imageY, imageWidth, imageHeight;

float playButtonX, playButtonY, playButtonWidth, playButtonHeight;
float playButtonLogoBoxX, playButtonLogoBoxY, playButtonLogoBoxWidth, playButtonLogoBoxHeight;
float playButtonLogoTringleX1, playButtonLogoTringleY1, playButtonLogoTringleX2, playButtonLogoTringleY2, playButtonLogoTringleX3, playButtonLogoTringleY3;

float pauseButtonX, pauseButtonY, pauseButtonWidth, pauseButtonHeight;
float pauseButtonLogoBoxX, pauseButtonLogoBoxY, pauseButtonLogoBoxWidth, pauseButtonLogoBoxHeight;
float pauseButtonLogoBoxShape1X, pauseButtonLogoBoxShape1Y, pauseButtonLogoBoxShape1Width, pauseButtonLogoBoxShape1Height;
float pauseButtonLogoBoxShape2X, pauseButtonLogoBoxShape2Y, pauseButtonLogoBoxShape2Width, pauseButtonLogoBoxShape2Height;

float stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight;
float stopButtonLogoBoxX, stopButtonLogoBoxY, stopButtonLogoBoxWidth, stopButtonLogoBoxHeight;
float stopButtonLogoBoxShapeX, stopButtonLogoBoxShapeY, stopButtonLogoBoxShapeWidth, stopButtonLogoBoxShapeHeight;

float loopOnceButtonX, loopOnceButtonY, loopOnceButtonWidth, loopOnceButtonHeight;
float loopOnceButtonLogoBoxX, loopOnceButtonLogoBoxY, loopOnceButtonLogoBoxWidth, loopOnceButtonLogoBoxHeight;

float loopInfiniteButtonX, loopInfiniteButtonY, loopInfiniteButtonWidth, loopInfiniteButtonHeight;
float loopInfiniteButtonLogoBoxX, loopInfiniteButtonLogoBoxY, loopInfiniteButtonLogoBoxWidth, loopInfiniteButtonLogoBoxHeight;

float fastForwardButtonX, fastForwardButtonY, fastForwardButtonWidth, fastForwardButtonHeight;
float fastForwardButtonLogoBoxX, fastForwardButtonLogoBoxY, fastForwardButtonLogoBoxWidth, fastForwardButtonLogoBoxHeight;
float fastForwardButtonTringle1X1, fastForwardButtonTringle1Y1, fastForwardButtonTringle1X2, fastForwardButtonTringle1Y2, fastForwardButtonTringle1X3, fastForwardButtonTringle1Y3;
float fastForwardButtonTringle2X1, fastForwardButtonTringle2Y1, fastForwardButtonTringle2X2, fastForwardButtonTringle2Y2, fastForwardButtonTringle2X3, fastForwardButtonTringle2Y3;

float fastRewindButtonX, fastRewindButtonY, fastRewindButtonWidth, fastRewindButtonHeight;
float fastRewindButtonLogoBoxX, fastRewindButtonLogoBoxY, fastRewindButtonLogoBoxWidth, fastRewindButtonLogoBoxHeight;

float muteButtonX, muteButtonY, muteButtonWidth, muteButtonHeight;
float muteButtonLogoBoxX, muteButtonLogoBoxY, muteButtonLogoBoxWidth, muteButtonLogoBoxHeight;

float nextButtonX, nextButtonY, nextButtonWidth, nextButtonHeight;
float nextButtonLogoBoxX, nextButtonLogoBoxY, nextButtonLogoBoxWidth, nextButtonLogoBoxHeight;
float nextButtonLogoBoxShapeX, nextButtonLogoBoxShapeY, nextButtonLogoBoxShapeWidth, nextButtonLogoBoxShapeHeight;
float nextButtonLogoTringleX1, nextButtonLogoTringleY1, nextButtonLogoTringleX2, nextButtonLogoTringleY2, nextButtonLogoTringleX3, nextButtonLogoTringleY3;

float previousButtonX, previousButtonY, previousButtonWidth, previousButtonHeight;
float previousButtonLogoBoxX, previousButtonLogoBoxY, previousButtonLogoBoxWidth, previousButtonLogoBoxHeight;
float previousButtonLogoBoxShapeX, previousButtonLogoBoxShapeY, previousButtonLogoBoxShapeWidth, previousButtonLogoBoxShapeHeight;
float previousButtonLogoTringleX1, previousButtonLogoTringleY1, previousButtonLogoTringleX2, previousButtonLogoTringleY2, previousButtonLogoTringleX3, previousButtonLogoTringleY3;

float shuffleButtonX, shuffleButtonY, shuffleButtonWidth, shuffleButtonHeight;
float shuffleButtonLogoBoxX, shuffleButtonLogoBoxY, shuffleButtonLogoBoxWidth, shuffleButtonLogoBoxHeight;

float exitButtonX, exitButtonY, exitButtonWidth, exitButtonHeight;
float exitButtonLogoBoxX, exitButtonLogoBoxY, exitButtonLogoBoxWidth, exitButtonLogoBoxHeight;

float timeLineX, timeLineY, timeLineWidth, timeLineHeight;
float currentTimeX, currentTimeY, currentTimeWidth, currentTimeHeight;
float leftTimeX, leftTimeY, leftTimeWidth, leftTimeHeight;
float audioTimeX, audioTimeY, audioTimeWidth, audioTimeHeight;


void setup() {
  // Display
  //size(1280, 720);
  
  size(900, 600);
  appWidth = 900;
  appHeight = 600;
  surface.setAlwaysOnTop(true);

  // fullScreen();
  // appWidth = displayWidth;
  // appHeight = displayHeight;

  
  // Population
  // logo
  logoX = appWidth/50 * 1; 
  logoY = appHeight/50 * 1;
  logoWidth = appWidth/50 * 4;
  logoHeight = appHeight/50 * 4;
  // logoBox
  float logoBoxSmallerSide = (logoWidth < logoHeight) ? logoWidth : logoHeight;
  logoBoxX = logoX;
  logoBoxY = logoY + (logoHeight - logoBoxSmallerSide);
  logoBoxWidth = logoBoxSmallerSide;
  logoBoxHeight = logoBoxSmallerSide;

  // title
  titleX = appWidth/50 * 6;
  titleY = appHeight/50 * 1;
  titleWidth = appWidth/50 * 38;
  titleHeight = appHeight/50 * 4;

  // image
  imageX = appWidth/50 * 1;
  imageY = appHeight/50 * 6;
  imageWidth = appWidth/50 * 48;
  imageHeight = appHeight/50 * 34;

  // playButton
  playButtonX = appWidth/50 * 21;
  playButtonY = appHeight/50 * 41;
  playButtonWidth = appWidth/50 * 8;
  playButtonHeight = appHeight/50 * 3;
  // playButtonLogoBox
  float playButtonLogoBoxSamllerSide = (playButtonWidth < playButtonHeight) ? playButtonWidth : playButtonHeight;
  playButtonLogoBoxX = playButtonX + (playButtonWidth - playButtonLogoBoxSamllerSide) / 2;
  playButtonLogoBoxY = playButtonY + (playButtonHeight - playButtonLogoBoxSamllerSide) / 2;
  playButtonLogoBoxWidth = playButtonLogoBoxSamllerSide;
  playButtonLogoBoxHeight = playButtonLogoBoxSamllerSide;
  // playButtonLogoTringle
  playButtonLogoTringleX1 = (playButtonLogoBoxWidth/4 * 1) + playButtonLogoBoxX;
  playButtonLogoTringleY1 = (playButtonLogoBoxHeight/4 * 1) + playButtonLogoBoxY;
  playButtonLogoTringleX2 = (playButtonLogoBoxWidth/4 * 1) + playButtonLogoBoxX;
  playButtonLogoTringleY2 = (playButtonLogoBoxHeight/4 * 3) + playButtonLogoBoxY;
  playButtonLogoTringleX3 = (playButtonLogoBoxWidth/4 * 3) + playButtonLogoBoxX;
  playButtonLogoTringleY3 = (playButtonLogoBoxHeight/4 * 2) + playButtonLogoBoxY;

  // pauseButton
  pauseButtonX = appWidth/50 * 30;
  pauseButtonY = appHeight/50 * 41;
  pauseButtonWidth = appWidth/50 * 3;
  pauseButtonHeight = appHeight/50 * 3;
  // pauseButtonLogoBox
  float pauseButtonLogoBoxSmallerSide = (pauseButtonWidth < pauseButtonHeight) ? pauseButtonWidth : pauseButtonHeight;
  pauseButtonLogoBoxX = pauseButtonX + (pauseButtonWidth - pauseButtonLogoBoxSmallerSide) / 2;
  pauseButtonLogoBoxY = pauseButtonY + (pauseButtonHeight - pauseButtonLogoBoxSmallerSide) / 2;
  pauseButtonLogoBoxWidth = pauseButtonLogoBoxSmallerSide;
  pauseButtonLogoBoxHeight = pauseButtonLogoBoxSmallerSide;
  // pauseButtonLogoBoxShape1
  pauseButtonLogoBoxShape1X = (pauseButtonLogoBoxWidth/8 * 2) + pauseButtonLogoBoxX;
  pauseButtonLogoBoxShape1Y = (pauseButtonLogoBoxHeight/8 * 2) + pauseButtonLogoBoxY;
  pauseButtonLogoBoxShape1Width = (pauseButtonLogoBoxWidth/8 * 1);
  pauseButtonLogoBoxShape1Height = (pauseButtonLogoBoxHeight/8 * 4);
  // pauseButtonLogoBoxShape2
  pauseButtonLogoBoxShape2X = (pauseButtonLogoBoxWidth/8 * 5) + pauseButtonLogoBoxX;
  pauseButtonLogoBoxShape2Y = (pauseButtonLogoBoxHeight/8 * 2) + pauseButtonLogoBoxY;
  pauseButtonLogoBoxShape2Width = (pauseButtonLogoBoxWidth/8 * 1);
  pauseButtonLogoBoxShape2Height = (pauseButtonLogoBoxHeight/8 * 4);
  

  // stopButton
  stopButtonX = appWidth/50 * 17;
  stopButtonY = appHeight/50 * 41;
  stopButtonWidth = appWidth/50 * 3;
  stopButtonHeight = appHeight/50 * 3;
  // stopButtonLogoBox
  float stopButtonLogoBoxSmallerSide = (stopButtonWidth < stopButtonHeight) ? stopButtonWidth : stopButtonHeight;
  stopButtonLogoBoxX = stopButtonX + (stopButtonWidth - stopButtonLogoBoxSmallerSide) / 2;
  stopButtonLogoBoxY = stopButtonY + (stopButtonHeight - stopButtonLogoBoxSmallerSide) / 2;
  stopButtonLogoBoxWidth = stopButtonLogoBoxSmallerSide;
  stopButtonLogoBoxHeight = stopButtonLogoBoxSmallerSide;
  // stopButtonLogoBoxShape
  stopButtonLogoBoxShapeX = (stopButtonLogoBoxWidth/4 * 1) + stopButtonLogoBoxX;
  stopButtonLogoBoxShapeY = (stopButtonLogoBoxHeight/4 * 1) + stopButtonLogoBoxY;
  stopButtonLogoBoxShapeWidth = (stopButtonLogoBoxWidth/4 * 2);
  stopButtonLogoBoxShapeHeight = (stopButtonLogoBoxHeight/4 * 2);

  // loopOnceButton
  loopOnceButtonX = appWidth/50 * 34;
  loopOnceButtonY = appHeight/50 * 41;
  loopOnceButtonWidth = appWidth/50 * 3;
  loopOnceButtonHeight = appHeight/50 * 3;
  // loopOnceButtonLogoBox
  float loopOnceButtonLogoBoxSmallerSide = (loopOnceButtonWidth < loopOnceButtonHeight) ? loopOnceButtonWidth : loopOnceButtonHeight;
  loopOnceButtonLogoBoxX = loopOnceButtonX + (loopOnceButtonWidth - loopOnceButtonLogoBoxSmallerSide) / 2;
  loopOnceButtonLogoBoxY = loopOnceButtonY + (loopOnceButtonHeight - loopOnceButtonLogoBoxSmallerSide) / 2;
  loopOnceButtonLogoBoxWidth = loopOnceButtonLogoBoxSmallerSide;
  loopOnceButtonLogoBoxHeight = loopOnceButtonLogoBoxSmallerSide;

  // loopInfiniteButton (corrected typo)
  loopInfiniteButtonX = appWidth/50 * 38;
  loopInfiniteButtonY = appHeight/50 * 41;
  loopInfiniteButtonWidth = appWidth/50 * 3;
  loopInfiniteButtonHeight = appHeight/50 * 3;
  // loopInfiniteButtonLogoBox
  float loopInfiniteButtonLogoBoxSmallerSide = (loopInfiniteButtonWidth < loopInfiniteButtonHeight) ? loopInfiniteButtonWidth : loopInfiniteButtonHeight;
  loopInfiniteButtonLogoBoxX = loopInfiniteButtonX + (loopInfiniteButtonWidth - loopInfiniteButtonLogoBoxSmallerSide) / 2;
  loopInfiniteButtonLogoBoxY = loopInfiniteButtonY + (loopInfiniteButtonHeight - loopInfiniteButtonLogoBoxSmallerSide) / 2;
  loopInfiniteButtonLogoBoxWidth = loopInfiniteButtonLogoBoxSmallerSide;
  loopInfiniteButtonLogoBoxHeight = loopInfiniteButtonLogoBoxSmallerSide;

  // fastForwardButton
  fastForwardButtonX = appWidth/50 * 13;
  fastForwardButtonY = appHeight/50 * 41;
  fastForwardButtonWidth = appWidth/50 * 3;
  fastForwardButtonHeight = appHeight/50 * 3;
  // fastForwardButtonLogoBox
  float fastForwardButtonLogoBoxSmallerSide = (fastForwardButtonWidth < fastForwardButtonHeight) ? fastForwardButtonWidth : fastForwardButtonHeight;
  fastForwardButtonLogoBoxX = fastForwardButtonX + (fastForwardButtonWidth - fastForwardButtonLogoBoxSmallerSide) / 2;
  fastForwardButtonLogoBoxY = fastForwardButtonY + (fastForwardButtonHeight - fastForwardButtonLogoBoxSmallerSide) / 2;
  fastForwardButtonLogoBoxWidth = fastForwardButtonLogoBoxSmallerSide;
  fastForwardButtonLogoBoxHeight = fastForwardButtonLogoBoxSmallerSide;
  // fastForwardButtonTringle1
  fastForwardButtonTringle1X1 = (fastForwardButtonLogoBoxWidth/4 * 1) + fastForwardButtonLogoBoxX;
  fastForwardButtonTringle1Y1 = (fastForwardButtonLogoBoxHeight/4 * 1) + fastForwardButtonLogoBoxY;
  fastForwardButtonTringle1X2 = (fastForwardButtonLogoBoxWidth/4 * 1) + fastForwardButtonLogoBoxX;
  fastForwardButtonTringle1Y2 = (fastForwardButtonLogoBoxHeight/4 * 2) + fastForwardButtonLogoBoxY;
  fastForwardButtonTringle1X3 = (fastForwardButtonLogoBoxWidth/4 * 1) + fastForwardButtonLogoBoxX;
  fastForwardButtonTringle1Y3 = (fastForwardButtonLogoBoxHeight/4 * 3) + fastForwardButtonLogoBoxY;
  // fastForwardButtonTringle2
  fastForwardButtonTringle2X1 = (fastForwardButtonLogoBoxWidth/4 * 3) + fastForwardButtonLogoBoxX;
  fastForwardButtonTringle2Y1 = (fastForwardButtonLogoBoxHeight/4 * 1) + fastForwardButtonLogoBoxY;
  fastForwardButtonTringle2X2 = (fastForwardButtonLogoBoxWidth/4 * 3) + fastForwardButtonLogoBoxX;
  fastForwardButtonTringle2Y2 = (fastForwardButtonLogoBoxHeight/4 * 1) + fastForwardButtonLogoBoxY;
  fastForwardButtonTringle2X3 = (fastForwardButtonLogoBoxWidth/4 * 3) + fastForwardButtonLogoBoxX;
  fastForwardButtonTringle2Y3 = (fastForwardButtonLogoBoxHeight/4 * 2) + fastForwardButtonLogoBoxY;

  // fastRewindButton
  fastRewindButtonX = appWidth/50 * 9;
  fastRewindButtonY = appHeight/50 * 41;
  fastRewindButtonWidth = appWidth/50 * 3;
  fastRewindButtonHeight = appHeight/50 * 3;
  // fastRewindButtonLogoBox
  float fastRewindButtonLogoBoxSmallerSide = (fastRewindButtonWidth < fastRewindButtonHeight) ? fastRewindButtonWidth : fastRewindButtonHeight;
  fastRewindButtonLogoBoxX = fastRewindButtonX + (fastRewindButtonWidth - fastRewindButtonLogoBoxSmallerSide) / 2;
  fastRewindButtonLogoBoxY = fastRewindButtonY + (fastRewindButtonHeight - fastRewindButtonLogoBoxSmallerSide) / 2;
  fastRewindButtonLogoBoxWidth = fastRewindButtonLogoBoxSmallerSide;
  fastRewindButtonLogoBoxHeight = fastRewindButtonLogoBoxSmallerSide;

  // muteButton
  muteButtonX = appWidth/50 * 42;
  muteButtonY = appHeight/50 * 41;
  muteButtonWidth = appWidth/50 * 3;
  muteButtonHeight = appHeight/50 * 3;
  // muteButtonLogoBox
  float muteButtonLogoBoxSmallerSide = (muteButtonWidth < muteButtonHeight) ? muteButtonWidth : muteButtonHeight;
  muteButtonLogoBoxX = muteButtonX + (muteButtonWidth - muteButtonLogoBoxSmallerSide) / 2;
  muteButtonLogoBoxY = muteButtonY + (muteButtonHeight - muteButtonLogoBoxSmallerSide) / 2;
  muteButtonLogoBoxWidth = muteButtonLogoBoxSmallerSide;
  muteButtonLogoBoxHeight = muteButtonLogoBoxSmallerSide;

  // nextButton
  nextButtonX = appWidth/50 * 5;
  nextButtonY = appHeight/50 * 41;
  nextButtonWidth = appWidth/50 * 3;
  nextButtonHeight = appHeight/50 * 3;
  // nextButtonLogoBox
  float nextButtonLogoBoxSmallerSide = (nextButtonWidth < nextButtonHeight) ? nextButtonWidth : nextButtonHeight;
  nextButtonLogoBoxX = nextButtonX + (nextButtonWidth - nextButtonLogoBoxSmallerSide) / 2;
  nextButtonLogoBoxY = nextButtonY + (nextButtonHeight - nextButtonLogoBoxSmallerSide) / 2;
  nextButtonLogoBoxWidth = nextButtonLogoBoxSmallerSide;
  nextButtonLogoBoxHeight = nextButtonLogoBoxSmallerSide;
  // nextButtonLogoBoxShape
  nextButtonLogoBoxShapeX = (nextButtonLogoBoxWidth/8 * 2) + nextButtonLogoBoxX;

  // previousButton
  previousButtonX = appWidth/50 * 1;
  previousButtonY = appHeight/50 * 41;
  previousButtonWidth = appWidth/50 * 3;
  previousButtonHeight = appHeight/50 * 3;
  // previousButtonLogoBox
  float previousButtonLogoBoxSmallerSide = (previousButtonWidth < previousButtonHeight) ? previousButtonWidth : previousButtonHeight;
  previousButtonLogoBoxX = previousButtonX + (previousButtonWidth - previousButtonLogoBoxSmallerSide) / 2;
  previousButtonLogoBoxY = previousButtonY + (previousButtonHeight - previousButtonLogoBoxSmallerSide) / 2;
  previousButtonLogoBoxWidth = previousButtonLogoBoxSmallerSide;
  previousButtonLogoBoxHeight = previousButtonLogoBoxSmallerSide;
  // previousButtonLogoBoxShape
  previousButtonLogoBoxShapeX = (previousButtonLogoBoxWidth/8 * 2) + previousButtonLogoBoxX;
  previousButtonLogoBoxShapeY = (previousButtonLogoBoxHeight/8 * 2) + previousButtonLogoBoxY;
  previousButtonLogoBoxShapeWidth = (previousButtonLogoBoxWidth/8 * 1);
  previousButtonLogoBoxShapeHeight = (previousButtonLogoBoxHeight/8 * 4);
  // previousButtonLogoTringle
  previousButtonLogoTringleX1 = (previousButtonLogoBoxWidth/8 * 6) + previousButtonLogoBoxX;
  previousButtonLogoTringleY1 = (previousButtonLogoBoxHeight/8 * 2) + previousButtonLogoBoxY;
  previousButtonLogoTringleX2 = (previousButtonLogoBoxWidth/8 * 6) + previousButtonLogoBoxX;
  previousButtonLogoTringleY2 = (previousButtonLogoBoxHeight/8 * 6) + previousButtonLogoBoxY;
  previousButtonLogoTringleX3 = (previousButtonLogoBoxWidth/8 * 3) + previousButtonLogoBoxX;
  previousButtonLogoTringleY3 = (previousButtonLogoBoxHeight/8 * 4) + previousButtonLogoBoxY;

  // shuffleButton
  shuffleButtonX = appWidth/50 * 46;
  shuffleButtonY = appHeight/50 * 41;
  shuffleButtonWidth = appWidth/50 * 3;
  shuffleButtonHeight = appHeight/50 * 3;
  // shuffleButtonLogoBox
  float shuffleButtonLogoBoxSmallerSide = (shuffleButtonWidth < shuffleButtonHeight) ? shuffleButtonWidth : shuffleButtonHeight;
  shuffleButtonLogoBoxX = shuffleButtonX + (shuffleButtonWidth - shuffleButtonLogoBoxSmallerSide) / 2;
  shuffleButtonLogoBoxY = shuffleButtonY + (shuffleButtonHeight - shuffleButtonLogoBoxSmallerSide) / 2;
  shuffleButtonLogoBoxWidth = shuffleButtonLogoBoxSmallerSide;
  shuffleButtonLogoBoxHeight = shuffleButtonLogoBoxSmallerSide;

  // exitButton
  exitButtonX = appWidth/50 * (50 - 5);
  exitButtonY = appHeight/50 * 1;
  exitButtonWidth = appWidth/50 * 4;
  exitButtonHeight = appHeight/50 * 4;
  // exitButtonLogoBox
  float exitButtonLogoBoxSmallerSide = (exitButtonWidth < exitButtonHeight) ? exitButtonWidth : exitButtonHeight;
  exitButtonLogoBoxX = exitButtonX + (exitButtonWidth - exitButtonLogoBoxSmallerSide);
  exitButtonLogoBoxY = exitButtonY + (exitButtonHeight - exitButtonLogoBoxSmallerSide);
  exitButtonLogoBoxWidth = exitButtonLogoBoxSmallerSide;
  exitButtonLogoBoxHeight = exitButtonLogoBoxSmallerSide;

  // timeLine
  timeLineX = appWidth/50 * 10;
  timeLineY = appHeight/50 * 45;
  timeLineWidth = appWidth/50 * 21;
  timeLineHeight = appHeight/50 * 4;

  // currentTime
  currentTimeX = appWidth/50 * 1;
  currentTimeY = appHeight/50 * 45;
  currentTimeWidth = appWidth/50 * 8;
  currentTimeHeight = appHeight/50 * 4;

  // leftTime
  leftTimeX = appWidth/50 * 41;
  leftTimeY = appHeight/50 * 45;
  leftTimeWidth = appWidth/50 * 8;
  leftTimeHeight = appHeight/50 * 4;

  // audioTime
  audioTimeX = appWidth/50 * 32;
  audioTimeY = appHeight/50 * 45;
  audioTimeWidth = appWidth/50 * 8;
  audioTimeHeight = appHeight/50 * 4;



  // Draw
  // rect(logoX, logoY, logoWidth, logoHeight);
  rect(logoBoxX, logoBoxY, logoBoxWidth, logoBoxHeight);

  rect(titleX, titleY, titleWidth, titleHeight);
  rect(imageX, imageY, imageWidth, imageHeight);

  // rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  rect(playButtonLogoBoxX, playButtonLogoBoxY, playButtonLogoBoxWidth, playButtonLogoBoxHeight);
  triangle(playButtonLogoTringleX1, playButtonLogoTringleY1, playButtonLogoTringleX2, playButtonLogoTringleY2, playButtonLogoTringleX3, playButtonLogoTringleY3);

  // rect(pauseButtonX, pauseButtonY, pauseButtonWidth, pauseButtonHeight);
  rect(pauseButtonLogoBoxX, pauseButtonLogoBoxY, pauseButtonLogoBoxWidth, pauseButtonLogoBoxHeight);
  rect(pauseButtonLogoBoxShape1X, pauseButtonLogoBoxShape1Y, pauseButtonLogoBoxShape1Width, pauseButtonLogoBoxShape1Height);
  rect(pauseButtonLogoBoxShape2X, pauseButtonLogoBoxShape2Y, pauseButtonLogoBoxShape2Width, pauseButtonLogoBoxShape2Height);

  // rect(stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight);
  rect(stopButtonLogoBoxX, stopButtonLogoBoxY, stopButtonLogoBoxWidth, stopButtonLogoBoxHeight);
  rect(stopButtonLogoBoxShapeX, stopButtonLogoBoxShapeY, stopButtonLogoBoxShapeWidth, stopButtonLogoBoxShapeHeight);

  // rect(loopOnceButtonX, loopOnceButtonY, loopOnceButtonWidth, loopOnceButtonHeight);
  rect(loopOnceButtonLogoBoxX, loopOnceButtonLogoBoxY, loopOnceButtonLogoBoxWidth, loopOnceButtonLogoBoxHeight);

  // rect(loopInfiniteButtonX, loopInfiniteButtonY, loopInfiniteButtonWidth, loopInfiniteButtonHeight);
  rect(loopInfiniteButtonLogoBoxX, loopInfiniteButtonLogoBoxY, loopInfiniteButtonLogoBoxWidth, loopInfiniteButtonLogoBoxHeight);

  // rect(fastForwardButtonX, fastForwardButtonY, fastForwardButtonWidth, fastForwardButtonHeight);
  rect(fastForwardButtonLogoBoxX, fastForwardButtonLogoBoxY, fastForwardButtonLogoBoxWidth, fastForwardButtonLogoBoxHeight);

  // rect(fastRewindButtonX, fastRewindButtonY, fastRewindButtonWidth, fastRewindButtonHeight);
  rect(fastRewindButtonLogoBoxX, fastRewindButtonLogoBoxY, fastRewindButtonLogoBoxWidth, fastRewindButtonLogoBoxHeight);

  // rect(muteButtonX, muteButtonY, muteButtonWidth, muteButtonHeight);
  rect(muteButtonLogoBoxX, muteButtonLogoBoxY, muteButtonLogoBoxWidth, muteButtonLogoBoxHeight);

  // rect(nextButtonX, nextButtonY, nextButtonWidth, nextButtonHeight);
  rect(nextButtonLogoBoxX, nextButtonLogoBoxY, nextButtonLogoBoxWidth, nextButtonLogoBoxHeight);
  rect(nextButtonLogoBoxShapeX, nextButtonLogoBoxShapeY, nextButtonLogoBoxShapeWidth, nextButtonLogoBoxShapeHeight);
  triangle(nextButtonLogoTringleX1, nextButtonLogoTringleY1, nextButtonLogoTringleX2, nextButtonLogoTringleY2, nextButtonLogoTringleX3, nextButtonLogoTringleY3);

  // rect(previousButtonX, previousButtonY, previousButtonWidth, previousButtonHeight);
  rect(previousButtonLogoBoxX, previousButtonLogoBoxY, previousButtonLogoBoxWidth, previousButtonLogoBoxHeight);
  rect(previousButtonLogoBoxShapeX, previousButtonLogoBoxShapeY, previousButtonLogoBoxShapeWidth, previousButtonLogoBoxShapeHeight);
  triangle(previousButtonLogoTringleX1, previousButtonLogoTringleY1, previousButtonLogoTringleX2, previousButtonLogoTringleY2, previousButtonLogoTringleX3, previousButtonLogoTringleY3);

  // rect(shuffleButtonX, shuffleButtonY, shuffleButtonWidth, shuffleButtonHeight);
  rect(shuffleButtonLogoBoxX, shuffleButtonLogoBoxY, shuffleButtonLogoBoxWidth, shuffleButtonLogoBoxHeight);

  // rect(exitButtonX, exitButtonY, exitButtonWidth, exitButtonHeight);
  rect(exitButtonLogoBoxX, exitButtonLogoBoxY, exitButtonLogoBoxWidth, exitButtonLogoBoxHeight);

  rect(timeLineX, timeLineY, timeLineWidth, timeLineHeight);
  rect(currentTimeX, currentTimeY, currentTimeWidth, currentTimeHeight);
  rect(leftTimeX, leftTimeY, leftTimeWidth, leftTimeHeight);
  rect(audioTimeX, audioTimeY, audioTimeWidth, audioTimeHeight);
} // End Setup


void draw() {
} // End draw


void mousePressed() {
} // End mousePressed


void keyPressed() {
} // End keyPressed
