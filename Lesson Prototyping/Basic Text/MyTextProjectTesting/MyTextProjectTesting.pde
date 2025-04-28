// Text: Dynamic
//
//Global Variables
//
float titleX, titleY, titleWidth, titleHeight;
//
int appWidth; //displayWidth
int appHeight; //displayHeight
void setup() {
  //size(700, 500);
  fullScreen();
  appWidth = displayWidth; //displayWidth
  appHeight = displayHeight; //displayHeight
  titleX = appWidth*1/4;
  titleY = appHeight*1/4;
  titleWidth = appWidth*1/2;
  titleHeight = appHeight*1/10;
  rect(titleX, titleY, titleWidth, titleHeight);
  textToDiv(titleX, titleY, titleWidth, titleHeight, "Hello", #000000);
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
  println( textWidth(title), w );
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

//
void draw() {
}
//
void mousePressed() {} //End Mouse Pressed
//
void keyPressed() {} //End Key Pressed
//
//End of MAIN
