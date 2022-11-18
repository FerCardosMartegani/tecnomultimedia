/*
ALUMNO: FERNANDO CARDOS MARTEGANI (84256/3).  COMISIÓN 2.
VIDEO EXPLICATIVO: 
*/

import processing.sound.*;

Pantalla screen;
SoundFile sharksSong,  popSound, burbujasSound,  comerBuenoSound, comerMaloSound,  ganarSound, perderSound;      //declarar objetos para sonidos

void setup(){
  size(800,700);
  colorMode(HSB,360,100,100,100);
  imageMode(CENTER);  rectMode(CENTER);
  
  screen = new Pantalla();
  
  sharksSong = new SoundFile(this, "Sharks.mp3");            //si intento poner esto en una clase me tira que el constructor no existe                
  popSound = new SoundFile(this, "BubblePopSound.mp3");  
  burbujasSound = new SoundFile(this, "BubblesSound.mp3");
  comerBuenoSound = new SoundFile(this, "eatSound.mp3");
  comerMaloSound = new SoundFile(this, "eatVenenoso.mp3");
  ganarSound = new SoundFile(this, "ganarSound.mp3");
  perderSound = new SoundFile(this, "perderSound.mp3");
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
