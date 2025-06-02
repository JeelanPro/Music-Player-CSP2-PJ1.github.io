// Library


// Global Variable
int appWidth, appHeight;

float titleX, titleY, titleWidth, titleHeight;

PFont textStyle;
float textSize;
String title;
float textAspectRatio;
color textColor;
color textWhiteColor;


void setup() {
    // Display
    // size(500, 500);
    // appWidth = 500;
    // appHeight = 500;

    fullScreen();
    appWidth = displayWidth;
    appHeight = displayHeight;


    // Population
    titleX = appWidth/50 * 2;
    titleY = appHeight/50 * 2;
    titleWidth = appWidth/50 * 46;
    titleHeight = appHeight/50 * 5;

    title = "JeelanPro";
    textColor = #000000;
    textStyle = createFont ("Arial", 55);

    textWhiteColor = #FFFFFF;
    textSize = titleHeight;
    textAspectRatio = textSize / titleHeight;
    textSize = titleHeight*textAspectRatio;

    textAlign (CENTER, CENTER);
    textFont(textStyle, textSize);
    while ( titleWidth < textWidth( title ) ) {
        textSize *= 0.99;
        textFont(textStyle, textSize);
    }


    // Draw
    rect(titleX, titleY, titleWidth, titleHeight);
    fill(textColor);
    text(title, titleX, titleY, titleWidth, titleHeight);
    fill(textWhiteColor);
    

} // End Setup


void draw() {
} // End draw


void mousePressed() {
} // End mousePressed


void keyPressed() {
} // End keyPressed
