int cPot = 0;
int switchL = 0;
int switchR = 0;
int pic = 0;
int xPot = 0;
int yPot = 0;
int inByte = 0;

void setup() {
  Serial.begin(9600);
  while (Serial.available() <= 0) {
    Serial.print('A');
    delay(300);
  }
}

void loop() {
  if (Serial.available() > 0) {
    inByte = Serial.read();
    cPot = map(analogRead(A0), 0, 1023, 0, 255);
    switchL = digitalRead(13);
    switchR = digitalRead(12);
    xPot = map(analogRead(A1), 0, 1023, 0, 255);
    yPot = map(analogRead(A2), 0, 1023, 0, 255);
    pic = digitalRead(8);

    Serial.write(cPot);
    Serial.write(switchL);
    Serial.write(switchR);
    Serial.write(xPot);
    Serial.write(yPot);
    Serial.write(pic);
  }
}
