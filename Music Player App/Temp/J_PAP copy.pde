// Library Imports - Minim for Audio
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// --- Global Variables ---

// Audio Engine and Tracks
Minim audioEngine; // Renamed from minim
int totalTracks = 3; // Renamed from numberOfSongs
AudioPlayer[] audioTracks = new AudioPlayer[totalTracks]; // Renamed from playList
String[] albumArtPaths = new String[totalTracks]; // Renamed from imagePath
int currentTrackIndex = 0; // Renamed from currentAudio
boolean isPlayingAudio = false; // Renamed from isPlay

// Display and Units
int appWidth, appHeight; // DO NOT RENAME
float horizontalUnitCm; // Renamed from ANP (Unit for width based on cm)
float verticalUnitCm; // Renamed from BNP (Unit for height based on cm)

// UI Element Coordinates and Dimensions (Calculated in setup)
// Using descriptive names based on visual layout
float topLeftIconContainerX, topLeftIconContainerY, topLeftIconContainerW, topLeftIconContainerH;
float titleAreaX, titleAreaY, titleAreaW, titleAreaH;
float topRightIconContainerX, topRightIconContainerY, topRightIconContainerW, topRightIconContainerH;
float mainImageDisplayAreaX, mainImageDisplayAreaY, mainImageDisplayAreaW, mainImageDisplayAreaH;
float progressBarAreaX, progressBarAreaY, progressBarAreaW, progressBarAreaH;
float volumeBarAreaX, volumeBarAreaY, volumeBarAreaW, volumeBarAreaH;

// Button Area Coordinates (Individual buttons calculated from these)
float buttonRowY;
float buttonSizeCm = 1.0; // Size of square buttons in cm
float playButtonSizeCmW = 1.5; // Width of play button in cm

// Specific Button Coordinates & Sizes (Calculated in setup)
float stopButtonX, stopButtonY, stopButtonSize;
float pauseButtonX, pauseButtonY, pauseButtonSize;
// float ffButtonX, ffButtonY, ffButtonSize; // Fast Forward - Not drawn in original active code
float nextButtonX, nextButtonY, nextButtonSize;
// float a5ButtonX, a5ButtonY, a5ButtonSize; // Button 'a5' - Not drawn in original active code
float playButtonX, playButtonY, playButtonW, playButtonH; // Play button is rectangular
// float rwButtonX, rwButtonY, rwButtonSize; // Rewind - Not drawn in original active code
float prevButtonX, prevButtonY, prevButtonSize;
// float b3ButtonX, b3ButtonY, b3ButtonSize; // Button 'b3' - Not drawn in original active code
// float b4ButtonX, b4ButtonY, b4ButtonSize; // Button 'b4' - Not drawn in original active code
// float b5ButtonX, b5ButtonY, b5ButtonSize; // Button 'b5' - Not drawn in original active code

// Colors
color defaultFillColor = #FFFFFF; // White
color defaultStrokeColor = #000000; // Black
color titleTextColor = #000000; // Black for title

// --- Core Processing Functions ---

