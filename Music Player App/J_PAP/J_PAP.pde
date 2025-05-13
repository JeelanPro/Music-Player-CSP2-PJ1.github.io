// Dynamic Programming v Static
//
// Library - Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
// Global Variables
Minim minim;
int numberOfSongs = 3;
AudioPlayer[] playList = new AudioPlayer[ numberOfSongs ];
int appWidth, appHeight;
float imageX, imageY, imageWidth, imageHeight;
String[] imagePath = new String[numberOfSongs];
int currentAudio = 0;
//
float ANP; // 1 cm for Width
float BNP; // 1 cm for Height

 //import processing.sound.*;
// import processing.video.*;
//SoundFile file;
//SoundFile

void setup() {
  // Display
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  ANP = 0.05714285714285714; // 1 cm for Width (1/17.5)
  BNP = 0.06666666666666667; // 1 cm for Height (1/15)
  minim = new Minim(this);
  
  currentAudio = 0;
  //
  imageX = displayWidth * (ANP * 0.5);
  imageY = displayHeight * (ANP * 0.5);
  imageWidth = displayWidth * (ANP * 1);
  imageHeight = displayHeight * (ANP * 1.5);
  
  playList[0] = minim.loadFile( "Songs/skibidi-toilet.mp3" );
  playList[1] = minim.loadFile( "Songs/qaseda.mp3" );
  playList[2] = minim.loadFile( "Songs/Virus.mp3" );
  //playList[2].play();
  
  imagePath[0] = "Images/Skibidi.jpg";
  imagePath[1] = "Images/JeelanPro.jpg";
  imagePath[2] = "Images/Virus.jpg";
  
  
  
  // file = new SoundFile(this, "skibidi-toilet.mp3");
  //
  // rect(X, Y Width, Height);
  //
  
  //println("JeelanPro");
  //println(playList[1].getMetaData().title());
  //println("JeelanPro");
  
  mr(0.5, 0.5, 1, 1.5);
  mrc(0.5, 0.5, 1, 1.5);
  mr(4.5, 0.5, 8.5, 1.5);
  textToDiv(4.5, 0.5, 8.5, 1.5, playList[currentAudio].getMetaData().title(), #000000);
  mr(14.5, 0.5, 2.5, 1.5);
  mrc(14.5, 0.5, 2.5, 1.5);
  mr(0.5, 2.5, 16.5, 9.5);
  mrcf(a("d", 0), 0.5, 2.5, 16.5, 9.5); 
  // mrcft("a1", 0.5, 2.5, 16.5, 9.5);
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
  mr(0.5, 14, 14.0, 0.5);
  mr(15.5, 13.7, 1.5, 1);
}

String a(String section, int num) {
  return section + str(num + 1);
}

void mr(float x, float y, float w, float h) {
  float pixelX = displayWidth * ANP * x;
  float pixelY = displayHeight * BNP * y;
  float pixelW = displayWidth * ANP * w;
  float pixelH = displayHeight * BNP * h;
  rect(pixelX, pixelY, pixelW, pixelH);
}

void mrc(float x, float y, float w, float h) {
  float pixelX = displayWidth * ANP * x;
  float pixelY = displayHeight * BNP * y;
  float pixelW = displayWidth * ANP * w;
  float pixelH = displayHeight * BNP * h;

  float logoBoxSide = min(pixelW, pixelH);
  float logoBoxX = pixelX + (pixelW - logoBoxSide) / 2.0;
  float logoBoxY = pixelY + (pixelH - logoBoxSide) / 2.0;
  
  rect(logoBoxX, logoBoxY, logoBoxSide, logoBoxSide);
}

void mrcf(String op, float x, float y, float w, float h) {
  float pixelX = displayWidth * ANP * x;
  float pixelY = displayHeight * BNP * y;
  float pixelW = displayWidth * ANP * w;
  float pixelH = displayHeight * BNP * h;

  float logoBoxSide = min(pixelW, pixelH);
  float logoBoxActualX = pixelX + (pixelW - logoBoxSide) / 2.0;
  float logoBoxActualY = pixelY + (pixelH - logoBoxSide) / 2.0;
  
  float gridSelectorX; // Will be based on logoBoxSide
  float gridSelectorY; // Will be based on logoBoxSide
  
  if (op.equals("a1")) { // Stop
    rect(
      logoBoxActualX + (logoBoxSide / 4.0 * 1.0),
      logoBoxActualY + (logoBoxSide / 4.0 * 1.0),
      logoBoxSide / 4.0 * 2.0,
      logoBoxSide / 4.0 * 2.0
    );
  }
  else if (op.equals("a2")) { // Pause
    gridSelectorX = logoBoxSide / 16.0;
    gridSelectorY = logoBoxSide / 4.0;
    rect(
      logoBoxActualX + (gridSelectorX * 4.0),
      logoBoxActualY + (gridSelectorY * 1.0),
      gridSelectorX * 2.0, // Width
      gridSelectorY * 2.0  // Height
    );
    rect(
      logoBoxActualX + (gridSelectorX * 10.0),
      logoBoxActualY + (gridSelectorY * 1.0),
      gridSelectorX * 2.0, // Width
      gridSelectorY * 2.0  // Height
    );
  }
  else if (op.equals("a3")) { // Fast Forward
    gridSelectorX = logoBoxSide / 4.0;
    gridSelectorY = logoBoxSide / 4.0;
    float gsx = gridSelectorX; // alias for brevity
    float gsy = gridSelectorY; // alias for brevity
    triangle(
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*1, 
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*3, 
      logoBoxActualX + gsx*1, logoBoxActualY + gsy*2
    );
    triangle(
      logoBoxActualX + gsx*3, logoBoxActualY + gsy*1, 
      logoBoxActualX + gsx*3, logoBoxActualY + gsy*3, 
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*2
    );
  }
  else if (op.equals("a4")) { // Next
    gridSelectorX = logoBoxSide / 4.0;
    gridSelectorY = logoBoxSide / 4.0;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      logoBoxActualX + gsx*3, logoBoxActualY + gsy*1, 
      logoBoxActualX + gsx*3, logoBoxActualY + gsy*3, 
      logoBoxActualX + gsx*1.5, logoBoxActualY + gsy*2
    );
    rect(
      logoBoxActualX + gsx*1,
      logoBoxActualY + gsy*1,
      gsx * 0.5, // Width
      gsy * 2    // Height
    );
  }
  else if (op.equals("a5")) { // (Was Shuffle in Lesson03, now drawing two triangles like Fast Forward)
    gridSelectorX = logoBoxSide / 4.0;
    gridSelectorY = logoBoxSide / 4.0;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*1, 
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*3, 
      logoBoxActualX + gsx*1, logoBoxActualY + gsy*2
    );
    triangle(
      logoBoxActualX + gsx*3, logoBoxActualY + gsy*1, 
      logoBoxActualX + gsx*3, logoBoxActualY + gsy*3, 
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*2
    );
  }
  else if (op.equals("b1")) { // Fast Backward
    gridSelectorX = logoBoxSide / 4.0;
    gridSelectorY = logoBoxSide / 4.0;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      logoBoxActualX + gsx*1, logoBoxActualY + gsy*1, 
      logoBoxActualX + gsx*1, logoBoxActualY + gsy*3, 
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*2
    );
    triangle(
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*1, 
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*3, 
      logoBoxActualX + gsx*3, logoBoxActualY + gsy*2
    );
  }
  else if (op.equals("b2")) { // Previous
    gridSelectorX = logoBoxSide / 4.0;
    gridSelectorY = logoBoxSide / 4.0;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      logoBoxActualX + gsx*1, logoBoxActualY + gsy*1, 
      logoBoxActualX + gsx*1, logoBoxActualY + gsy*3, 
      logoBoxActualX + gsx*2.5, logoBoxActualY + gsy*2
    );
    rect(
      logoBoxActualX + gsx*2.5,
      logoBoxActualY + gsy*1,
      gsx * 0.5, // Width
      gsy * 2    // Height
    );
  }
  else if (op.equals("b3")) { // (Placeholder, drawing two triangles like Fast Backward)
     gridSelectorX = logoBoxSide / 4.0;
    gridSelectorY = logoBoxSide / 4.0;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      logoBoxActualX + gsx*1, logoBoxActualY + gsy*1, 
      logoBoxActualX + gsx*1, logoBoxActualY + gsy*3, 
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*2
    );
    triangle(
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*1, 
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*3, 
      logoBoxActualX + gsx*3, logoBoxActualY + gsy*2
    );
  }
  else if (op.equals("b4")) { // (Placeholder, drawing two triangles like Fast Backward)
    gridSelectorX = logoBoxSide / 4.0;
    gridSelectorY = logoBoxSide / 4.0;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      logoBoxActualX + gsx*1, logoBoxActualY + gsy*1, 
      logoBoxActualX + gsx*1, logoBoxActualY + gsy*3, 
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*2
    );
    triangle(
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*1, 
      logoBoxActualX + gsx*2, logoBoxActualY + gsy*3, 
      logoBoxActualX + gsx*3, logoBoxActualY + gsy*2
    );
  }
  else if (op.equals("b5")) { // (Placeholder, no specific drawing, was Exit in Lesson03)
    gridSelectorX = logoBoxSide / 4.0;
    gridSelectorY = logoBoxSide / 4.0;
    // float gsx = gridSelectorX;
    // float gsy = gridSelectorY;
    // Example: draw a simple X for exit
    // line(logoBoxActualX + gsx*1, logoBoxActualY + gsy*1, logoBoxActualX + gsx*3, logoBoxActualY + gsy*3);
    // line(logoBoxActualX + gsx*3, logoBoxActualY + gsy*1, logoBoxActualX + gsx*1, logoBoxActualY + gsy*3);
  }
  else if (op.equals("c1")) { // Play
    gridSelectorX = logoBoxSide / 4.0;
    gridSelectorY = logoBoxSide / 4.0;
    float gsx = gridSelectorX;
    float gsy = gridSelectorY;
    triangle(
      logoBoxActualX + gsx*1, logoBoxActualY + gsy*1, 
      logoBoxActualX + gsx*1, logoBoxActualY + gsy*3, 
      logoBoxActualX + gsx*3, logoBoxActualY + gsy*2
    );
  }
  else if (op.equals("d1")) { // Image display area
    ImageToDiv(
        pixelX, // Use the original bounding box for ImageToDiv
        pixelY,
        pixelW,
        pixelH,
        imagePath[currentAudio]
      );
  }
  else { // Default shape (e.g., a square if op is unrecognized)
    rect(
      logoBoxActualX + (logoBoxSide / 4.0 * 1.0),
      logoBoxActualY + (logoBoxSide / 4.0 * 1.0),
      logoBoxSide / 4.0 * 2.0,
      logoBoxSide / 4.0 * 2.0
    );
  }
}

