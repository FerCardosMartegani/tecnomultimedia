class Trees{
  
//--------------------------------------------------------------------------------------------------------Propiedades
  float posX,posY,tamX,tamY;
  color tronco, hojas,hojasStroke;
  int troncoWeight, hojasWeight;
  boolean onFire;

//--------------------------------------------------------------------------------------------------------Constructor
  Trees(float X, float Y){
    posX=X; posY=Y;
    onFire=false;
    tronco=color(30,60,80);
    troncoWeight=hojasWeight=10;
    hojas=color(145,80,80);
    hojasStroke=color(145,80,100);
    tamX=150;  tamY=125;
  }

//--------------------------------------------------------------------------------------------------------Métodos
  void show(){
    pushStyle();
      strokeWeight(troncoWeight);
      stroke(tronco);                              //tronco y ramas
      line(posX,posY, posX,posY+100);
      line(posX,posY, posX-50,posY-50);
      line(posX,posY, posX+50,posY-25);
    if(!onFire){
      fill(hojas);                            //hojas, si no le pegó ningún rayo todavía
      stroke(hojasStroke);
      ellipse(posX,posY-50, tamX,tamY);
    }
    popStyle();
  }
}
