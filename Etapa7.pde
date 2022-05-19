float posX1d,posX1e,posX1f,  posY1d,posY1e,posY1f;

void preEtapa7(){
  if(selector!=7){
    tiempo=finEtapa6;
    subetapa=1;
    background(0);
    noStroke();
    figuraSize = (width/16);
    figuraSize2 = figuraSize*2;
    selector=7;
  }
}

void etapa7(){
  //posX1c=posY1c=figuraSize/2;
  //grupoCirculos3();
//--------------------------------------------------------------------------------subetapa1  
  if(subetapa==1  &&  tiempo%5==0){
    background(0);
    if((random(0,1))<0.5)
      for(cambiarY=8.5; cambiarY>=5.5; cambiarY-=1){
        fill(6,10,10);
        circle(figuraSize*10.5,figuraSize*cambiarY, figuraSize);        //columna junto al rojo
      }
    if(tiempo%20==0){
      color1=color(int(random(7)),random(10),random(10));
      color2=color(int(random(7)),random(10),random(10));
      color3=color(int(random(7)),random(10),random(10));
      color4=color(int(random(7)),random(10),random(10));
      color5=color(int(random(7)),random(10),random(10));
      color6=color(int(random(7)),random(10),random(10));
      posX1a = 0.5+int(random(0,9));  posY1a = 0.5+int(random(0,4));
      posX1b = 0.5+int(random(0,9));  posY1b = 0.5+int(random(0,4));
      posX1c = 0.5+int(random(0,9));  posY1c = 0.5+int(random(0,4));
      posX1d = 0.5+int(random(0,9));  posY1d = 0.5+int(random(0,4));
      posX1e = 0.5+int(random(0,9));  posY1e = 0.5+int(random(0,4));
      posX1f = 0.5+int(random(0,9));  posY1f = 0.5+int(random(0,4));
    }
    if((random(0,1))<0.5)
      for(float cambiarYa=posY1a; cambiarYa<=posY1a+5; cambiarYa+=1){
      fill(color1);
      circle(figuraSize*posX1a,figuraSize*cambiarYa, figuraSize);        //columnas random
      }
    if((random(0,1))<0.5)
      for(float cambiarYa=posY1b; cambiarYa<=posY1b+5; cambiarYa+=1){
      fill(color2);
      circle(figuraSize*posX1b,figuraSize*cambiarYa, figuraSize);        //columnas random
      }
    if((random(0,1))<0.5)
      for(float cambiarYa=posY1c; cambiarYa<=posY1c+5; cambiarYa+=1){
      fill(color3);
      circle(figuraSize*posX1c,figuraSize*cambiarYa, figuraSize);        //columnas random
      }
    if((random(0,1))<0.5)
      for(float cambiarXa=posX1d; cambiarXa<=posX1d+5; cambiarXa+=1){
      fill(color4);
      circle(figuraSize*cambiarXa,figuraSize*posY1d, figuraSize);        //filas random
      }
    if((random(0,1))<0.5)
      for(float cambiarXa=posX1e; cambiarXa<=posX1e+5; cambiarXa+=1){
      fill(color5);
      circle(figuraSize*cambiarXa,figuraSize*posY1e, figuraSize);        //filas random
      }
    if((random(0,1))<0.5)
      for(float cambiarXa=posX1f; cambiarXa<=posX1f+5; cambiarXa+=1){
      fill(color6);
      circle(figuraSize*cambiarXa,figuraSize*posY1f, figuraSize);        //filas random
      } 
    if(tiempo>3500)  subetapa=2;
  }

//--------------------------------------------------------------------------------subetapa2
  if(subetapa==2){
    if(tiempo<3550){
      if(tiempo%5==0){
        background(0);
        if((random(0,1))<0.5)
          for(cambiarY=8.5; cambiarY>=5.5; cambiarY-=1){
            fill(6,10,10);
            circle(figuraSize*10.5,figuraSize*cambiarY, figuraSize);        //columna junto al rojo
          }
      }
    }else{
      background(0);
      for(cambiarY=8.5; cambiarY>=5.5; cambiarY-=1){
        fill(6,10,10);
        circle(figuraSize*10.5,figuraSize*cambiarY, figuraSize);        //columna junto al rojo
      }
      textFont(fuente1);
      textAlign(CENTER,BOTTOM);
      textSize(30);
      fill(10);
      text("BERNARD LEE\nANTHONY DAWSON\nJOHN KITZMILLER\nZENA MARSHALL\nEUNICE GAYSON",figuraSize*10.5,figuraSize*4.5);
    }
  }
  if(!keyPressed) tiempo++;
  fill(10,10,10);
  circle(figuraSize*12,figuraSize*8, figuraSize2);                    //círculo rojo grande
}
