// Library


// Global Variable
int appWidth, appHeight;

float divX, divY, divWidth, divHeight;


void setup() {
    // Display
    size(900, 600);
    appWidth = 900;
    appHeight = 600;

    // fullScreen();
    // appWidth = displayWidth;
    // appHeight = displayHeight;


    // Population
    divX = appWidth/4 * 1;
    divY = appHeight/4 * 1;
    divWidth = appWidth/4 * 2;
    divHeight = appHeight/4 * 2;


    // Draw
    rect(divX, divY, divWidth, divHeight);
    

} // End Setup


void draw() {
} // End draw


void mousePressed() {
} // End mousePressed


void keyPressed() {
} // End keyPressed
