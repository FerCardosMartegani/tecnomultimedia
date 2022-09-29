/*
ALUMNO: FERNANDO CARDOS MARTEGANI (84256/3).  COMISIÓN 2.
VIDEO EXPLICATIVO: https://youtu.be/rof_VFSNtnk
*/

Fondo fondo;      //declarar objeto fondo de la clase madre Fondo

void setup(){
  size(800,600);
  colorMode(HSB, 360,100,100,100);
  
  fondo = new Fondo();      //instanciar objeto fondo
}

void draw(){
  fondo.ejecutar();        //método ejecutar, desencadena todo lo demás
}

void keyPressed(){
  if(key=='r')  fondo.reset();        //pulsar la tecla reinicia la animación
}
