/* Dynamic Programming
 - Image Resampling is a binary algorithm with mulitple choices
 - may need to review algorithm multile times:
   - whole discussion introducing math, introduction with final formulae and specific use
   - main "computer points": varaibles, binary choices
   - reverse beginning with final formulae replicating a math class and given information
 */
//Library - Minim
//
//Global Variables
int appWidth, appHeight;
float imageDivX, imageDivY, imageDivWidth, imageDivHeight;
float imageWidthChanged, imageHeightChanged;
//
PImage myFirstImage;
//
void setup() {
  //Display
  fullScreen(); //Difficult setting with Infinite Loops
  //size(700, 500); //Testing Only
  appWidth = displayWidth; //displayWidth
  appHeight = displayHeight; //displayHeight
  //
  //Population
  imageDivX = appWidth/4;
  imageDivY = appHeight/4;
  imageDivWidth = appWidth/4*2;
  imageDivHeight = appHeight/4*2;
  //
  //Image Aspect Ratio Algorithm: demonstrating Landscape to Portrait
  String imagePathway = "//FS-052/studuser$/Gr10/j.muhammad1/My Documents/GitHub/Music-Player-CSP2-PJ1.github.io/Lesson Prototyping/Testing1/portrait.jpg"; //Concatenation ending
  myFirstImage = loadImage( imagePathway );
  int myFirstImageWidth = myFirstImage.width; //Image Properties
  int myFirstImageHeight = myFirstImage.height;
  // Choose >1 or <1, then Choose x / for bigger or smaller image resampling
  //Note: casting ... try without it ... truncation happens with no debugger or compiler errors
  float imageAspectRatio_GreaterOne = ( myFirstImageWidth >= myFirstImageHeight ) ? float(myFirstImageWidth)/float(myFirstImageHeight) : float(myFirstImageHeight)/float(myFirstImageWidth) ;
  //println(imageAspectRatio_GreaterOne);
  Boolean imageLandscape = ( myFirstImageWidth >= myFirstImageHeight ) ? true : false ;
  /*Only the image geometry needs to be know for the algorithm below
   - When the Geometries change, big dimension to small dimension must happen or image will not fit
   - still need an ERROR-Check with oddly shaped landscape-landscape, protrait-portrait resampling
   - size-decreasing algorithms (resampling) discussed in Text
   */
  if ( imageLandscape==true ) {
    imageWidthChanged = imageDivWidth;
    imageHeightChanged = ( myFirstImageWidth >= imageDivWidth ) ? imageWidthChanged/imageAspectRatio_GreaterOne : imageWidthChanged*imageAspectRatio_GreaterOne ;
    if ( imageHeightChanged > imageDivHeight ) { //ERROR Catch
      println("Image Aspect Ratio algorithm ERROR");
      exit();
    }
  } else {
    imageHeightChanged = imageDivHeight;
    imageWidthChanged = ( myFirstImageHeight >= imageDivHeight ) ? imageHeightChanged/imageAspectRatio_GreaterOne : imageHeightChanged*imageAspectRatio_GreaterOne ;
    if ( imageWidthChanged > imageDivWidth ) { //ERROR Catch
      println("Image Aspect Ratio algorithm ERROR");
      exit();
    }
  }
  //
  //DIV
  rect( imageDivX, imageDivY, imageDivWidth, imageDivHeight );
  //
  //Prototype Images
  image( myFirstImage, imageDivX + ((imageDivWidth-imageWidthChanged)/2), imageDivY, imageWidthChanged, imageHeightChanged );
  //
} //End setup
//
void draw() {
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
// End Main Program
