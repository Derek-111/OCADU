void setup(){
  size(800,800);
}

void draw(){
  background(255);
  for(int ix=0; ix<width-180; ix+=100){
    for(int iy=0; iy<height-180; iy+=100){
      drawLeaf(ix+100, iy+100, 75, color(200-ix*iy/1500,100,10), mouseX, mouseY);
    }
  }
}

void drawLeaf(float xin, float yin, float s, color col, float mX,float mY){
  float dx = mX - xin;
  float dy = mY - yin;
  float angle = atan2(dy, dx);
  leaf(xin, yin, s, col, angle);
}

void leaf(float x, float y, float size, color c, float a){
  stroke(0, 0);
  rectMode(CENTER);
  
  pushMatrix();
  translate(x, y);
  rotate(a);
  
  fill(100, 80, 15);
  rect(0+size*.75, 0, size*.5, size*.05);
  fill(c);
  ellipse(0, 0, size*1.3, size);
  arc(0, 0, size*1.8, size, PI/2, PI+PI/2);
  
  stroke(0, 50);
  noFill();
  line(size*.65, 0, -size*.8, 0);
  line(size*.5, 0, +size*.2, -size*.35);
  line(size*.5, 0, +size*.2, size*.35);
  line(size*.3, 0, -size*.06, -size*.4);
  line(size*.3, 0, -size*.06, size*.4);
  line(size*.1, 0, -size*.23, -size*.34);
  line(size*.1, 0, -size*.23, size*.34);
  line(-size*.1, 0, -size*.4, -size*.27);
  line(-size*.1, 0, -size*.4, size*.27);
  line(-size*.3, 0, -size*.53, -size*.18);
  line(-size*.3, 0, -size*.53, size*.18);
  line(-size*.5, 0, -size*.65, -size*.1);
  line(-size*.5, 0, -size*.65, size*.1);
  popMatrix();
}