void setup() {
  // --- Initialization ---
  fullScreen(); // Set display to fullscreen
  appWidth = displayWidth; // Assign screen width
  appHeight = displayHeight; // Assign screen height

  // Calculate unit sizes based on screen dimensions (assuming 17.5cm width, 15cm height reference)
  horizontalUnitCm = appWidth / 17.5; // Pixels per cm horizontally
  verticalUnitCm = appHeight / 15.0; // Pixels per cm vertically

  // Initialize Audio Engine
  audioEngine = new Minim(this);

  // Load Audio Files
  audioTracks[0] = audioEngine.loadFile("Songs/skibidi-toilet.mp3");
  audioTracks[1] = audioEngine.loadFile("Songs/qaseda.mp3");
  audioTracks[2] = audioEngine.loadFile("Songs/Virus.mp3");

  // Define Image Paths
  albumArtPaths[0] = "Images/Skibidi.jpg";
  albumArtPaths[1] = "Images/JeelanPro.jpg";
  albumArtPaths[2] = "Images/Virus.jpg";

  // Set initial track index
  currentTrackIndex = 0;
  isPlayingAudio = false; // Start paused

  // --- Calculate UI Element Positions and Sizes ---
  // These calculations replace the direct calls in the original setup using cm units

  // Top Row Elements
  topLeftIconContainerX = 0.5 * horizontalUnitCm;
  topLeftIconContainerY = 0.5 * verticalUnitCm;
  topLeftIconContainerW = 1.0 * horizontalUnitCm;
  topLeftIconContainerH = 1.5 * verticalUnitCm;

  titleAreaX = 4.5 * horizontalUnitCm;
  titleAreaY = 0.5 * verticalUnitCm;
  titleAreaW = 8.5 * horizontalUnitCm;
  titleAreaH = 1.5 * verticalUnitCm;

  topRightIconContainerX = 14.5 * horizontalUnitCm;
  topRightIconContainerY = 0.5 * verticalUnitCm;
  topRightIconContainerW = 2.5 * horizontalUnitCm;
  topRightIconContainerH = 1.5 * verticalUnitCm;

  // Main Image Display Area
  mainImageDisplayAreaX = 0.5 * horizontalUnitCm;
  mainImageDisplayAreaY = 2.5 * verticalUnitCm;
  mainImageDisplayAreaW = 16.5 * horizontalUnitCm;
  mainImageDisplayAreaH = 9.5 * verticalUnitCm;

  // Bottom Control Row Base Y Coordinate
  buttonRowY = 12.5 * verticalUnitCm; // Y position for the row of buttons

  // Button Positions (X coordinates in cm from original code)
  float[] bottomButtonXCoordsCm = {0.5, 2.0, 3.5, 5.0, 6.5}; // Corresponds to a1-a5
  float[] rightButtonXCoordsCm = {10.0, 11.5, 13.0, 14.5, 16.0}; // Corresponds to b1-b5 (shifted by 9.5)

  // Calculate Pixel Coordinates for Buttons
  stopButtonX = bottomButtonXCoordsCm[0] * horizontalUnitCm; // a1
  stopButtonY = buttonRowY;
  stopButtonSize = buttonSizeCm * min(horizontalUnitCm, verticalUnitCm); // Use smaller dimension for square

  pauseButtonX = bottomButtonXCoordsCm[1] * horizontalUnitCm; // a2
  pauseButtonY = buttonRowY;
  pauseButtonSize = buttonSizeCm * min(horizontalUnitCm, verticalUnitCm);

  // ffButtonX = bottomButtonXCoordsCm[2] * horizontalUnitCm; // a3 - Not drawn
  // ffButtonY = buttonRowY;
  // ffButtonSize = buttonSizeCm * min(horizontalUnitCm, verticalUnitCm);

  nextButtonX = bottomButtonXCoordsCm[3] * horizontalUnitCm; // a4
  nextButtonY = buttonRowY;
  nextButtonSize = buttonSizeCm * min(horizontalUnitCm, verticalUnitCm);

  // a5ButtonX = bottomButtonXCoordsCm[4] * horizontalUnitCm; // a5 - Not drawn
  // a5ButtonY = buttonRowY;
  // a5ButtonSize = buttonSizeCm * min(horizontalUnitCm, verticalUnitCm);

  playButtonX = 8.0 * horizontalUnitCm; // c1
  playButtonY = buttonRowY;
  playButtonW = playButtonSizeCmW * horizontalUnitCm;
  playButtonH = buttonSizeCm * verticalUnitCm;

  // rwButtonX = rightButtonXCoordsCm[0] * horizontalUnitCm; // b1 - Not drawn
  // rwButtonY = buttonRowY;
  // rwButtonSize = buttonSizeCm * min(horizontalUnitCm, verticalUnitCm);

  prevButtonX = rightButtonXCoordsCm[1] * horizontalUnitCm; // b2
  prevButtonY = buttonRowY;
  prevButtonSize = buttonSizeCm * min(horizontalUnitCm, verticalUnitCm);

  // b3ButtonX = rightButtonXCoordsCm[2] * horizontalUnitCm; // b3 - Not drawn
  // b3ButtonY = buttonRowY;
  // b3ButtonSize = buttonSizeCm * min(horizontalUnitCm, verticalUnitCm);

  // b4ButtonX = rightButtonXCoordsCm[3] * horizontalUnitCm; // b4 - Not drawn
  // b4ButtonY = buttonRowY;
  // b4ButtonSize = buttonSizeCm * min(horizontalUnitCm, verticalUnitCm);

  // b5ButtonX = rightButtonXCoordsCm[4] * horizontalUnitCm; // b5 - Not drawn
  // b5ButtonY = buttonRowY;
  // b5ButtonSize = buttonSizeCm * min(horizontalUnitCm, verticalUnitCm);


  // Bottom Bars
  progressBarAreaX = 0.5 * horizontalUnitCm;
  progressBarAreaY = 14.0 * verticalUnitCm;
  progressBarAreaW = 14.0 * horizontalUnitCm;
  progressBarAreaH = 0.5 * verticalUnitCm;

  volumeBarAreaX = 15.5 * horizontalUnitCm;
  volumeBarAreaY = 13.7 * verticalUnitCm; // Note: Y slightly different from progress bar
  volumeBarAreaW = 1.5 * horizontalUnitCm;
  volumeBarAreaH = 1.0 * verticalUnitCm;


  // --- Drawing UI Elements (Inlined Logic) ---
  // Set default drawing styles
  fill(defaultFillColor);
  stroke(defaultStrokeColor);
  strokeWeight(1); // Default stroke weight

  // --- Draw Top Left Icon Area (Inlined mr and mrc) ---
  // Background rectangle (like original mr call)
  rect(topLeftIconContainerX, topLeftIconContainerY, topLeftIconContainerW, topLeftIconContainerH);
  // Centered square icon container (like original mrc call)
  float tl_icon_rectWidth = topLeftIconContainerW;
  float tl_icon_rectHeight = topLeftIconContainerH;
  float tl_icon_smallerSide = (tl_icon_rectWidth < tl_icon_rectHeight) ? tl_icon_rectWidth : tl_icon_rectHeight;
  float tl_icon_biggerSide = (tl_icon_rectWidth > tl_icon_rectHeight) ? tl_icon_rectWidth : tl_icon_rectHeight;
  float tl_icon_finalInnerX = (tl_icon_biggerSide - tl_icon_smallerSide) / 2;
  // Draw the centered square container - actual icon would go inside this
  rect(topLeftIconContainerX + tl_icon_finalInnerX, topLeftIconContainerY, tl_icon_smallerSide, tl_icon_smallerSide);


  // --- Draw Title Area (Inlined mr and textToDiv) ---
  // Background rectangle (like original mr call)
  rect(titleAreaX, titleAreaY, titleAreaW, titleAreaH);
  // Draw Text (Inlined textToDiv logic)
  PFont title_appFont;
  float title_fontSize;
  String title_text = ""; // Default empty title
  if (audioTracks[currentTrackIndex] != null && audioTracks[currentTrackIndex].getMetaData() != null && audioTracks[currentTrackIndex].getMetaData().title() != null) {
      title_text = audioTracks[currentTrackIndex].getMetaData().title(); // Get title safely
  }
  float title_targetX = titleAreaX;
  float title_targetY = titleAreaY;
  float title_targetW = titleAreaW;
  float title_targetH = titleAreaH;
  // Estimate initial font size
  title_fontSize = title_targetH * 0.6; // Initial font size guess based on height
  title_appFont = createFont("Arial", title_fontSize); // Using Arial as default
  textFont(title_appFont, title_fontSize);
  // Adjust font size to fit width dynamically
  while ( textWidth(title_text) > title_targetW && title_fontSize > 1) { // Added check for minimum font size
      title_fontSize = title_fontSize * 0.99; // Reduce size slightly
      textFont(title_appFont, title_fontSize); // Re-apply font with new size
  }
  fill(titleTextColor); // Set text color (black)
  textAlign (CENTER, CENTER); // Align text center vertically and horizontally
  textFont(title_appFont, title_fontSize); // Ensure correct font/size is set before drawing
  text(title_text, title_targetX, title_targetY, title_targetW, title_targetH); // Draw text
  fill(defaultFillColor); // Reset fill color


  // --- Draw Top Right Icon Area (Inlined mr and mrc) ---
  // Background rectangle (like original mr call)
  rect(topRightIconContainerX, topRightIconContainerY, topRightIconContainerW, topRightIconContainerH);
  // Centered square icon container (like original mrc call)
  float tr_icon_rectWidth = topRightIconContainerW;
  float tr_icon_rectHeight = topRightIconContainerH;
  float tr_icon_smallerSide = (tr_icon_rectWidth < tr_icon_rectHeight) ? tr_icon_rectWidth : tr_icon_rectHeight;
  float tr_icon_biggerSide = (tr_icon_rectWidth > tr_icon_rectHeight) ? tr_icon_rectWidth : tr_icon_rectHeight;
  float tr_icon_finalInnerX = (tr_icon_biggerSide - tr_icon_smallerSide) / 2;
  // Draw the centered square container - actual icon would go inside this
  rect(topRightIconContainerX + tr_icon_finalInnerX, topRightIconContainerY, tr_icon_smallerSide, tr_icon_smallerSide);


  // --- Draw Main Image Display Area (Inlined mr and mrcf("d1", ...)) ---
  // Background rectangle (like original mr call)
  rect(mainImageDisplayAreaX, mainImageDisplayAreaY, mainImageDisplayAreaW, mainImageDisplayAreaH);
  // Draw Image (Inlined mrcf("d1", ...) which contained ImageToDiv)
  String imageFileToLoad = albumArtPaths[currentTrackIndex];
  PImage img_to_draw = loadImage(imageFileToLoad); // Load the image
  if (img_to_draw != null) { // Check if image loaded successfully
      int img_originalWidth = img_to_draw.width;
      int img_originalHeight = img_to_draw.height;
      float img_targetX = mainImageDisplayAreaX; // Target area coords
      float img_targetY = mainImageDisplayAreaY;
      float img_targetW = mainImageDisplayAreaW; // Target area dimensions
      float img_targetH = mainImageDisplayAreaH;

      // Aspect Ratio Calculation
      float img_aspectRatio = float(img_originalWidth) / float(img_originalHeight);

      // Declare variables for adjusted image size
      float img_adjustedWidth, img_adjustedHeight;
      float img_offsetX, img_offsetY; // Variables for centering

      // Size Resampling Algorithm
      if (img_originalWidth > img_originalHeight) { // Landscape image
          img_adjustedWidth = img_targetW;
          img_adjustedHeight = img_adjustedWidth / img_aspectRatio;
          // Check if height exceeds target, adjust if necessary
          if (img_adjustedHeight > img_targetH) {
              img_adjustedHeight = img_targetH;
              img_adjustedWidth = img_adjustedHeight * img_aspectRatio;
          }
      } else { // Portrait or square image
          img_adjustedHeight = img_targetH;
          img_adjustedWidth = img_adjustedHeight * img_aspectRatio;
          // Check if width exceeds target, adjust if necessary
          if (img_adjustedWidth > img_targetW) {
              img_adjustedWidth = img_targetW;
              img_adjustedHeight = img_adjustedWidth / img_aspectRatio;
          }
      }

      // Centering the Image in the Div
      img_offsetX = (img_targetW - img_adjustedWidth) / 2;
      img_offsetY = (img_targetH - img_adjustedHeight) / 2;

      // Draw the image (Inlined ITD logic: image() call with padding)
      image(img_to_draw, img_targetX + img_offsetX + 1, img_targetY + img_offsetY + 1, img_adjustedWidth - 2, img_adjustedHeight - 2);
  } else {
      println("Error: Could not load image " + imageFileToLoad);
      // Optionally draw a placeholder rectangle if image fails to load
      fill(150); // Gray fill
      rect(mainImageDisplayAreaX + 1, mainImageDisplayAreaY + 1, mainImageDisplayAreaW - 2, mainImageDisplayAreaH - 2);
      fill(defaultFillColor); // Reset fill
  }


  // --- Draw Buttons (Unrolled Loops with Inlined mrc and mrcf) ---
  // Set fill/stroke for buttons
  fill(defaultFillColor);
  stroke(defaultStrokeColor);

  // --- Button Group 'a' (Left side) ---

  // Button a1: Stop (Inlined mrc and mrcf("a1", ...))
  float a1_x_cm = 0.5; float a1_y_cm = 12.5; float a1_w_cm = 1.0; float a1_h_cm = 1.0;
  float a1_rectWidth = horizontalUnitCm * a1_w_cm;
  float a1_rectHeight = verticalUnitCm * a1_h_cm;
  float a1_smallerSide = (a1_rectWidth < a1_rectHeight) ? a1_rectWidth : a1_rectHeight;
  float a1_biggerSide = (a1_rectWidth > a1_rectHeight) ? a1_rectWidth : a1_rectHeight;
  float a1_innerX = horizontalUnitCm * a1_x_cm;
  float a1_innerY = verticalUnitCm * a1_y_cm;
  float a1_finalInnerX = (a1_biggerSide - a1_smallerSide) / 2;
  rect(a1_innerX + a1_finalInnerX, a1_innerY, a1_smallerSide, a1_smallerSide); // Draw container (mrc)
  // Draw Icon (mrcf("a1"))
  rect(a1_innerX + a1_finalInnerX + (a1_smallerSide / 4 * 1), a1_innerY + (a1_smallerSide / 4 * 1), a1_smallerSide / 4 * 2, a1_smallerSide / 4 * 2); // Stop square

  // Button a2: Pause (Inlined mrc and mrcf("a2", ...))
  float a2_x_cm = 2.0; float a2_y_cm = 12.5; float a2_w_cm = 1.0; float a2_h_cm = 1.0;
  float a2_rectWidth = horizontalUnitCm * a2_w_cm;
  float a2_rectHeight = verticalUnitCm * a2_h_cm;
  float a2_smallerSide = (a2_rectWidth < a2_rectHeight) ? a2_rectWidth : a2_rectHeight;
  float a2_biggerSide = (a2_rectWidth > a2_rectHeight) ? a2_rectWidth : a2_rectHeight;
  float a2_innerX = horizontalUnitCm * a2_x_cm;
  float a2_innerY = verticalUnitCm * a2_y_cm;
  float a2_finalInnerX = (a2_biggerSide - a2_smallerSide) / 2;
  rect(a2_innerX + a2_finalInnerX, a2_innerY, a2_smallerSide, a2_smallerSide); // Draw container (mrc)
  // Draw Icon (mrcf("a2"))
  float a2_gridSelectorX = a2_smallerSide / 16;
  float a2_gridSelectorY = a2_smallerSide / 4;
  rect(a2_innerX + a2_finalInnerX + (a2_gridSelectorX * 4), a2_innerY + (a2_gridSelectorY * 1), a2_gridSelectorX * 2, a2_gridSelectorY * 2); // Left bar
  rect(a2_innerX + a2_finalInnerX + (a2_gridSelectorX * 10), a2_innerY + (a2_gridSelectorY * 1), a2_gridSelectorX * 2, a2_gridSelectorY * 2); // Right bar

  // Button a3: Fast Forward (Original code commented out drawing)
  // float a3_x_cm = 3.5; float a3_y_cm = 12.5; float a3_w_cm = 1.0; float a3_h_cm = 1.0;
  // ... (mrc container drawing) ...
  // ... (mrcf("a3") icon drawing - was commented out) ...

  // Button a4: Next (Inlined mrc and mrcf("a4", ...))
  float a4_x_cm = 5.0; float a4_y_cm = 12.5; float a4_w_cm = 1.0; float a4_h_cm = 1.0;
  float a4_rectWidth = horizontalUnitCm * a4_w_cm;
  float a4_rectHeight = verticalUnitCm * a4_h_cm;
  float a4_smallerSide = (a4_rectWidth < a4_rectHeight) ? a4_rectWidth : a4_rectHeight;
  float a4_biggerSide = (a4_rectWidth > a4_rectHeight) ? a4_rectWidth : a4_rectHeight;
  float a4_innerX = horizontalUnitCm * a4_x_cm;
  float a4_innerY = verticalUnitCm * a4_y_cm;
  float a4_finalInnerX = (a4_biggerSide - a4_smallerSide) / 2;
  rect(a4_innerX + a4_finalInnerX, a4_innerY, a4_smallerSide, a4_smallerSide); // Draw container (mrc)
  // Draw Icon (mrcf("a4"))
  float a4_gridSelectorX = a4_smallerSide / 4;
  float a4_gridSelectorY = a4_smallerSide / 4;
  triangle(a4_innerX + a4_finalInnerX + a4_gridSelectorX * 3, a4_innerY + a4_gridSelectorY * 1, // Top point
           a4_innerX + a4_finalInnerX + a4_gridSelectorX * 3, a4_innerY + a4_gridSelectorY * 3, // Bottom point
           a4_innerX + a4_finalInnerX + a4_gridSelectorX * 1.5, a4_innerY + a4_gridSelectorY * 2); // Left point
  rect(a4_innerX + a4_finalInnerX + a4_gridSelectorX * 1, a4_innerY + a4_gridSelectorY * 1, a4_gridSelectorX * 0.5, a4_gridSelectorY * 2); // Bar

  // Button a5: (Original code commented out drawing)
  // float a5_x_cm = 6.5; float a5_y_cm = 12.5; float a5_w_cm = 1.0; float a5_h_cm = 1.0;
  // ... (mrc container drawing) ...
  // ... (mrcf("a5") icon drawing - was commented out) ...


  // --- Button c1: Play (Center) (Inlined mrc and mrcf("c1", ...)) ---
  float c1_x_cm = 8.0; float c1_y_cm = 12.5; float c1_w_cm = 1.5; float c1_h_cm = 1.0;
  float c1_rectWidth = horizontalUnitCm * c1_w_cm;
  float c1_rectHeight = verticalUnitCm * c1_h_cm;
  float c1_smallerSide = (c1_rectWidth < c1_rectHeight) ? c1_rectWidth : c1_rectHeight; // Note: uses smaller side logic even though rect might not be square
  float c1_biggerSide = (c1_rectWidth > c1_rectHeight) ? c1_rectWidth : c1_rectHeight;
  float c1_innerX = horizontalUnitCm * c1_x_cm;
  float c1_innerY = verticalUnitCm * c1_y_cm;
  // Original mrc centered the square within the rect, adapting for potentially non-square play button container
  float c1_containerW = c1_rectWidth; // Use actual calculated width
  float c1_containerH = c1_rectHeight; // Use actual calculated height
  rect(c1_innerX, c1_innerY, c1_containerW, c1_containerH); // Draw container (using mr logic basically)
  // Draw Icon (mrcf("c1")) - Centered within the c1_containerW/H
  // We need to recalculate centering based on the actual container, not the mrc logic's smaller side
  float c1_iconAreaSize = min(c1_containerW, c1_containerH) * 0.8; // Make icon slightly smaller than container min dim
  float c1_iconOffsetX = (c1_containerW - c1_iconAreaSize) / 2;
  float c1_iconOffsetY = (c1_containerH - c1_iconAreaSize) / 2;
  float c1_iconX = c1_innerX + c1_iconOffsetX;
  float c1_iconY = c1_innerY + c1_iconOffsetY;
  float c1_gridSelectorX = c1_iconAreaSize / 4;
  float c1_gridSelectorY = c1_iconAreaSize / 4;
  triangle(c1_iconX + c1_gridSelectorX * 1, c1_iconY + c1_gridSelectorY * 1, // Top-left point
           c1_iconX + c1_gridSelectorX * 1, c1_iconY + c1_gridSelectorY * 3, // Bottom-left point
           c1_iconX + c1_gridSelectorX * 3, c1_iconY + c1_gridSelectorY * 2); // Right-middle point


  // --- Button Group 'b' (Right side) ---

  // Button b1: Fast Backward (Original code commented out drawing)
  // float b1_x_cm = 9.5 + 0.5; float b1_y_cm = 12.5; float b1_w_cm = 1.0; float b1_h_cm = 1.0;
  // ... (mrc container drawing) ...
  // ... (mrcf("b1") icon drawing - was commented out) ...

  // Button b2: Previous (Inlined mrc and mrcf("b2", ...))
  float b2_x_cm = 9.5 + 2.0; float b2_y_cm = 12.5; float b2_w_cm = 1.0; float b2_h_cm = 1.0;
  float b2_rectWidth = horizontalUnitCm * b2_w_cm;
  float b2_rectHeight = verticalUnitCm * b2_h_cm;
  float b2_smallerSide = (b2_rectWidth < b2_rectHeight) ? b2_rectWidth : b2_rectHeight;
  float b2_biggerSide = (b2_rectWidth > b2_rectHeight) ? b2_rectWidth : b2_rectHeight;
  float b2_innerX = horizontalUnitCm * b2_x_cm;
  float b2_innerY = verticalUnitCm * b2_y_cm;
  float b2_finalInnerX = (b2_biggerSide - b2_smallerSide) / 2;
  rect(b2_innerX + b2_finalInnerX, b2_innerY, b2_smallerSide, b2_smallerSide); // Draw container (mrc)
  // Draw Icon (mrcf("b2"))
  float b2_gridSelectorX = b2_smallerSide / 4;
  float b2_gridSelectorY = b2_smallerSide / 4;
  triangle(b2_innerX + b2_finalInnerX + b2_gridSelectorX * 1, b2_innerY + b2_gridSelectorY * 1, // Top-right point
           b2_innerX + b2_finalInnerX + b2_gridSelectorX * 1, b2_innerY + b2_gridSelectorY * 3, // Bottom-right point
           b2_innerX + b2_finalInnerX + b2_gridSelectorX * 2.5, b2_innerY + b2_gridSelectorY * 2); // Left-middle point
  rect(b2_innerX + b2_finalInnerX + b2_gridSelectorX * 2.5, b2_innerY + b2_gridSelectorY * 1, b2_gridSelectorX * 0.5, b2_gridSelectorY * 2); // Bar

  // Button b3: (Original code commented out drawing)
  // float b3_x_cm = 9.5 + 3.5; float b3_y_cm = 12.5; float b3_w_cm = 1.0; float b3_h_cm = 1.0;
  // ... (mrc container drawing) ...
  // ... (mrcf("b3") icon drawing - was commented out) ...

  // Button b4: (Original code commented out drawing)
  // float b4_x_cm = 9.5 + 5.0; float b4_y_cm = 12.5; float b4_w_cm = 1.0; float b4_h_cm = 1.0;
  // ... (mrc container drawing) ...
  // ... (mrcf("b4") icon drawing - was commented out) ...

  // Button b5: (Original code commented out drawing)
  // float b5_x_cm = 9.5 + 6.5; float b5_y_cm = 12.5; float b5_w_cm = 1.0; float b5_h_cm = 1.0;
  // ... (mrc container drawing) ...
  // ... (mrcf("b5") icon drawing - was commented out) ...


  // --- Draw Bottom Bars (Inlined mr) ---
  // Progress Bar Area
  rect(progressBarAreaX, progressBarAreaY, progressBarAreaW, progressBarAreaH);
  // Volume Bar Area
  rect(volumeBarAreaX, volumeBarAreaY, volumeBarAreaW, volumeBarAreaH);

  // --- End of Setup Drawing ---
  println("Setup complete. UI drawn.");

} // End setup

