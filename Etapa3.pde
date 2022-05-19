float posY1b,  figuraSize2,figuraSize3,  posX1c,posY1c,  modulo, cambiarX,cambiarY;  int contador=0;

void preEtapa3(){
  if(selector!=3){
    tiempo=finEtapa2;
    subetapa=1;
    posX1a = 740;
    posY1a = 500;
    figuraSize2 = (width/12);                                                          //repartir el espacio en 12 columnas
    figuraSize3 = (dist(posX1b+(figuraSize2*2.5),0, posX1b+(figuraSize2*8.5),0))/8;    //repartir el espacio en 8 columnas
    posX1b = figuraSize2;
    posY1b = 0;
    posX1c = posX1b+(figuraSize2*2.5)+(figuraSize3/2);
    posY1c = 0;
    contador=0;
    modulo=10;
    noStroke();
    selector=3;
  }
}

void etapa3(){
//--------------------------------------------------------------------------------subetapa1
  if(subetapa==1){
    background(0);
    if(!keyPressed) tiempo++;
    if(tiempo<850){
      figuraSize = (310-figuraSize3);
      fill(10);
      circle(posX1c+(figuraSize3*6.5),posY1a, figuraSize);    //círculo inicial grande
    }
    if(tiempo>=850 && tiempo<900){
      figuraSize = figuraSize3*2;
      fill(10);
      circle(posX1c+(figuraSize3*6.5),posY1c+(figuraSize3*7.5), figuraSize);    //círculo inicial chico
    }
    if(tiempo>=900){
      fill(10);
      posX1a=posX1c+(figuraSize3*6.5);
      posY1a=posY1c+(figuraSize3*7.5);
      circle(posX1a,posY1a, figuraSize);
      subetapa=2;
    }
  }
//--------------------------------------------------------------------------------subetapa2
  if(subetapa==2){
    if(contador<30){
      if(!keyPressed) tiempo++;
      if(tiempo%20==0){
        background(0);
        circulosGrandes();          //circulos grandes
        circulosChicos();            //circulos chicos
        if((random(0,1))<0.5){
          fill(10);
        }else{
          fill(10,10,10);
        }
        circle(posX1a,posY1a, figuraSize);                                            //circulo titulo
        if(contador<=8)        contador+=1;                                            //contador lento
      }
      if(tiempo%10==0){
        circulosTitulo1();                                                             //circulos que serán el título
        if(contador>=8)        contador+=1;                                            //contador rápido
      }
    }else{
      subetapa=3;
      modulo=10;
    }
  }
//--------------------------------------------------------------------------------subetapa3
  if(subetapa==3){
    if(tiempo<1600){
      if(!keyPressed) tiempo++;
      if(tiempo%modulo==0){
        background(0);
        color4=color(10,10,10);
        circulosTitulo2();                                                        //circulos parpadeantes
        if((random(0,1))<0.5  &&  tiempo<1450){
          fill(0);
        }else{
          fill(10,10,10);
        }
        circle(posX1a,posY1a, figuraSize);                                              //circulo del titulo
      }
      if(tiempo>1450  &&  tiempo%20==0){
        modulo+=0.25;
      }
      if(tiempo>1450  &&  tiempo<1475){
        fill(10);
        for(cambiarX=3; cambiarX<=7; cambiarX++){
          circle(posX1c+(figuraSize3*cambiarX),posY1c+(figuraSize3*4), figuraSize3);    //circulos Fleming
        }
      }
      if(tiempo==1475)  background(0);
    }else  subetapa=4;
  }
//--------------------------------------------------------------------------------subetapa4
  
  if(subetapa==4){
    if(!keyPressed) tiempo++;
    background(0);
    textAlign(LEFT,CENTER);
    fill(color3+color(0,10,10));
    textSize(1);
    textFont(fuente2);
    text("Dr.", posX1c+(figuraSize3*2.5),posY1c+(figuraSize3*5.5));
    fill(10,10,10);
    text("NO", posX1c+(figuraSize3*2.5),posY1a);
  }
  if(tiempo>1475){
    textFont(fuente1);
    textAlign(LEFT,CENTER);
    textSize(35);
    fill(10);
    text("IAN FLEMING'S", posX1c+(figuraSize3*2.5),posY1c+(figuraSize3*4));
  }
}


