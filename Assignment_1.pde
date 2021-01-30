void setup() {
  size(500, 500);
  background(255);
  frameRate(20);
}
  float r = 255;
  float g = 0;
  float b = 0;
  float x = 7.5;
  
void draw() {
  pushMatrix();
  strokeWeight(random(1, 5));
  stroke(r, g, b);
  translate(width/2, height/2);
  rotate(radians(frameCount)*2);
  line(width/4, -2000, width/4, 2000);
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
