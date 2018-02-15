import processing.video.*;
Capture cam;
color trackColor;
PImage camMirror;
PImage camFlip;


void setup() {
  size(640, 480);
  //background(0);
  frameRate(30);
  cam = new Capture(this, width, height, 30);
  cam.start();
  camMirror = new PImage(cam.width, cam.height);
  smooth();
}
void draw() {
  
  if (cam.available() == true) {
    cam.read();
    cam.loadPixels();
    cam.updatePixels();
    background(cam);
    camMirror.loadPixels();
    for (int y = 0; y < cam.height; y+=2) {
      for (int x = 0; x < cam.width; x++) {
        int index = (width-x-1) + y*width;
        camMirror.pixels[y*width+x] = cam.pixels[index];
      }
    }       
  camMirror.updatePixels();
  image(camMirror, 0, 0);
 }
}