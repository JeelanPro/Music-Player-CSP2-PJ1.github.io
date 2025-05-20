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
// Loop Once Symbol
float loopOnceArcCenterX, loopOnceArcCenterY, loopOnceArcDiameter;
float loopOnceArcStartAngle, loopOnceArcStopAngle;
float loopOnceArrowheadX1, loopOnceArrowheadY1, loopOnceArrowheadX2, loopOnceArrowheadY2, loopOnceArrowheadX3, loopOnceArrowheadY3;
String loopOnceTextContent = "1";
float loopOnceTextPosX, loopOnceTextPosY, loopOnceTextSizeVal;

float loopInfiniteButtonX, loopInfiniteButtonY, loopInfiniteButtonWidth, loopInfiniteButtonHeight;
float loopInfiniteButtonLogoBoxX, loopInfiniteButtonLogoBoxY, loopInfiniteButtonLogoBoxWidth, loopInfiniteButtonLogoBoxHeight;
// Loop Infinite Symbol (Infinity Sign ∞)
float loopInfiniteEllipse1X, loopInfiniteEllipse1Y, loopInfiniteEllipse2X, loopInfiniteEllipse2Y;
float loopInfiniteEllipseWidth, loopInfiniteEllipseHeight;

float fastForwardButtonX, fastForwardButtonY, fastForwardButtonWidth, fastForwardButtonHeight;
float fastForwardButtonLogoBoxX, fastForwardButtonLogoBoxY, fastForwardButtonLogoBoxWidth, fastForwardButtonLogoBoxHeight;
float fastForwardButtonTringle1X1, fastForwardButtonTringle1Y1, fastForwardButtonTringle1X2, fastForwardButtonTringle1Y2, fastForwardButtonTringle1X3, fastForwardButtonTringle1Y3;
float fastForwardButtonTringle2X1, fastForwardButtonTringle2Y1, fastForwardButtonTringle2X2, fastForwardButtonTringle2Y2, fastForwardButtonTringle2X3, fastForwardButtonTringle2Y3;

float fastRewindButtonX, fastRewindButtonY, fastRewindButtonWidth, fastRewindButtonHeight;
float fastRewindButtonLogoBoxX, fastRewindButtonLogoBoxY, fastRewindButtonLogoBoxWidth, fastRewindButtonLogoBoxHeight;
float fastRewindButtonTringle1X1, fastRewindButtonTringle1Y1, fastRewindButtonTringle1X2, fastRewindButtonTringle1Y2, fastRewindButtonTringle1X3, fastRewindButtonTringle1Y3;
float fastRewindButtonTringle2X1, fastRewindButtonTringle2Y1, fastRewindButtonTringle2X2, fastRewindButtonTringle2Y2, fastRewindButtonTringle2X3, fastRewindButtonTringle2Y3;

float muteButtonX, muteButtonY, muteButtonWidth, muteButtonHeight;
float muteButtonLogoBoxX, muteButtonLogoBoxY, muteButtonLogoBoxWidth, muteButtonLogoBoxHeight;
float muteSpeakerRectX, muteSpeakerRectY, muteSpeakerRectWidth, muteSpeakerRectHeight;
float muteSpeakerTriangleX1, muteSpeakerTriangleY1, muteSpeakerTriangleX2, muteSpeakerTriangleY2, muteSpeakerTriangleX3, muteSpeakerTriangleY3;
float muteDiagonalLineX1, muteDiagonalLineY1, muteDiagonalLineX2, muteDiagonalLineY2;

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
float shuffleLine1X1, shuffleLine1Y1, shuffleLine1X2, shuffleLine1Y2;
float shuffleLine1ArrowAX2, shuffleLine1ArrowAY2;
float shuffleLine1ArrowBX2, shuffleLine1ArrowBY2;
float shuffleLine2X1, shuffleLine2Y1, shuffleLine2X2, shuffleLine2Y2;
float shuffleLine2ArrowAX2, shuffleLine2ArrowAY2;
float shuffleLine2ArrowBX2, shuffleLine2ArrowBY2;

