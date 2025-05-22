// Library


// Global Variable
int appWidth, appHeight;

float imageDivX, imageDivY, imageDivWidth, imageDivHeight;
float imageWidthChanged, imageHeightChanged;
String filePath;
PImage myImage;


void setup() {
    // Display
    size(900, 600);
    appWidth = 900;
    appHeight = 600;

    // fullScreen();
    // appWidth = displayWidth;
    // appHeight = displayHeight;


    // Population
    imageDivX = appWidth/4 * 1;
    imageDivY = appHeight/4 * 1;
    imageDivWidth = appWidth/4 * 2;
    imageDivHeight = appHeight/4 * 2;

    filePath = "Images/JeelanPro.jpg";
    myImage = loadImage(filePath);
    float imageWidth = myImage.width;
    float imageHeight = myImage.height;

    float imageAspectRatioGreaterOne = (imageWidth >= imageHeight) ? imageWidth/imageHeight : imageHeight/imageWidth;
    Boolean imageLandscape = (imageWidth >= imageHeight) ? true : false;

    if (imageLandscape) {
        imageWidthChanged = imageDivWidth;
        imageHeightChanged = (imageWidth >= imageDivWidth) ? imageWidthChanged/imageAspectRatioGreaterOne : imageWidthChanged*imageAspectRatioGreaterOne;
        if (imageHeightChanged > imageDivHeight) { // Error
            println("Error: Image height is greater than imageDivHeight");
            exit();
        }
    } else {
        imageHeightChanged = imageDivHeight;
        imageWidthChanged = (imageHeight >= imageDivHeight) ? imageHeightChanged/imageAspectRatioGreaterOne : imageHeightChanged*imageAspectRatioGreaterOne;
        if (imageWidthChanged > imageDivWidth) { // Error
            println("Error: Image width is greater than imageDivWidth");
            exit();
        }
    }


    // Draw
    rect(imageDivX, imageDivY, imageDivWidth, imageDivHeight);
    image(myImage, imageDivX + (imageDivWidth - imageWidthChanged)/2, imageDivY + (imageDivHeight - imageHeightChanged)/2, imageWidthChanged, imageHeightChanged);

} // End Setup


void draw() {
} // End draw


void mousePressed() {
} // End mousePressed


void keyPressed() {
} // End keyPressed