void draw() {
  // The draw loop is called continuously.
  // Since most elements are static, they are drawn once in setup().
  // We might need to redraw elements that change, like the progress bar fill,
  // or update the title/image if the track changes.

  // --- Dynamic Updates ---

  // Example: Redraw Title Area Background and Text (in case track changes)
  fill(defaultFillColor); // White background for title area
  stroke(defaultStrokeColor);
  rect(titleAreaX, titleAreaY, titleAreaW, titleAreaH);
  // Draw Text (Inlined textToDiv logic - simplified redraw)
  PFont title_redraw_appFont;
  float title_redraw_fontSize;
  String title_redraw_text = ""; // Default empty title
   if (audioTracks[currentTrackIndex] != null && audioTracks[currentTrackIndex].getMetaData() != null && audioTracks[currentTrackIndex].getMetaData().title() != null) {
      title_redraw_text = audioTracks[currentTrackIndex].getMetaData().title(); // Get current title safely
  }
  title_redraw_fontSize = titleAreaH * 0.6; // Recalculate initial size
  title_redraw_appFont = createFont("Arial", title_redraw_fontSize);
  textFont(title_redraw_appFont, title_redraw_fontSize);
  while ( textWidth(title_redraw_text) > titleAreaW && title_redraw_fontSize > 1) { // Adjust size
      title_redraw_fontSize *= 0.99;
      textFont(title_redraw_appFont, title_redraw_fontSize);
  }
  fill(titleTextColor); // Black text
  textAlign (CENTER, CENTER);
  textFont(title_redraw_appFont, title_redraw_fontSize); // Ensure font set
  text(title_redraw_text, titleAreaX, titleAreaY, titleAreaW, titleAreaH); // Draw text
  fill(defaultFillColor); // Reset fill


  // Example: Redraw Image Area Background and Image (in case track changes)
   fill(defaultFillColor); // White background for image area
   stroke(defaultStrokeColor);
   rect(mainImageDisplayAreaX, mainImageDisplayAreaY, mainImageDisplayAreaW, mainImageDisplayAreaH);
   // Draw Image (Inlined logic - simplified redraw)
   String imageFileToLoad_redraw = albumArtPaths[currentTrackIndex];
   PImage img_to_redraw = loadImage(imageFileToLoad_redraw);
   if (img_to_redraw != null) {
       int img_originalWidth_redraw = img_to_redraw.width;
       int img_originalHeight_redraw = img_to_redraw.height;
       float img_targetX_redraw = mainImageDisplayAreaX;
       float img_targetY_redraw = mainImageDisplayAreaY;
       float img_targetW_redraw = mainImageDisplayAreaW;
       float img_targetH_redraw = mainImageDisplayAreaH;
       float img_aspectRatio_redraw = float(img_originalWidth_redraw) / float(img_originalHeight_redraw);
       float img_adjustedWidth_redraw, img_adjustedHeight_redraw;
       float img_offsetX_redraw, img_offsetY_redraw;

       if (img_originalWidth_redraw > img_originalHeight_redraw) {
           img_adjustedWidth_redraw = img_targetW_redraw;
           img_adjustedHeight_redraw = img_adjustedWidth_redraw / img_aspectRatio_redraw;
           if (img_adjustedHeight_redraw > img_targetH_redraw) {
               img_adjustedHeight_redraw = img_targetH_redraw;
               img_adjustedWidth_redraw = img_adjustedHeight_redraw * img_aspectRatio_redraw;
           }
       } else {
           img_adjustedHeight_redraw = img_targetH_redraw;
           img_adjustedWidth_redraw = img_adjustedHeight_redraw * img_aspectRatio_redraw;
           if (img_adjustedWidth_redraw > img_targetW_redraw) {
               img_adjustedWidth_redraw = img_targetW_redraw;
               img_adjustedHeight_redraw = img_adjustedWidth_redraw / img_aspectRatio_redraw;
           }
       }
       img_offsetX_redraw = (img_targetW_redraw - img_adjustedWidth_redraw) / 2;
       img_offsetY_redraw = (img_targetH_redraw - img_adjustedHeight_redraw) / 2;
       image(img_to_redraw, img_targetX_redraw + img_offsetX_redraw + 1, img_targetY_redraw + img_offsetY_redraw + 1, img_adjustedWidth_redraw - 2, img_adjustedHeight_redraw - 2);
   } else {
       // Draw placeholder if image fails
       fill(150);
       rect(mainImageDisplayAreaX + 1, mainImageDisplayAreaY + 1, mainImageDisplayAreaW - 2, mainImageDisplayAreaH - 2);
       fill(defaultFillColor);
   }


  // TODO: Add drawing logic for dynamic elements like progress bar fill based on audio position
  // Example: Draw progress bar fill
  if (audioTracks[currentTrackIndex] != null && audioTracks[currentTrackIndex].length() > 0) {
      float progressRatio = (float)audioTracks[currentTrackIndex].position() / (float)audioTracks[currentTrackIndex].length();
      float progressFillWidth = progressBarAreaW * progressRatio;
      fill(0, 0, 255); // Blue fill for progress
      noStroke();
      rect(progressBarAreaX, progressBarAreaY, progressFillWidth, progressBarAreaH);
      stroke(defaultStrokeColor); // Reset stroke
      fill(defaultFillColor); // Reset fill
  }


} // End draw