float exitButtonX, exitButtonY, exitButtonWidth, exitButtonHeight;
float exitButtonLogoBoxX, exitButtonLogoBoxY, exitButtonLogoBoxWidth, exitButtonLogoBoxHeight;
float exitLine1X1, exitLine1Y1, exitLine1X2, exitLine1Y2;
float exitLine2X1, exitLine2Y1, exitLine2X2, exitLine2Y2;

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
  // fullScreen();
  // appWidth = displayWidth;
  // appHeight = displayHeight;

  
  // Population
  // Minim
  currentAudio = 0;
  minim = new Minim(this);
  playList[0] = minim.loadFile("Audio/skibidi-toilet.mp3");
  playList[1] = minim.loadFile("Audio/qaseda.mp3");
  playList[2] = minim.loadFile("Audio/Virus.mp3");
  
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

  // Loop Once Symbol Calculations
  loopOnceArcCenterX = loopOnceButtonLogoBoxX + loopOnceButtonLogoBoxWidth / 2.0;
  loopOnceArcCenterY = loopOnceButtonLogoBoxY + loopOnceButtonLogoBoxHeight / 2.0;
  loopOnceArcDiameter = min(loopOnceButtonLogoBoxWidth, loopOnceButtonLogoBoxHeight) * 0.65;
  loopOnceArcStartAngle = QUARTER_PI; // Start angle for the arc
  loopOnceArcStopAngle = TWO_PI - HALF_PI;   // End angle for the arc, leaving space for arrowhead

  float tipX = loopOnceArcCenterX + cos(loopOnceArcStopAngle) * (loopOnceArcDiameter / 2.0);
  float tipY = loopOnceArcCenterY + sin(loopOnceArcStopAngle) * (loopOnceArcDiameter / 2.0);
  loopOnceArrowheadX1 = tipX;
  loopOnceArrowheadY1 = tipY;
  float arrowBaseOffsetAngle = 0.25; // Radians: how far "back" along the arc the arrowhead base is
  float arrowHalfWidth = loopOnceArcDiameter * 0.12; // How "wide" the arrowhead base is from the arc radius
  loopOnceArrowheadX2 = loopOnceArcCenterX + (loopOnceArcDiameter/2 - arrowHalfWidth) * cos(loopOnceArcStopAngle - arrowBaseOffsetAngle);
  loopOnceArrowheadY2 = loopOnceArcCenterY + (loopOnceArcDiameter/2 - arrowHalfWidth) * sin(loopOnceArcStopAngle - arrowBaseOffsetAngle);
  loopOnceArrowheadX3 = loopOnceArcCenterX + (loopOnceArcDiameter/2 + arrowHalfWidth) * cos(loopOnceArcStopAngle - arrowBaseOffsetAngle);
  loopOnceArrowheadY3 = loopOnceArcCenterY + (loopOnceArcDiameter/2 + arrowHalfWidth) * sin(loopOnceArcStopAngle - arrowBaseOffsetAngle);
  
  loopOnceTextPosX = loopOnceArcCenterX;
  loopOnceTextPosY = loopOnceArcCenterY;
  loopOnceTextSizeVal = loopOnceArcDiameter * 0.5;

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

  // Loop Infinite Symbol (Infinity Sign ∞) Calculations
  float infinitySymbolCenterX = loopInfiniteButtonLogoBoxX + loopInfiniteButtonLogoBoxWidth / 2.0;
  float infinitySymbolCenterY = loopInfiniteButtonLogoBoxY + loopInfiniteButtonLogoBoxHeight / 2.0;
  loopInfiniteEllipseWidth = loopInfiniteButtonLogoBoxWidth * 0.35; // Width of one loop of infinity
  loopInfiniteEllipseHeight = loopInfiniteButtonLogoBoxHeight * 0.45; // Height of one loop of infinity
  loopInfiniteEllipse1X = infinitySymbolCenterX - loopInfiniteEllipseWidth / 2.0;
  loopInfiniteEllipse1Y = infinitySymbolCenterY;
  loopInfiniteEllipse2X = infinitySymbolCenterX + loopInfiniteEllipseWidth / 2.0;
  loopInfiniteEllipse2Y = infinitySymbolCenterY;

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
  fastForwardButtonTringle1Y2 = (fastForwardButtonLogoBoxHeight/4 * 3) + fastForwardButtonLogoBoxY;
  fastForwardButtonTringle1X3 = (fastForwardButtonLogoBoxWidth/4 * 2) + fastForwardButtonLogoBoxX;
  fastForwardButtonTringle1Y3 = (fastForwardButtonLogoBoxHeight/4 * 2) + fastForwardButtonLogoBoxY;
  // fastForwardButtonTringle2
  fastForwardButtonTringle2X1 = (fastForwardButtonLogoBoxWidth/4 * 2) + fastForwardButtonLogoBoxX;
  fastForwardButtonTringle2Y1 = (fastForwardButtonLogoBoxHeight/4 * 1) + fastForwardButtonLogoBoxY;
  fastForwardButtonTringle2X2 = (fastForwardButtonLogoBoxWidth/4 * 2) + fastForwardButtonLogoBoxX;
  fastForwardButtonTringle2Y2 = (fastForwardButtonLogoBoxHeight/4 * 3) + fastForwardButtonLogoBoxY;
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
  // fastRewindButtonTringle1
  fastRewindButtonTringle1X1 = (fastRewindButtonLogoBoxWidth/4 * 1) + fastRewindButtonLogoBoxX;
  fastRewindButtonTringle1Y1 = (fastRewindButtonLogoBoxHeight/4 * 2) + fastRewindButtonLogoBoxY;
  fastRewindButtonTringle1X2 = (fastRewindButtonLogoBoxWidth/4 * 2) + fastRewindButtonLogoBoxX;
  fastRewindButtonTringle1Y2 = (fastRewindButtonLogoBoxHeight/4 * 1) + fastRewindButtonLogoBoxY;
  fastRewindButtonTringle1X3 = (fastRewindButtonLogoBoxWidth/4 * 2) + fastRewindButtonLogoBoxX;
  fastRewindButtonTringle1Y3 = (fastRewindButtonLogoBoxHeight/4 * 3) + fastRewindButtonLogoBoxY;
  // fastRewindButtonTringle2
  fastRewindButtonTringle2X1 = (fastRewindButtonLogoBoxWidth/4 * 3) + fastRewindButtonLogoBoxX;
  fastRewindButtonTringle2Y1 = (fastRewindButtonLogoBoxHeight/4 * 1) + fastRewindButtonLogoBoxY;
  fastRewindButtonTringle2X2 = (fastRewindButtonLogoBoxWidth/4 * 2) + fastRewindButtonLogoBoxX;
  fastRewindButtonTringle2Y2 = (fastRewindButtonLogoBoxHeight/4 * 2) + fastRewindButtonLogoBoxY;
  fastRewindButtonTringle2X3 = (fastRewindButtonLogoBoxWidth/4 * 3) + fastRewindButtonLogoBoxX;
  fastRewindButtonTringle2Y3 = (fastRewindButtonLogoBoxHeight/4 * 3) + fastRewindButtonLogoBoxY;

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
  muteSpeakerRectWidth = muteButtonLogoBoxWidth * 0.3;
  muteSpeakerRectHeight = muteButtonLogoBoxHeight * 0.5;
  muteSpeakerRectX = muteButtonLogoBoxX + muteButtonLogoBoxWidth * 0.1;
  muteSpeakerRectY = muteButtonLogoBoxY + (muteButtonLogoBoxHeight - muteSpeakerRectHeight) / 2.0;

  // Speaker triangle
  muteSpeakerTriangleX1 = muteSpeakerRectX + muteSpeakerRectWidth;
  muteSpeakerTriangleY1 = muteSpeakerRectY;
  muteSpeakerTriangleX2 = muteSpeakerRectX + muteSpeakerRectWidth;
  muteSpeakerTriangleY2 = muteSpeakerRectY + muteSpeakerRectHeight;
  muteSpeakerTriangleX3 = muteSpeakerTriangleX1 + muteSpeakerRectWidth * 0.6;
  muteSpeakerTriangleY3 = muteSpeakerRectY + muteSpeakerRectHeight / 2.0;

  // Diagonal line
  muteDiagonalLineX1 = muteButtonLogoBoxX + muteButtonLogoBoxWidth * 0.2;
  muteDiagonalLineY1 = muteButtonLogoBoxY + muteButtonLogoBoxHeight * 0.2;
  muteDiagonalLineX2 = muteButtonLogoBoxX + muteButtonLogoBoxWidth * 0.8;
  muteDiagonalLineY2 = muteButtonLogoBoxY + muteButtonLogoBoxHeight * 0.8;

  // nextButton
  nextButtonX = appWidth/50 * 5;

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
  nextButtonLogoBoxShapeX = (nextButtonLogoBoxWidth/8 * 5) + nextButtonLogoBoxX;
  nextButtonLogoBoxShapeY = (nextButtonLogoBoxHeight/8 * 2) + nextButtonLogoBoxY;
  nextButtonLogoBoxShapeWidth = (nextButtonLogoBoxWidth/8 * 1);
  nextButtonLogoBoxShapeHeight = (nextButtonLogoBoxHeight/8 * 4);
  // nextButtonLogoTringle
  nextButtonLogoTringleX1 = (nextButtonLogoBoxWidth/8 * 2) + nextButtonLogoBoxX;
  nextButtonLogoTringleY1 = (nextButtonLogoBoxHeight/8 * 2) + nextButtonLogoBoxY;
  nextButtonLogoTringleX2 = (nextButtonLogoBoxWidth/8 * 5) + nextButtonLogoBoxX;
  nextButtonLogoTringleY2 = (nextButtonLogoBoxHeight/8 * 4) + nextButtonLogoBoxY;
  nextButtonLogoTringleX3 = (nextButtonLogoBoxWidth/8 * 2) + nextButtonLogoBoxX;
  nextButtonLogoTringleY3 = (nextButtonLogoBoxHeight/8 * 6) + nextButtonLogoBoxY;

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
  // Shuffle Symbol Calculations
  float shufflePadding = shuffleButtonLogoBoxWidth / 4.0;
  float shuffleArrowHeadSize = shuffleButtonLogoBoxWidth / 5.0;
  // Line 1: Top-left to Bottom-right
  shuffleLine1X1 = shuffleButtonLogoBoxX + shufflePadding;
  shuffleLine1Y1 = shuffleButtonLogoBoxY + shufflePadding;
  shuffleLine1X2 = shuffleButtonLogoBoxX + shuffleButtonLogoBoxWidth - shufflePadding;
  shuffleLine1Y2 = shuffleButtonLogoBoxY + shuffleButtonLogoBoxHeight - shufflePadding;
  // Arrowhead for Line 1 (at its end: shuffleLine1X2, shuffleLine1Y2)
  shuffleLine1ArrowAX2 = shuffleLine1X2 - shuffleArrowHeadSize;
  shuffleLine1ArrowAY2 = shuffleLine1Y2;
  shuffleLine1ArrowBX2 = shuffleLine1X2;
  shuffleLine1ArrowBY2 = shuffleLine1Y2 - shuffleArrowHeadSize;
  // Line 2: Bottom-left to Top-right
  shuffleLine2X1 = shuffleButtonLogoBoxX + shufflePadding;
  shuffleLine2Y1 = shuffleButtonLogoBoxY + shuffleButtonLogoBoxHeight - shufflePadding;
  shuffleLine2X2 = shuffleButtonLogoBoxX + shuffleButtonLogoBoxWidth - shufflePadding;
  shuffleLine2Y2 = shuffleButtonLogoBoxY + shufflePadding;
  // Arrowhead for Line 2 (at its end: shuffleLine2X2, shuffleLine2Y2)
  shuffleLine2ArrowAX2 = shuffleLine2X2 - shuffleArrowHeadSize;
  shuffleLine2ArrowAY2 = shuffleLine2Y2;
  shuffleLine2ArrowBX2 = shuffleLine2X2;
  shuffleLine2ArrowBY2 = shuffleLine2Y2 + shuffleArrowHeadSize;

  // exitButton
  exitButtonX = appWidth/50 * (50 - 5);
  exitButtonY = appHeight/50 * 1;
  exitButtonWidth = appWidth/50 * 4;
  exitButtonHeight = appHeight/50 * 4;
  // exitButtonLogoBox
  float exitButtonLogoBoxSmallerSide = (exitButtonWidth < exitButtonHeight) ? exitButtonWidth : exitButtonHeight;
  exitButtonLogoBoxX = exitButtonX + (exitButtonWidth - exitButtonLogoBoxSmallerSide); // Adjusted to be on the right side of the button
  exitButtonLogoBoxY = exitButtonY; // Adjusted to be at the top of the button
  exitButtonLogoBoxWidth = exitButtonLogoBoxSmallerSide;
  exitButtonLogoBoxHeight = exitButtonLogoBoxSmallerSide;
  // Exit Symbol ("X") Calculations
  float exitPadding = exitButtonLogoBoxWidth / 4.0;
  // Line 1: Top-left to Bottom-right
  exitLine1X1 = exitButtonLogoBoxX + exitPadding;
  exitLine1Y1 = exitButtonLogoBoxY + exitPadding;
  exitLine1X2 = exitButtonLogoBoxX + exitButtonLogoBoxWidth - exitPadding;
  exitLine1Y2 = exitButtonLogoBoxY + exitButtonLogoBoxHeight - exitPadding;
  // Line 2: Top-right to Bottom-left
  exitLine2X1 = exitButtonLogoBoxX + exitButtonLogoBoxWidth - exitPadding;
  exitLine2Y1 = exitButtonLogoBoxY + exitPadding;
  exitLine2X2 = exitButtonLogoBoxX + exitPadding;
  exitLine2Y2 = exitButtonLogoBoxY + exitButtonLogoBoxHeight - exitPadding;


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
  // Draw Loop Once Symbol
  pushStyle();
  float commonStrokeWeight = max(1, loopOnceButtonLogoBoxWidth / 22.0);
  stroke(0);
  strokeWeight(commonStrokeWeight);
  noFill();
  arc(loopOnceArcCenterX, loopOnceArcCenterY, loopOnceArcDiameter, loopOnceArcDiameter, loopOnceArcStartAngle, loopOnceArcStopAngle);
  fill(0); // Arrowhead filled
  noStroke();
  triangle(loopOnceArrowheadX1, loopOnceArrowheadY1, loopOnceArrowheadX2, loopOnceArrowheadY2, loopOnceArrowheadX3, loopOnceArrowheadY3);
  fill(0); // Text color
  textAlign(CENTER, CENTER);
  textSize(loopOnceTextSizeVal);
  text(loopOnceTextContent, loopOnceTextPosX, loopOnceTextPosY);
  popStyle();

  // rect(loopInfiniteButtonX, loopInfiniteButtonY, loopInfiniteButtonWidth, loopInfiniteButtonHeight);
  rect(loopInfiniteButtonLogoBoxX, loopInfiniteButtonLogoBoxY, loopInfiniteButtonLogoBoxWidth, loopInfiniteButtonLogoBoxHeight);
  // Draw Loop Infinite Symbol (Infinity Sign ∞)
  pushStyle();
  stroke(0);
  strokeWeight(max(1, loopInfiniteButtonLogoBoxWidth / 22.0));
  noFill();
  ellipseMode(CENTER);
  ellipse(loopInfiniteEllipse1X, loopInfiniteEllipse1Y, loopInfiniteEllipseWidth, loopInfiniteEllipseHeight);
  ellipse(loopInfiniteEllipse2X, loopInfiniteEllipse2Y, loopInfiniteEllipseWidth, loopInfiniteEllipseHeight);
  popStyle();

  // rect(fastForwardButtonX, fastForwardButtonY, fastForwardButtonWidth, fastForwardButtonHeight);
  rect(fastForwardButtonLogoBoxX, fastForwardButtonLogoBoxY, fastForwardButtonLogoBoxWidth, fastForwardButtonLogoBoxHeight);
  triangle(fastForwardButtonTringle1X1, fastForwardButtonTringle1Y1, fastForwardButtonTringle1X2, fastForwardButtonTringle1Y2, fastForwardButtonTringle1X3, fastForwardButtonTringle1Y3);
  triangle(fastForwardButtonTringle2X1, fastForwardButtonTringle2Y1, fastForwardButtonTringle2X2, fastForwardButtonTringle2Y2, fastForwardButtonTringle2X3, fastForwardButtonTringle2Y3);

  // rect(fastRewindButtonX, fastRewindButtonY, fastRewindButtonWidth, fastRewindButtonHeight);
  rect(fastRewindButtonLogoBoxX, fastRewindButtonLogoBoxY, fastRewindButtonLogoBoxWidth, fastRewindButtonLogoBoxHeight);
  triangle(fastRewindButtonTringle1X1, fastRewindButtonTringle1Y1, fastRewindButtonTringle1X2, fastRewindButtonTringle1Y2, fastRewindButtonTringle1X3, fastRewindButtonTringle1Y3);
  triangle(fastRewindButtonTringle2X1, fastRewindButtonTringle2Y1, fastRewindButtonTringle2X2, fastRewindButtonTringle2Y2, fastRewindButtonTringle2X3, fastRewindButtonTringle2Y3);

  // rect(muteButtonX, muteButtonY, muteButtonWidth, muteButtonHeight);
  rect(muteButtonLogoBoxX, muteButtonLogoBoxY, muteButtonLogoBoxWidth, muteButtonLogoBoxHeight);
  pushStyle();
  stroke(0);
  strokeWeight(max(1, muteButtonLogoBoxWidth / 25.0));
  fill(0);
  rect(muteSpeakerRectX, muteSpeakerRectY, muteSpeakerRectWidth, muteSpeakerRectHeight);
  triangle(muteSpeakerTriangleX1, muteSpeakerTriangleY1, muteSpeakerTriangleX2, muteSpeakerTriangleY2, muteSpeakerTriangleX3, muteSpeakerTriangleY3);
  stroke(255, 0, 0); // Red diagonal line
  line(muteDiagonalLineX1, muteDiagonalLineY1, muteDiagonalLineX2, muteDiagonalLineY2);
  popStyle();

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
  pushStyle();
  stroke(0);
  strokeWeight(max(1, shuffleButtonLogoBoxWidth / 25.0));
  line(shuffleLine1X1, shuffleLine1Y1, shuffleLine1X2, shuffleLine1Y2);
  line(shuffleLine1X2, shuffleLine1Y2, shuffleLine1ArrowAX2, shuffleLine1ArrowAY2);
  line(shuffleLine1X2, shuffleLine1Y2, shuffleLine1ArrowBX2, shuffleLine1ArrowBY2);
  line(shuffleLine2X1, shuffleLine2Y1, shuffleLine2X2, shuffleLine2Y2);
  line(shuffleLine2X2, shuffleLine2Y2, shuffleLine2ArrowAX2, shuffleLine2ArrowAY2);
  line(shuffleLine2X2, shuffleLine2Y2, shuffleLine2ArrowBX2, shuffleLine2ArrowBY2);
  popStyle();


  // rect(exitButtonX, exitButtonY, exitButtonWidth, exitButtonHeight);
  rect(exitButtonLogoBoxX, exitButtonLogoBoxY, exitButtonLogoBoxWidth, exitButtonLogoBoxHeight);
  pushStyle();
  stroke(0);
  strokeWeight(max(1, exitButtonLogoBoxWidth / 15.0));
  line(exitLine1X1, exitLine1Y1, exitLine1X2, exitLine1Y2);
  line(exitLine2X1, exitLine2Y1, exitLine2X2, exitLine2Y2);
  popStyle();

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
  /*
  12 important buttons based on the keyboard
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
   Play          | p, P
   Pause         | o, O
   Stop          | s, S
   Loop Once     | l, L
   Loop Infinite | i, I
   Fast Forward  | f, F, [RIGHT ARROW]
   Fast Rewind   | r, R, [LEFT ARROW]
   Mute          | m, M
   Next Song     | n, N, [DOWN ARROW]
   Previous Song | b, B, [UP ARROW]
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
  if (key == CODED || key == RIGHT) {
    playList[currentAudio].skip(1000);
  }

  // Fast Rewind
  if (key == 'r' || key == 'R') {
    playList[currentAudio].skip(-1000);
  }
  if (key == CODED || key == LEFT) {
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
  if (key == CODED && keyCode == DOWN) {
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
  if (key == CODED && keyCode == UP) {
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