void mrcft(String op, float x, float y, float w, float h) {
  float pixelX = displayWidth * ANP * x;
  float pixelY = displayHeight * BNP * y;
  float pixelW = displayWidth * ANP * w;
  float pixelH = displayHeight * BNP * h;

  float logoBoxSide = min(pixelW, pixelH);
  float logoBoxActualX = pixelX + (pixelW - logoBoxSide) / 2.0;
  float logoBoxActualY = pixelY + (pixelH - logoBoxSide) / 2.0;
  
  if (op.equals("a1")) { // Image (draws a centered square box)
    rect(logoBoxActualX, logoBoxActualY, logoBoxSide, logoBoxSide);
    // If you intend to draw an image within this centered square:
    // ImageToDiv(logoBoxActualX, logoBoxActualY, logoBoxSide, logoBoxSide, "SomeImage.jpg");
  }
  else { // Default shape (a smaller square within the centered logo box)
    rect(
      logoBoxActualX + (logoBoxSide / 4.0 * 1.0),
      logoBoxActualY + (logoBoxSide / 4.0 * 1.0),
      logoBoxSide / 4.0 * 2.0,
      logoBoxSide / 4.0 * 2.0
    );
    // If you intend to draw an image within this smaller square:
    // ImageToDiv(
    //   logoBoxActualX + (logoBoxSide / 4.0 * 1.0), 
    //   logoBoxActualY + (logoBoxSide / 4.0 * 1.0), 
    //   logoBoxSide / 4.0 * 2.0, 
    //   logoBoxSide / 4.0 * 2.0, 
    //   "SomeImage.jpg"
    // );
  }
}

