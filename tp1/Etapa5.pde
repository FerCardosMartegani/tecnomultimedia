void preEtapa5(){
  if(selector!=5){
    tiempo=finEtapa4;
    subetapa=1;
    background(0);
    contador=0;
    figuraSize=100;
    posX1a=940;
    posY1a=-(figuraSize/5);
    cambiarY=figuraSize+(figuraSize/5);
    maximo=5;
    noStroke();
    selector=5;
  }
}

void etapa5(){
//--------------------------------------------------------------------------------subetapa1  
  if(!keyPressed) tiempo++;
  if(subetapa==1){
    if(tiempo<2250){
      if(tiempo%2.5==0){
        if(contador<maximo){
          if(posY1a<0)  color0=color(int(random(10)),10,7,10);
          cuadrados(posX1a,posY1a, figuraSize,color0, false);                              //columna 1 random
          posY1a+=cambiarY;
          contador++;
        }else{
          background(0);
          contador=0;
          posY1a=-(figuraSize/5);
          maximo=int(random(3,5));
        }
      }
    }else{
      contador=0;
      posY1a=-(figuraSize/5);
      background(0);
      subetapa=2;
    }
  }
//--------------------------------------------------------------------------------subetapa2
  if(subetapa==2){
    if(contador<=7){
      if(tiempo%20==0){
        if(posY1a<0)  color0=color(int(random(10)),10,7,10);
        cuadrados(posX1a,posY1a, figuraSize,color0, true);                           //columna 1
        cuadrados(posX1a,posY1a-cambiarY, figuraSize,color0, false);                  //ocultar 007
        posY1a+=cambiarY;
        contador++;
      }
    }
    if(contador>7 && contador<16){
      if(tiempo%5==0){
        stroke(0);
        strokeWeight(5);
        color0=color(0,0,0,10);
        cuadrados(posX1a,posY1a, figuraSize,color0, false);                          //ocultar columna 1
        posY1a-=cambiarY;
        contador++;
      }
    }
    if(contador==16){
      background(0);
      contador++;
    }
    if(contador>16  && contador<25){
      if(tiempo%5==0){
        noStroke();
        if(posY1a<0)  color0=color(int(random(10)),10,7,10);
        cuadrados(posX1a,posY1a, figuraSize,color0, false);                          //columna 1
        posY1a+=cambiarY;
        contador++;
      }
    }
    if(contador==25){
      posX1a-=cambiarY;
      posY1a=-(figuraSize/5);
      contador++;
    }
    if(contador>25  &&  contador<31){
      if(tiempo%20==0){
        if(posY1a<0)  color0=color(int(random(10)),10,7,10);
        cuadrados(posX1a,posY1a, figuraSize,color0, true);                           //columna 2
        cuadrados(posX1a,posY1a-cambiarY, figuraSize,color0, false);                  //ocultar 007
        posY1a+=cambiarY;
        if(contador<31)  contador++;
      }
    }
    if(contador>=31){
      background(0);
      for(posY1a=-(figuraSize/5); posY1a<500; posY1a+=cambiarY){
        cuadrados(posX1a,posY1a, figuraSize,color0, true);                           //columna 2
        cuadrados(posX1a,posY1a-cambiarY, figuraSize,color0, false);                  //ocultar 007
      }
      textFont(fuente1);
      textAlign(RIGHT,CENTER);
      textSize(30);
      fill(10);
      text("starring SEAN CONNERY", posX1a-figuraSize,posY1a-cambiarY);            //Sean Connery
    }
  }
}

//--------------------------------------------------------------------------------cuadrados

void cuadrados(float posX2, float posY2, float rectSize, color colorCuadrados, boolean mostrar007){
  
  rectMode(CENTER);
  fill(colorCuadrados);
  rect(posX2,posY2, rectSize,rectSize, 10);
  
  if(mostrar007){
    textFont(fuente3);
    textAlign(CENTER,CENTER);
    textSize(40);
    fill(10);
    text("007", posX1a,posY1a);                                            //007
  }
}
