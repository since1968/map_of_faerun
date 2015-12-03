// load map of Faerun at full size and superimpose
// mileage grid. 150 pixels == 120 miles

// for ease just draw grid in the visible portion of the map

PImage imgMap ; // declare variable of type PImage
PImage imgMiles ;

// load image at Sword Coast
int mapX = -300;
int mapY = -100;
int sizeX = 2200;
int sizeY = 1800;

// variables for distance
float distance;
int x1, y1, x2, y2;
int mouseCount = 0;
float miles;
float days;

void setup() {
  size(1600, 1200);
  stroke(153);
  strokeWeight(1);
  imgMap = loadImage("faerun.jpg");  // load image into program
  imgMiles = loadImage("scale.jpg");
  // display image at its actual size at point x,y
  image(imgMap, mapX, mapY);
}

void draw() {
  
  /* grid lines
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
  
  */
  
  // load scale
  image(imgMiles, width - 600, height - 60);

  
}

// draw line from point to point and measure distance
void mousePressed() {
  if (mouseCount== 0) {
    x1 = mouseX;
    y1 = mouseY;
    smooth();
    noStroke();
    fill(225);
    ellipse (x1, y1, 5, 5);
 //   textAlign(CENTER);
 //   text("point 1 ("+x1+", "+y1+")",x1, y1+20);
    mouseCount++;
  }
  else if (mouseCount!= 0) {
    x2 = mouseX;
    y2 = mouseY;
    smooth();
    fill(225);
    noStroke();
    ellipse (x2, y2, 5, 5);
    mouseCount=0;
     
    //additional information
 //   textAlign(CENTER);
 //   text("point 2 ("+x2+", "+y2+")",x2, y2+20);
    stroke(133, 37, 40);
    strokeWeight(4);
    strokeCap(ROUND);
    line(x1,y1,x2,y2);
    distance = calculateDist(x1, y1, x2, y2);
    // textAlign(CENTER);
    // text("distance: "+distance, width/2, height/2);
  }
  // println(abs(x2-x1)+", "+abs(y2-y1));
  // println(mouseCount);
  miles = distance * .8;
  days = miles / 15;
  
  if (mouseCount == 0 ) {
    println("Distance: " + round(miles) + " miles");
    println("That's about " + round(days) + " days on foot.");
  }
}
 
float calculateDist(int x1, int y1, int x2, int y2) {
  float b = sq(x2-x1) + sq(y2-y1);
  float a = floor(sqrt(b));
  return a;
}