void mousePressed() {
  // Basic Play/Pause toggle on any mouse click for the current track
  // TODO: Implement button-specific logic by checking mouseX, mouseY against button coordinates

  if (audioTracks[currentTrackIndex] != null) { // Check if track is loaded
      if (isPlayingAudio) {
          audioTracks[currentTrackIndex].pause();
          isPlayingAudio = false;
          println("Audio Paused");
      } else {
          audioTracks[currentTrackIndex].play();
          // If starting from beginning or paused, play() works. If at end, rewind first.
          if (audioTracks[currentTrackIndex].position() >= audioTracks[currentTrackIndex].length() - 100) { // Check if near end (small buffer)
             audioTracks[currentTrackIndex].rewind();
          }
          audioTracks[currentTrackIndex].play();
          isPlayingAudio = true;
          println("Audio Playing");
      }
  } else {
      println("Error: Current audio track is not loaded.");
  }

  // Example: Check if click is on the "Next" button (a4)
  // Calculate the clickable area for the centered square of button a4
  float a4_x_cm = 5.0; float a4_y_cm = 12.5; float a4_w_cm = 1.0; float a4_h_cm = 1.0;
  float a4_rectWidth = horizontalUnitCm * a4_w_cm;
  float a4_rectHeight = verticalUnitCm * a4_h_cm;
  float a4_smallerSide = (a4_rectWidth < a4_rectHeight) ? a4_rectWidth : a4_rectHeight;
  float a4_biggerSide = (a4_rectWidth > a4_rectHeight) ? a4_rectWidth : a4_rectHeight;
  float a4_innerX = horizontalUnitCm * a4_x_cm;
  float a4_innerY = verticalUnitCm * a4_y_cm;
  float a4_finalInnerX = (a4_biggerSide - a4_smallerSide) / 2;
  float a4_clickX = a4_innerX + a4_finalInnerX;
  float a4_clickY = a4_innerY;
  float a4_clickSize = a4_smallerSide;

  if (mouseX >= a4_clickX && mouseX <= a4_clickX + a4_clickSize &&
      mouseY >= a4_clickY && mouseY <= a4_clickY + a4_clickSize) {
     println("Next Button Clicked!");
     // Add logic for next track
     if (audioTracks[currentTrackIndex] != null) audioTracks[currentTrackIndex].pause(); // Stop current
     currentTrackIndex = (currentTrackIndex + 1) % totalTracks; // Cycle to next
     if (audioTracks[currentTrackIndex] != null) {
         audioTracks[currentTrackIndex].rewind();
         if (isPlayingAudio) audioTracks[currentTrackIndex].play(); // Play if was playing
     }
  }

   // Example: Check if click is on the "Previous" button (b2)
   float b2_x_cm = 9.5 + 2.0; float b2_y_cm = 12.5; float b2_w_cm = 1.0; float b2_h_cm = 1.0;
   float b2_rectWidth = horizontalUnitCm * b2_w_cm;
   float b2_rectHeight = verticalUnitCm * b2_h_cm;
   float b2_smallerSide = (b2_rectWidth < b2_rectHeight) ? b2_rectWidth : b2_rectHeight;
   float b2_biggerSide = (b2_rectWidth > b2_rectHeight) ? b2_rectWidth : b2_rectHeight;
   float b2_innerX = horizontalUnitCm * b2_x_cm;
   float b2_innerY = verticalUnitCm * b2_y_cm;
   float b2_finalInnerX = (b2_biggerSide - b2_smallerSide) / 2;
   float b2_clickX = b2_innerX + b2_finalInnerX;
   float b2_clickY = b2_innerY;
   float b2_clickSize = b2_smallerSide;

   if (mouseX >= b2_clickX && mouseX <= b2_clickX + b2_clickSize &&
       mouseY >= b2_clickY && mouseY <= b2_clickY + b2_clickSize) {
      println("Previous Button Clicked!");
      // Add logic for previous track
      if (audioTracks[currentTrackIndex] != null) audioTracks[currentTrackIndex].pause(); // Stop current
      currentTrackIndex = (currentTrackIndex - 1 + totalTracks) % totalTracks; // Cycle to previous
      if (audioTracks[currentTrackIndex] != null) {
          audioTracks[currentTrackIndex].rewind();
          if (isPlayingAudio) audioTracks[currentTrackIndex].play(); // Play if was playing
      }
   }


} // End mousePressed

