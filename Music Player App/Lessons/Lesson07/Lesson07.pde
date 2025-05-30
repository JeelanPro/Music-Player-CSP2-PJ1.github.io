// Library


// Global Variable
int appWidth, appHeight;

float titleX, titleY, titleWidth, titleHeight;

PFont titleFont;
float fontSize;
String title;
float textAspectRatio;
color titleColor;
color whiteColor;


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

    title = "JeelanPro Computer Services is the best one of the powerful. Computer Services";
    titleColor = #2C08FF;

    whiteColor = #FFFFFF;
    fontSize = titleHeight;
    textAspectRatio = fontSize / titleHeight;
    fontSize = titleHeight*textAspectRatio;

    titleFont = createFont ("Arial", 55);
    textAlign (CENTER, CENTER);
    textFont(titleFont, fontSize);


    // Action
    while ( titleWidth < textWidth( title ) ) {
        fontSize *= 0.99;
        textFont(titleFont, fontSize);
    }


    // Draw
    rect(titleX, titleY, titleWidth, titleHeight);
    fill(titleColor);
    text(title, titleX, titleY, titleWidth, titleHeight);
    fill(whiteColor);
    

} // End Setup


void draw() {
} // End draw


void mousePressed() {
} // End mousePressed


void keyPressed() {
} // End keyPressed
