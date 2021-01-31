void setup() {
  size(1000, 1000);
  background(255);
  frameRate(20);
}

float r = 255;
float g = 0;
float b = 0;
// this value determines how quickly the colours will progress
float x = 7.5; // NOTE: the value MUST divide evenly into 255 or else the colour will get stuck
  
void draw() {
  pushMatrix();
  strokeWeight(random(1, 5));
  stroke(r, g, b, 50);
  translate(width/2, height/2);
  rotate(radians(frameCount)*1.82);
  line(width/4, 0, width/4, 750);
  popMatrix();
  // r = 255, g = 0, b = 0
  if((r == 255) && (b == 0)) {
    g = g + x;
  }
  // r = 255, g = 255, b = 0
  if((g == 255) && (b == 0)) {
    r = r - x;
  }
  // r = 0, g = 255, b = 0
  if((r == 0) && (g == 255)) {
    b = b + x;
  }
  // r = 0, g = 255, b = 255
  if((r == 0) && (b == 255)){
    g = g - x;
  }
  // r = 0, g = 0, b = 255
  if((g == 0) && (b == 255)){
    r = r + x;
  }
  // r = 255, g = 0, b = 255
  if((r == 255) && (g == 0)){
    b = b - x;
  } 
}