void keyPressed() {
  // Play/Pause toggle using Spacebar
  if (key == ' ') {
      if (audioTracks[currentTrackIndex] != null) { // Check if track is loaded
          if (isPlayingAudio) {
              audioTracks[currentTrackIndex].pause();
              isPlayingAudio = false;
              println("Audio Paused (Key)");
          } else {
              // If starting from beginning or paused, play() works. If at end, rewind first.
              if (audioTracks[currentTrackIndex].position() >= audioTracks[currentTrackIndex].length() - 100) { // Check if near end
                  audioTracks[currentTrackIndex].rewind();
              }
              audioTracks[currentTrackIndex].play();
              isPlayingAudio = true;
              println("Audio Playing (Key)");
          }
      } else {
          println("Error: Current audio track is not loaded.");
      }
  }

  // Add other key controls if needed
  // Example: Right arrow for next track
  if (keyCode == RIGHT) {
       println("Next Track (Key)");
       if (audioTracks[currentTrackIndex] != null) audioTracks[currentTrackIndex].pause();
       currentTrackIndex = (currentTrackIndex + 1) % totalTracks;
       if (audioTracks[currentTrackIndex] != null) {
           audioTracks[currentTrackIndex].rewind();
           if (isPlayingAudio) audioTracks[currentTrackIndex].play();
       }
  }

  // Example: Left arrow for previous track
  if (keyCode == LEFT) {
       println("Previous Track (Key)");
       if (audioTracks[currentTrackIndex] != null) audioTracks[currentTrackIndex].pause();
       currentTrackIndex = (currentTrackIndex - 1 + totalTracks) % totalTracks;
       if (audioTracks[currentTrackIndex] != null) {
           audioTracks[currentTrackIndex].rewind();
           if (isPlayingAudio) audioTracks[currentTrackIndex].play();
       }
  }


} // End keyPressed

// --- End of Sketch ---
