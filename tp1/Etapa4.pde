void preEtapa4(){
  if(selector!=4){
    tiempo=finEtapa3;
    posX1b=575;
    posY1b=560;
    posX1c=800;
    posY1c=415;
    noStroke();
    selector=4;
  }
}

void etapa4(){
  
  if(!keyPressed) tiempo++;
  if(tiempo<2000){
    textFont(fuente2);
    textSize(200);
    textAlign(LEFT,CENTER);
    if(tiempo%10==0){
      background(0);
      int random = int(random(1,4));
      if(random==1){                    //vertical abajo
        tituloPos1();
      }
      if(random==2){                    //vertical arriba
        tituloPos2();
      }
      if(random==3){                    //horizontal
        tituloPos3();
      }
      text("Dr.", posX1a-cambiarX,posY1a-cambiarY);
      text("NO", posX1a,posY1a);
    }
  }
  if(tiempo>=2000){
    fill(0,0,0,0.5);
    rectMode(CORNERS);
    rect(-10,-10, width+10,height+10);
  }
}

void tituloPos1(){                    //vertical abajo
  fill(10,10,10);
  posX1a=posX1b;
  posY1a=posY1b;
  cambiarX=0;
  cambiarY=150;  
}

void tituloPos2(){                    //vertical arriba
  fill(7,10,10);
  posX1a=posX1c;
  posY1a=posY1c;
  cambiarX=0;
  cambiarY=150;
}

void tituloPos3(){                    //horizontal
  fill(5,10,10,7);
  posX1a=posX1c;
  posY1a=posY1c;
  cambiarX=300;
  cambiarY=0;
}
