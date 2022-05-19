boolean va =true;

void preEtapa6(){
  if(selector!=6){
    tiempo=finEtapa5;
    subetapa=1;
    background(0);
    noStroke();
    figuraSize = (width/16);
    posX1a=0+(figuraSize/2)+figuraSize*15;
    posY1a=0+(figuraSize/2)+figuraSize*4;
    cambiarX=0;
    cambiarY=0;
    va=true;
    posX1b=0+(figuraSize/2)+figuraSize*9;
    posY1b=0+(figuraSize/2)+figuraSize*3;
    posX1c=0+figuraSize/2;
    posY1c=0+figuraSize/2;
    selector=6;
  }
}

void etapa6(){
  
  if(!keyPressed) tiempo++;
  
  if(subetapa==1){

    if(posX1a>=figuraSize  &&  va){                                        //circulos ida-vuelta horizontal
      if(tiempo%5==0){
        if(posX1a>=(figuraSize/2)+figuraSize*15)
          color1=color(int(random(10)),10,10);  
        grupoCirculos1(posX1a,posY1a, true);                                //  ←  ←  ←
        grupoCirculos1(posX1a+figuraSize*2,posY1a, false);                  //ocultar
        posX1a-=figuraSize;
      }
    }else{
      va=false;
      if(tiempo%2==0){
        grupoCirculos1(posX1a,posY1a, true);                              //    →→→
        grupoCirculos1(posX1a-figuraSize*2,posY1a, false);                 //ocultar
        posX1a+=figuraSize;
        if(posX1a>=(figuraSize/2)+figuraSize*15)  va=true;
      }
    }
    
    if(posY1b>(0+(figuraSize/2)+figuraSize*(-2))){
      if(tiempo%10==0){
        grupoCirculos2(posX1b,posY1b);                               //  ↑↓  ↑↓  ↑↓
        posY1b-=figuraSize;
      }
    }else{
      color2=color(int(random(10)),10,10);
      rectMode(CENTER);
      fill(0);
      rect(0+(figuraSize/2)+figuraSize*9,0+(figuraSize/2)+figuraSize*1.5, figuraSize,figuraSize*4);    //ocultar
      rect(0+(figuraSize/2)+figuraSize*9,0+(figuraSize/2)+figuraSize*6.5, figuraSize,figuraSize*4);
      posY1b=0+(figuraSize/2)+figuraSize*3;
    }
    
    if(tiempo<3050){
      if(tiempo%20==0){
        grupoCirculos3();
      }
    }else  subetapa=2;
  }
  
  if(subetapa==2){
    fill(0);
    rectMode(CORNERS);
    rect(-10,posY1c+figuraSize*4.5, posX1c+figuraSize*8.5,height+10);
    textFont(fuente1);
    textAlign(CENTER,CENTER);
    textSize(30);
    fill(10);
    text("URSULA ANDRESS\nJOSEPH WISEMAN\nJACK LORD", posX1c+figuraSize*4,posY1c+figuraSize*6);
  }
}


//--------------------------------------------------------------------------------circulos ida-vuelta horizontal
void grupoCirculos1(float posX2, float posY2, boolean mostrar){
  
  if(mostrar){
    noStroke();
    fill(color1);
    circle(posX2,posY2, figuraSize);                          //mostrar
  }else{
    rectMode(CENTER);
    fill(0);
    rect(posX2,posY2, figuraSize,figuraSize);                 //ocultar
  }
}


//--------------------------------------------------------------------------------circulos ida-vuelta horizontal
void grupoCirculos2(float posX2, float posY2){
  noStroke();
  fill(color2);
  circle(posX2,posY2, figuraSize);
  circle(posX2,posY2+dist(posX1b,posY1b,posX1b,posY1a)*2, figuraSize);
}


//--------------------------------------------------------------------------------circulos random
void grupoCirculos3(){
  
  rectMode(CORNERS);
  fill(0);
  rect(-10,posY1c+figuraSize*4.5, posX1c+figuraSize*8.5,height+10);
  rect(-10,-10, posX1c+figuraSize*8.5,posY1c+figuraSize*3.5);
  rect(posX1c+figuraSize*9.5,-10, width+10,posY1c+figuraSize*3.5);
  rect(posX1c+figuraSize*9.5,posX1c+figuraSize*4.5, width+10,height+10);
  
  for(cambiarY=0; cambiarY<=3.5; cambiarY++){
    for(cambiarX=0; cambiarX<=8.5; cambiarX++){
      color3=color(int(random(10)),5,10,random(5));
      fill(color3);
      if((random(0,1))<0.5)  circle(posX1c+(figuraSize*cambiarX),posY1c+(figuraSize*cambiarY), figuraSize);  //arriba izquierda
    }
    for(cambiarX=10; cambiarX<=15; cambiarX++){
      color3=color(int(random(10)),5,10,random(5));
      fill(color3);
      if((random(0,1))<0.5)  circle(posX1c+(figuraSize*cambiarX),posY1c+(figuraSize*cambiarY), figuraSize);  //arriba derecha
    }
  }
  for(cambiarY=5; cambiarY<=10; cambiarY++){
    for(cambiarX=0; cambiarX<=8.5; cambiarX++){
      color3=color(int(random(10)),5,10,random(5));
      fill(color3);
      if((random(0,1))<0.5)  circle(posX1c+(figuraSize*cambiarX),posY1c+(figuraSize*cambiarY), figuraSize);  //abajo izquierda
    }
    for(cambiarX=10; cambiarX<=15; cambiarX++){
      color3=color(int(random(10)),5,10,random(5));
      fill(color3);
      if((random(0,1))<0.5)  circle(posX1c+(figuraSize*cambiarX),posY1c+(figuraSize*cambiarY), figuraSize);  //arriba derecha
    }
  }
}
