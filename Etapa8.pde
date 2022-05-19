void preEtapa8(){
  if(selector!=8){
    tiempo=finEtapa7;
    subetapa=1;
    background(0);
    noStroke();
    figuraSize = (width/11);
    color1=color(int(random(10)),10,10);
    cambiarX = 9;
    cambiarY = 5;
    selector=8;
  }
}


void etapa8(){
  
  if(!keyPressed) tiempo++;
  
  if(subetapa==1  &&  tiempo%5==0){
    fill(color1);
    int columna = int(random(1,6));
    cambiarX = 9.5-columna;
    cambiarY = 5.5-int(random(0,columna));
    circle(figuraSize*cambiarX,figuraSize*cambiarY, figuraSize);                    //circulos random
    if(tiempo>4000)  subetapa=2;
  }
  
  if(subetapa==2){
    background(0);
    textFont(fuente1);
    textAlign(RIGHT,BOTTOM);
    textSize(30);
    fill(10);
    text("MICHEL MOK\nLOIS MAXWELL\nPETER BURTON\nYVONNE SHIMA\nLOUIS BLAAZER\nREGINALD CARTER\nWM. FOSTER-DAVIS\nMARGARET LE WARS",
    figuraSize*3.5,figuraSize*6);
    fill(color1);
    for(int columna=0; columna<=4; columna+=1){
      cambiarX = 8.5-columna;
      for(cambiarY=5.5; cambiarY>=5.5-columna; cambiarY-=1){
        circle(figuraSize*cambiarX,figuraSize*cambiarY, figuraSize);                //asegurar circulos
      }
    }
  }
}
