void setup(){
 
  size(400,400);
  textAlign(CENTER,CENTER);
  colorMode(HSB, 360, 100,100);
  rectMode(CENTER);
  
}

int T1;
int T2;
float Col1;
float Pos1 = 60;
float Pos2 = 340;

void draw(){
  
  T1 = frameCount%50;
  T2 = 51-T1;
  Col1 = 80+T1*0.5;
  background(35,100,Col1);
  
  fill(35,Col1,25);
  square(Pos1+random(-10,10),Pos1+random(-10,10), 50);
  square(Pos2+random(-10,10),Pos1+random(-10,10), 50);
  square(Pos1+random(-10,10),Pos2+random(-10,10), 50);
  square(Pos2+random(-10,10),Pos2+random(-10,10), 50);
  
  strokeWeight(20);
  stroke(360,100,100,200-T1*3);
  line(Pos1,Pos1, int (random(150,250)),int (random(150,250)));
  line(Pos1,Pos2, int (random(150,250)),int (random(150,250)));
  line(Pos2,Pos1, int (random(150,250)),int (random(150,250)));
  line(Pos2,Pos2, int (random(150,250)),int (random(150,250)));
  strokeWeight(1);
  stroke(0);
  
  fill(35,Col1,25);
  ellipse(200,200, 200+T2*4,100+T2*3);
 
  textSize(T2);
  fill(360,Col1,Col1);
  text("Fernando", int (random(150,250)),int (random(150,250)));
  textSize(50+T2*0.35);
  fill(360,100,100,200-T1*3);
  text("Fernando", 200,200);
      
  
  println(mouseX," ; ",mouseY);
  println(T1+","+T2);
  
}