//void ImageToDiv (float x, float y, float w, float h, String f) {
//  float imageH = loadImage(f).height;
//  float imageW = loadImage(f).width;
//  ITD (x, y, w, h, f);
//  if (h > w) {
//    print("hello World");
//  } else {
//  }
//}

//void ImageToDiv(float x, float y, float w, float h, String f) {
//  PImage img = loadImage(f);
//  float imgW = img.width;
//  float imgH = img.height;

//  float scale = ((w / imgW) > (h / imgH)) ? (h / imgH) : (w / imgW);

//  float newImgW = imgW * scale;
//  float newImgH = imgH * scale;

//  float offsetX = (w - newImgW) / 2;
//  float offsetY = (h - newImgH) / 2;

//  ITD(x + offsetX, y + offsetY, newImgW, newImgH, f);
//}

//
// Function: ImageToDiv
void ImageToDiv(float x, float y, float w, float h, String f) {
  // Load the image
  PImage img = loadImage(f);
  int imgW = img.width;
  int imgH = img.height;

  // Aspect Ratio Calculation: This correctly determines the ratio
  float imageAspectRatio = float(imgW) / float(imgH); // Width-to-height ratio

  // Declare variables for adjusted image size
  float imageWidthChanged, imageHeightChanged;
  float offsetX, offsetY; // Variables for centering

  // Size Resampling Algorithm with Corrected Aspect Ratio Logic
  if (imgW > imgH) { // Landscape image
    imageWidthChanged = w; 
    imageHeightChanged = imageWidthChanged / imageAspectRatio;

    // Error handling: Prevents incorrect scaling
    if (imageHeightChanged > h) {
      imageHeightChanged = h;
      imageWidthChanged = imageHeightChanged * imageAspectRatio;
    }
  } else { // Portrait image
    imageHeightChanged = h; 
    imageWidthChanged = imageHeightChanged * imageAspectRatio;

    // Error handling: Prevents incorrect scaling
    if (imageWidthChanged > w) {
      imageWidthChanged = w;
      imageHeightChanged = imageWidthChanged / imageAspectRatio;
    }
  }

  // Centering the Image in the Div
  offsetX = (w - imageWidthChanged) / 2;
  offsetY = (h - imageHeightChanged) / 2;

  // Draw the image inside the div using the ITD function
  ITD(x + offsetX, y + offsetY, imageWidthChanged, imageHeightChanged, f);

  // ================================================================
  // This function was created with AI assistance
  // Microsoft Copilot was used to generate and refine this code
  // ================================================================
}
//
// End ImageToDiv Function



