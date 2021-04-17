import processing.serial.*;

Serial myPort;
int[] serialInArray = new int[6];
int serialCount = 0;
int cVal, switchL, switchR, xPos, yPos, pic;
boolean firstContact = false;
int str = 1;

void setup() {
  size(500, 500);
  background(255);
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[13], 9600);
}

void draw() {
  
  colorMode(HSB, 255);
  strokeWeight(str);
  stroke(cVal, 255, 255);
  point(map(xPos, 0, 255, width, 0), map(yPos, 0, 255, 0, height));
  
  if (pic == 1) {
    save("etched_sketch.tif");
    delay(3000);
  }
  if (str > 0 && switchL == 1){
    str--;
    delay(300);
  }
  if (str < 10 && switchR == 1){
    str++;
    delay(300);
  }
  if (switchL == 1 && switchR == 1) {
    background(255);
  }
}

void serialEvent(Serial myPort) {
  int inByte = myPort.read();
  if (firstContact == false) {
    if (inByte == 'A') {
      myPort.clear();
      firstContact = true;
      myPort.write('A');
    }
  }
  else {
    serialInArray[serialCount] = inByte;
    serialCount++;
    if (serialCount > 5) {
      cVal = serialInArray[0];
      switchL = serialInArray[1];
      switchR = serialInArray[2];
      xPos = serialInArray[3];
      yPos = serialInArray[4];
      pic = serialInArray[5];
      
      println("colour: " + cVal + ", " + "Left Switch: " + switchL + ", " + "Right Swtich: " + switchR + ", " + "X: " + xPos + ", " + "Y: " + yPos);
      myPort.write('A');
      serialCount = 0;
    }
  }
}
