/*
ALUMNO: FERNANDO CARDOS MARTEGANI (84256/3).  COMISIÓN 2.
VIDEO EXPLICATIVO: 
*/

import processing.sound.*;
SoundFile sharksSong;

Pantalla screen;

void setup(){
  size(800,700);
  colorMode(HSB,360,100,100,100);
  imageMode(CENTER);  rectMode(CENTER);
  
  screen = new Pantalla();
  
  sharksSong = new SoundFile(this , "Sharks.mp3");
  sharksSong.rate(1.1);
  sharksSong.loop();                              //música de fondo
  
}

void draw(){
  screen.game();
}

void keyPressed(){
  screen.controles(key, true);
}
void keyReleased(){
  screen.controles(key, false);
}
void mouseClicked(){
  screen.click();
}
