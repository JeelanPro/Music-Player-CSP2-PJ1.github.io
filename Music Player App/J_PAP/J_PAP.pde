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
  
  currentAudio = 2;
  //
  imageX = displayWidth * (ANP * 0.5);
  imageY = displayHeight * (ANP * 0.5);
  imageWidth = displayWidth * (ANP * 1);
  imageHeight = displayHeight * (ANP * 1.5);
  
  playList[0] = minim.loadFile( "Songs/skibidi-toilet.mp3" );
  playList[1] = minim.loadFile( "Songs/qaseda.mp3" );
  playList[2] = minim.loadFile( "Songs/Virus.mp3" );
  //playList[2].play();
  
  imagePath[0] = "Images/JeelanPro.jpg";
  imagePath[1] = "Images/Virus.jpg";
  imagePath[2] = "Images/Skibidi.jpg";
  
  
  
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
  else if (op.equals("d1")) {
    /*
    displayWidth * ANP * w) < 
  (displayHeight * BNP
    */
    ImageToDiv(
        x * displayWidth * ANP,
        y * displayHeight * BNP,
        w * displayWidth * ANP,
        h * displayHeight * BNP,
        imagePath[currentAudio]
      );
    //ImageToDiv(
    //    x * displayWidth * ANP,
    //    y * displayHeight * BNP,
    //    w * displayWidth * ANP,
    //    h * displayHeight * BNP,
    //    "bike.jpg"
    //  );
    //ImageToDiv(
    //    x * displayWidth * ANP,
    //    y * displayHeight * BNP,
    //    w * displayWidth * ANP,
    //    h * displayHeight * BNP,
    //    "portrait.jpg"
    //  );
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
      /*ImageToDiv(
        innerX + finalInnerX,
        innerY,
        displayHeight * BNP * h,
        displayHeight * BNP * h,
        "JeelanPro.jpg"
      );*/
    } else {
      rect(
        innerX + finalInnerX,
        innerY,
        displayWidth * ANP * w,
        displayWidth * ANP * w
      );
      /*ImageToDiv(
        innerX + finalInnerX,
        innerY,
        displayWidth * ANP * w,
        displayWidth * ANP * w,
        "JeelanPro.jpg"
      );*/
    }
  }
  else {
    rect(
      innerX + finalInnerX + (smallerSide/4 * 1),
      innerY + (smallerSide/4 * 1),
      smallerSide/4 * 2,
      smallerSide/4 * 2
    );
    /*ImageToDiv(
      innerX + finalInnerX + (smallerSide/4 * 1), 
      innerY + (smallerSide/4 * 1), 
      smallerSide/4 * 2, 
      smallerSide/4 * 2, 
      "JeelanPro.jpg"
    );*/
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

void ImageToDiv(float x, float y, float w, float h, String f) {
  PImage img = loadImage(f);
  float imgW = img.width;
  float imgH = img.height;

  float scale = ((w / imgW) > (h / imgH)) ? (h / imgH) : (w / imgW);

  float newImgW = imgW * scale;
  float newImgH = imgH * scale;

  float offsetX = (w - newImgW) / 2;
  float offsetY = (h - newImgH) / 2;

  ITD(x + offsetX, y + offsetY, newImgW, newImgH, f);
}

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
