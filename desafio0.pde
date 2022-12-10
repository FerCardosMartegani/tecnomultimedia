void setup(){
  colorMode(RGB);
  size (400,400);
}

void draw(){
  background (0,0,250);
  stroke(0);
  strokeWeight(5);
  
  fill(250,0,0);
  circle(200, 200, 350);
  
  fill(250);
  circle(200, 200, 250);
  
  fill(250,0,0);
  circle(200, 200, 150);
  
  fill(250);
  circle(200, 200, 50);
  
  //scale(2,1);
  fill(0);
  textAlign(CENTER);
  
  textSize(15);
  text("40", 200 , 195);
  
  textSize(30);
  text("30", 200 , 158);
  
  textSize(33);
  text("20", 200 , 110);
  
  textSize(37);
  text("10", 200 , 60);
  
}
