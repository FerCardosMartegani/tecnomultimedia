void setup(){

  size(400,400);
  colorMode(RGB);  //redundancia por seguridad

}  

void draw(){

 background(190,230,255);
 
 //suelo
  fill(240);
  rectMode(CENTER);
  rect(200,350, 410,100);
  fill(190,250,250,127);
  ellipseMode(CENTER);  //redundancia por seguridad
  ellipse(197,350, 250,70);

 //brazo der
  strokeWeight(10);
  stroke(120,70,40);
  line(270,210, 300,310);
  line(300,310, 320,310);
  line(300,310, 315,325);
  line(300,310, 300,330);
  strokeWeight(1);
  stroke(0);

 //cuerpo
  fill(255,255,255);
  ellipse(200,300, 175,110);
  ellipse(210,225, 150,110);
  ellipse(215,150, 125,100);

 //cara
  fill(0);  //boca
  circle(200,190, 10);
  circle(210,180, 12);
  circle(220,180, 8);
  circle(230,185, 9);
  circle(235,195, 10);

  circle(200,129, 20);  //ojos
  circle(235,140, 25);

  fill(240,100,20);  //zanahoria
  triangle(190,200, 200,150, 220,165);

 //sombrero
  fill(75);
  ellipse(230,110, 130,50);
  quad(200,50, 190,110, 270,110, 280,50);
  arc(230,110, 80,25, 0,PI);
  ellipse(240,50, 80,25);

 //botones
  fill(0);
  circle(220,225, 15);
  circle(215,265, 15);
  circle(215,370, 15);
  fill(240);
  stroke(240);
  circle(215,245, 15);
  stroke(0);

 //brazo izq
  strokeWeight(10);
  stroke(120,70,40);
  line(155,210, 65,265);
  line(65,265, 40,260);
  line(65,265, 45,280);
  line(65,265, 70,290);
  strokeWeight(1);
  stroke(0);
  
 //gotas
  fill(190,250,250,127);
  ellipse(235,160, 10,17);
  ellipse(150,260, 10,17);
  ellipse(270,210, 10,17);
  ellipse(175,190, 10,17);
  ellipse(245,280, 10,17);
  
 //sol
  fill(255,255,0,50);
  circle(0,0, 350);
  circle(0,0, 300);
  circle(0,0, 250);
  fill(255,255,0);
  circle(0,0, 200);
  
 //diálogo
  fill(255);
  triangle(280,190, 300,150, 330,150);
  rect(332,150, 80,40, 10);
  textSize(20);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Help!", 332,150);
  
  
 //ubicar cursor
  println(mouseX + " ; " + mouseY);
  
}