//--------------------------------------------------------------------------------circulos grandes (3+2 columnas)
color color0,  color1,color2,color3,color4,color5,color6;
void circulosGrandes(){

  color1=color(4.75,10,10);
  
  for(cambiarX=0; cambiarX<=2; cambiarX++){
    if((random(0,1))<0.5){
      fill(color1);
      for(cambiarY=0; cambiarY<=6; cambiarY++){
        circle(posX1b+(figuraSize2*cambiarX),posY1b+(figuraSize2*cambiarY), figuraSize2);
      }
    }
  }
  
  for(cambiarX=9; cambiarX<=10; cambiarX++){
    if((random(0,1))<0.5){
      fill(color1);
      for(cambiarY=0; cambiarY<=6; cambiarY++){
        circle(posX1b+(figuraSize2*cambiarX),posY1b+(figuraSize2*cambiarY), figuraSize2);
      }
    }
  }
}
//--------------------------------------------------------------------------------circulos chicos (3 columnas)
void circulosChicos(){

  color2=color(6.5,10,10);
  fill(color2);
  cambiarX=0;
  if((random(0,1))<0.5){
    for(cambiarY=0; cambiarY<=8; cambiarY++){
      circle(posX1c+(figuraSize3*cambiarX),posY1c+(figuraSize3*cambiarY), figuraSize3);
    }
  }
    
  color3=color(1.5,10,10);
  fill(color3);  
  for(cambiarX=1; cambiarX<=2; cambiarX++){
    if((random(0,1))<0.5){
      for(cambiarY=0; cambiarY<=8; cambiarY++){
        circle(posX1c+(figuraSize3*cambiarX),posY1c+(figuraSize3*cambiarY), figuraSize3);
      }
    }
  }

  
  fill(color2); 
  if(contador>=1){
    cambiarX=3;
    for(cambiarY=0; cambiarY<=3; cambiarY++){
        circle(posX1c+(figuraSize3*cambiarX),posY1c+(figuraSize3*cambiarY), figuraSize3);
    }
  }
  
  if(contador>=2){
    cambiarX=4;
    for(cambiarY=0; cambiarY<=3; cambiarY++){
        circle(posX1c+(figuraSize3*cambiarX),posY1c+(figuraSize3*cambiarY), figuraSize3);
    }
  }
  
  if(contador>=3){
    cambiarX=5;
    for(cambiarY=0; cambiarY<=3; cambiarY++){
        circle(posX1c+(figuraSize3*cambiarX),posY1c+(figuraSize3*cambiarY), figuraSize3);
    }
  }
  
  if(contador>=4){
    cambiarX=6;
    for(cambiarY=0; cambiarY<=3; cambiarY++){
        circle(posX1c+(figuraSize3*cambiarX),posY1c+(figuraSize3*cambiarY), figuraSize3);
    }
  }
 
  if(contador>=5){
    cambiarX=7;
    for(cambiarY=0; cambiarY<=3; cambiarY++){
        circle(posX1c+(figuraSize3*cambiarX),posY1c+(figuraSize3*cambiarY), figuraSize3);
    }
  }
}
//--------------------------------------------------------------------------------circulos que serán el título
void circulosTitulo1(){   
  
  color3=color(0,5,10);
  fill(color3);
  if(contador>=8)   circle(posX1c+(figuraSize3*3),posY1c+(figuraSize3*4), figuraSize3);
  if(contador>=9)   circle(posX1c+(figuraSize3*4),posY1c+(figuraSize3*4), figuraSize3);
  if(contador>=10)  circle(posX1c+(figuraSize3*5),posY1c+(figuraSize3*4), figuraSize3);
  if(contador>=11)  circle(posX1c+(figuraSize3*6),posY1c+(figuraSize3*4), figuraSize3);
  if(contador>=12)  circle(posX1c+(figuraSize3*7),posY1c+(figuraSize3*4), figuraSize3);
  
  if(contador>=13)  circle(posX1c+(figuraSize3*3),posY1c+(figuraSize3*5), figuraSize3);
  if(contador>=14)  circle(posX1c+(figuraSize3*4),posY1c+(figuraSize3*5), figuraSize3);
  if(contador>=15)  circle(posX1c+(figuraSize3*5),posY1c+(figuraSize3*5), figuraSize3);
  if(contador>=16)  circle(posX1c+(figuraSize3*6),posY1c+(figuraSize3*5), figuraSize3);
  if(contador>=17)  circle(posX1c+(figuraSize3*7),posY1c+(figuraSize3*5), figuraSize3);

  if(contador>=18)  circle(posX1c+(figuraSize3*3),posY1c+(figuraSize3*6), figuraSize3);
  if(contador>=19)  circle(posX1c+(figuraSize3*4),posY1c+(figuraSize3*6), figuraSize3);
  if(contador>=20)  circle(posX1c+(figuraSize3*5),posY1c+(figuraSize3*6), figuraSize3);
  if(contador>=21)  circle(posX1c+(figuraSize3*6),posY1c+(figuraSize3*6), figuraSize3);
  if(contador>=22)  circle(posX1c+(figuraSize3*7),posY1c+(figuraSize3*6), figuraSize3);
  
  color4=color(0,10,10);
  fill(color4);
  if(contador>=23)  circle(posX1c+(figuraSize3*3),posY1c+(figuraSize3*7), figuraSize3);
  if(contador>=24)  circle(posX1c+(figuraSize3*4),posY1c+(figuraSize3*7), figuraSize3);
  if(contador>=25)  circle(posX1c+(figuraSize3*5),posY1c+(figuraSize3*7), figuraSize3);
  if(contador>=26)  circle(posX1c+(figuraSize3*3),posY1c+(figuraSize3*8), figuraSize3);
  if(contador>=27)  circle(posX1c+(figuraSize3*4),posY1c+(figuraSize3*8), figuraSize3);
  if(contador>=28)  circle(posX1c+(figuraSize3*5),posY1c+(figuraSize3*8), figuraSize3);
}


void circulosTitulo2(){                                                                //circulos que están por ser el título
  color3=color(int(random(10)),5,10,random(10));
  fill(color3);
  for(cambiarY=5; cambiarY<=6; cambiarY++){
    for(cambiarX=3; cambiarX<=7; cambiarX++){
      if((random(0,1))<0.5)  circle(posX1c+(figuraSize3*cambiarX),posY1c+(figuraSize3*cambiarY), figuraSize3);
    }
  }
  for(cambiarY=7; cambiarY<=8; cambiarY++){
    for(cambiarX=3; cambiarX<=5; cambiarX++){
      if((random(0,1))<0.5)  circle(posX1c+(figuraSize3*cambiarX),posY1c+(figuraSize3*cambiarY), figuraSize3);
    }
  }
}
