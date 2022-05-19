float centroX1,centroX2,centroX3,centroX4, centroY1,centroY2;

void preEtapa9(){
  if(selector!=9){
    figuraSize = (dist(300,0,width-300,0))/4;
    figuraSize2=figuraSize/3;
    figuraSize3=figuraSize2/2;
    centroX1=300+figuraSize*0.5;
    centroX2=300+figuraSize*1.5;
    centroX3=300+figuraSize*2.5;
    centroX4=300+figuraSize*3.5;
    centroY1=height/2;
    centroY2=height/2+figuraSize;
    selector=9;
  }
}


void etapa9(){
  
  background(0);
  figuraSize = (dist(300,0,width-300,0))/4;
  figuraSize2=figuraSize/3;
  figuraSize3=figuraSize2/2;
  centroX1=300+figuraSize*0.5;
  centroX2=300+figuraSize*1.5;
  centroX3=300+figuraSize*2.5;
  centroX4=300+figuraSize*3.5;
  centroY1=height/2;
  centroY2=height/2+figuraSize;
  if(!keyPressed) tiempo++;
  if(tiempo>=4300){
    textFont(fuente1);
    textAlign(CENTER,CENTER);
    fill(10);
    textSize(30);
    text("Elige qué parte quieres repetir", width/2,100);                              //explicación
    textSize(20);
    text("(O espera y empezará desde el principio)", width/2,130);
        
    noStroke();                                                                       //repetir etapa 1
    fill(0,0,10,5);
    circle(centroX1,centroY1, figuraSize);
    fill(10);
    circle(centroX1,centroY1, 75);
    fill(0);
    textFont(fuente1);
    textSize(40);
    textAlign(CENTER,CENTER);
    text("&", centroX1,centroY1);
    if(dist(mouseX,mouseY, centroX1,centroY1)<figuraSize/2){
      fill(0,0,10,5);
      circle(centroX1,centroY1, figuraSize);
    }
    
    noStroke();                                                                      //repetir etapa 2
    fill(0,0,10,5);
    circle(centroX2,centroY1, figuraSize);
    fill(10);
    circle(centroX2,centroY1, figuraSize-figuraSize/10);
    image(Bond, centroX2,centroY1, 110/2.5,280/2.5);
    if(dist(mouseX,mouseY, centroX2,centroY1)<figuraSize/2){
      fill(0,0,10,5);
      circle(centroX2,centroY1, figuraSize);
    }
    
    noStroke();                                                                      //repetir etapa 3
    fill(0,0,10,5);
    circle(centroX3,centroY1, figuraSize);
    fill(4.75,10,10);
    for(float cambiarYa=0.5;  cambiarYa>=-0.5;  cambiarYa--){
      circle((centroX3)-figuraSize2*0.5,centroY1+figuraSize2*cambiarYa, figuraSize2);
    }
    fill(6.5,10,10);
    for(float cambiarXa=0.5;  cambiarXa<=1.5;  cambiarXa++){
      for(float cambiarYa=1.5;  cambiarYa>=-1.5;  cambiarYa--){
        circle((centroX3)+figuraSize3*cambiarXa,centroY1+figuraSize3*cambiarYa, figuraSize3);
      }
    }
    if(dist(mouseX,mouseY, centroX3,centroY1)<figuraSize/2){
      fill(0,0,10,5);
      circle(centroX3,centroY1, figuraSize);
    }
    
    noStroke();                                                                      //repetir etapa 4
    fill(0,0,10,5);
    circle(centroX4,centroY1, figuraSize);
    fill(10,10,10);
    textFont(fuente2);
    textSize(65);
    textAlign(CENTER,CENTER);
    text("Dr.", centroX4,(centroY1)-30);
    text("NO", centroX4,(centroY1)+30);
    if(dist(mouseX,mouseY, centroX4,centroY1)<figuraSize/2){
      fill(0,0,10,5);
      circle(centroX4,centroY1, figuraSize);
    }
    
    noStroke();                                                                       //repetir etapa 5
    fill(0,0,10,5);
    circle(centroX1,centroY2, figuraSize);
    fill(7,10,10);
    rectMode(CENTER);
    rect(centroX1,centroY2, figuraSize*0.6,figuraSize*0.6, 10);
    textFont(fuente3);
    textAlign(CENTER,CENTER);
    textSize(40);
    fill(10);
    text("007", centroX1,centroY2);
    if(dist(mouseX,mouseY, centroX1,centroY2)<figuraSize/2){
      fill(0,0,10,5);
      circle(centroX1,centroY2, figuraSize);
    }
    
    noStroke();                                                                       //repetir etapa 6
    fill(0,0,10,5);
    circle(centroX2,centroY2, figuraSize);
    fill(9,10,10);
    for(float cambiarXa=-2;  cambiarXa<=2;  cambiarXa++){
        circle(centroX2+figuraSize3*cambiarXa,centroY2, figuraSize3);
    }
    for(float cambiarYa=-2;  cambiarYa<=2;  cambiarYa++){
        circle(centroX2,centroY2+figuraSize3*cambiarYa, figuraSize3);
    }
    if(dist(mouseX,mouseY, centroX2,centroY2)<figuraSize/2){
      fill(0,0,10,5);
      circle(centroX2,centroY2, figuraSize);
    }
    
    noStroke();                                                                       //repetir etapa 7
    fill(0,0,10,5);
    circle(centroX3,centroY2, figuraSize);
    fill(10,10,10);
    circle(centroX3+figuraSize2*0.5,centroY2+figuraSize2*0.5, figuraSize2);
    fill(6,10,10);
    for(float cambiarYa=1.5;  cambiarYa>=-1.5;  cambiarYa--){
      circle(centroX3-figuraSize3*0.5,centroY2+figuraSize3*cambiarYa, figuraSize3);
    }
    if(dist(mouseX,mouseY, centroX3,centroY2)<figuraSize/2){
      fill(0,0,10,5);
      circle(centroX3,centroY2, figuraSize);
    }
    
    noStroke();                                                                       //repetir etapa 8
    fill(0,0,10,5);
    circle(centroX4,centroY2, figuraSize);
    fill(6,10,10);
    for(int columna=0; columna<=3; columna+=1){
      float cambiarXa = 4.5-columna;
      for(float cambiarYa=1.5; cambiarYa>=1.5-columna; cambiarYa-=1){
        circle(300+figuraSize*3+figuraSize3*cambiarXa,
        centroY2+figuraSize3*cambiarYa, figuraSize3);
      }
    }
    if(dist(mouseX,mouseY, centroX4,centroY2)<figuraSize/2){
      fill(0,0,10,5);
      circle(centroX4,centroY2, figuraSize);
    }
  }
  
  
  //println("cursor:"+mouseX+","+mouseY + "  ,  radio:"+figuraSize + "  ,  centro:"+(centroX1)+","+(centroY1));
}

void mouseClicked(){
  if(selector==9){
    if(dist(mouseX,mouseY, centroX1,centroY1)<figuraSize/2)             preEtapa1();
    if(dist(mouseX,mouseY, centroX2,centroY1)<figuraSize/2)             preEtapa2();
    if(dist(mouseX,mouseY, centroX3,centroY1)<figuraSize/2)             preEtapa3();
    if(dist(mouseX,mouseY, centroX4,centroY1)<figuraSize/2)             preEtapa4();
    if(dist(mouseX,mouseY, centroX4,centroY2)<figuraSize/2)  preEtapa8();
    if(dist(mouseX,mouseY, centroX3,centroY2)<figuraSize/2)  preEtapa7();
    if(dist(mouseX,mouseY, centroX2,centroY2)<figuraSize/2)  preEtapa6();
    if(dist(mouseX,mouseY, centroX1,centroY2)<figuraSize/2)  preEtapa5();
  }
}
