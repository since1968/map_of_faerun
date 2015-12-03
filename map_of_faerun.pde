// load map of Faerun at full size and superimpose
// mileage grid. 150 pixels == 120 miles

// for ease just draw grid in the visible portion of the map

PImage img ; // declare variable of type PImage

// load image at Sword Coast
int mapX = -300;
int mapY = -100;
int sizeX = 2200;
int sizeY = 1800;


void setup() {
  size(2200, 1200);
  stroke(153);
  strokeWeight(1);
  img = loadImage("faerun.jpg");  // load image into program
}

void draw() {
  // display image at its actual size at point x,y
  image(img, mapX, mapY);
  for(int i=10; i < width; i += 10) {
    if((i % 150) == 0) {
      stroke(255);
      line(i, 0, i, height);
    }
  }
  
  for(int i=10; i < height; i += 10) {
    if((i % 150) == 0) {
      stroke(255);
      line(0, i, width, i);
    }
  }
}