//void ImageToDiv(float x, float y, float w, float h, String f) {
//  PImage img = loadImage(f);
//  float imgW = img.width;
//  float imgH = img.height;

//  float scale = ((w / imgW) > (h / imgH)) ? (h / imgH) : (w / imgW);

//  float newImgW = imgW * scale;
//  float newImgH = imgH * scale;

//  float offsetX = (w - newImgW) / 2;
//  float offsetY = (h - newImgH) / 2;

//  ITD(x + offsetX, y + offsetY, newImgW, newImgH, f);
//}

// Mr. Mercer Modified Version
void textToDiv(float Ax, float Ay, float Aw, float Ah, String t, color c) {
  /*
   println("Start of Console");
   String[] fontList = PFont.list();
   printArray(fontList);
  */
  float x, y, w, h;
  x = Ax * appWidth * ANP;
  y = Ay * appHeight * BNP;
  w = Aw * appWidth * ANP;
  h = Ah * appHeight * BNP;
  PFont appFont;
  float fontSize;
  String title = t;

  int shorterSide = ( appWidth >= appHeight ) ? appHeight : appWidth ;
  fontSize = shorterSide;
  fontSize = h * 0.6;
  appFont = createFont("Arial", fontSize);
  
  textFont(appFont, fontSize);
  //println( textWidth(title), w );
  while ( textWidth(title) > w  ) {
    fontSize = fontSize * 0.99;
    textFont(appFont, fontSize);
  }
  color colors = c;
  fill(colors);
  textAlign (CENTER, CENTER);
  textFont(appFont, fontSize);
  text(title, x, y, w, h);
  color whiteInk = #FFFFFF;
  fill(whiteInk);
}

/* AI Version

void ImageToDiv(float x, float y, float w, float h, String f) {
  PImage img = loadImage(f); // Load the image
  float imgW = img.width;   // Original image width
  float imgH = img.height;  // Original image height

  // Calculate scaling factor to fit the image within the given width and height
  float scale = min(w / imgW, h / imgH);

  // Calculate the new width and height of the image after scaling
  float newImgW = imgW * scale;
  float newImgH = imgH * scale;

  // Calculate offsets to center the image
  float offsetX = (w - newImgW) / 2;
  float offsetY = (h - newImgH) / 2;

  // Draw the image at the calculated position
  image(img, x + offsetX, y + offsetY, newImgW, newImgH);
}

*/

void ITD (float x, float y, float w, float h, String f) {
  image(loadImage(f), x+1, y+1, w-2, h-2);
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
boolean isPlay = false;
void mousePressed() {
  /*file = new SoundFile(this, "skibidi-toilet.mp3");
  file.play();
  img = loadImage("https://media.tenor.com/cwubAnd8gN4AAAAj/skibidi-skibidi-toilet.gif");
  image(img, 0, 0);*/
  //playList[1].loop();
  
  if (isPlay) {
     isPlay = false;
     playList[currentAudio].pause();
  } else {
     isPlay = true;
     playList[currentAudio].play();
  }
} // End mousePressed
//
void keyPressed() {
  //file = new SoundFile(this, "skibidi-toilet.mp3");
  // file.jumpTo(3);
  //file.play();
  //img = loadImage("https://media.tenor.com/cwubAnd8gN4AAAAj/skibidi-skibidi-toilet.gif");
  //image(img, 0, 0);
  if (key==' ') {
    if (isPlay) {
      isPlay = false;
       playList[currentAudio].pause();
    } else {
      isPlay = true;
       playList[currentAudio].play();
    }
  }
} // End keyPressed
//
// End Main Program
