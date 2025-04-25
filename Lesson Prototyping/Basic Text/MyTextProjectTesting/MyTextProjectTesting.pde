// Text: Dynamic
//
//Global Variables
//
float titleX, titleY, titleWidth, titleHeight;
//
int appWidth; //displayWidth
int appHeight; //displayHeight
void setup() {
  //Display
  //fullScreen();
  size(700, 500);
  appWidth = width; //displayWidth
  appHeight = height; //displayHeight
  int shorterSide = ( appWidth >= appHeight ) ? appHeight : appWidth ; //Landscape, Portrait, & Square
  ////
  ///*Fonts from OS
  // println("Start of Console");
  // String[] fontList = PFont.list(); //To list all fonts available on system
  // printArray(fontList); //For listing all possible fonts to choose, then createFont
  // */
  //fontSize = shorterSide; //changed int to float for strongly formatted language
  //appFont = createFont("Harrington", fontSize);
  ////Tools / Create Font / Find Font / Do Not Press "OK", known bug ( not loadFont() )
  ////
  ////Population
  titleX = appWidth*1/4;
  titleY = appHeight*1/4;
  titleWidth = appWidth*1/2;
  titleHeight = appHeight*1/10;
  ////
  ////DIVs
  rect(titleX, titleY, titleWidth, titleHeight);
  textToDiv(titleX, titleY, titleWidth, titleHeight, "Hello", #000000);
  ////
  ////Font Size Algorithm
  //float harringtonAspectRatio = 1.04; //AR = fontSize / rect(Height), unique for each font
  //fontSize = titleHeight * harringtonAspectRatio; //Extra Value "Cuts the Mullet OFF"
  //textFont(appFont, fontSize); //see variable note
  //println( textWidth(title), titleWidth );
  //while ( textWidth(title) > titleWidth  ) {
  //  fontSize = fontSize * 0.99;
  //  textFont(appFont, fontSize); //see variable note
  //  println( "Step:", textWidth(title), titleWidth );
  //}
  ////
  ////Code before Drawing Text
  //color purpleInk = #2C08FF;
  //fill(purpleInk); //Ink, hexidecimal copied from Color Selector
  //textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  ////Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  //textFont(appFont, fontSize); //see variable note
  ////textFont() has option to combine font declaration with textSize()
  ////Drawing Text
  //text(title, titleX, titleY, titleWidth, titleHeight);
  //color whiteInk = #FFFFFF;
  //fill(whiteInk); //reset
  ////
  
  
} //End Setup
void textToDiv(float x, float y, float w, float h, String t, color c) {
  /*
   println("Start of Console");
   String[] fontList = PFont.list();
   printArray(fontList);
  */
  PFont appFont;
  float fontSize;
  String title = t;

  int shorterSide = ( appWidth >= appHeight ) ? appHeight : appWidth ;
  fontSize = shorterSide;
  fontSize = h * 1;
  appFont = createFont("Arial", fontSize);
  
  textFont(appFont, fontSize);
  println( textWidth(title), titleWidth );
  while ( textWidth(title) > titleWidth  ) {
    fontSize = fontSize * 0.99;
    textFont(appFont, fontSize);
  }
  color colors = c;
  fill(colors);
  textAlign (CENTER, CENTER);
  textFont(appFont, fontSize);
  text(title, titleX, titleY, titleWidth, titleHeight);
  color whiteInk = #FFFFFF;
  fill(whiteInk);
}

//
void draw() {
}
//
void mousePressed() {} //End Mouse Pressed
//
void keyPressed() {} //End Key Pressed
//
//End of MAIN
