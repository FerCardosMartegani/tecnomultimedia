int minimo=0;  int maximo=0;  int mueve=4;  float posY1a = height/2;  int subetapa = 1;

void preEtapa2(){                      //condiciones iniciales
  if(selector!=2){
    tiempo=finEtapa1;
    posX1a = 520;
    posX1b = 520;
    alfa = 25;
    figuraSize = 75;
    posY1a = height/2;
    posY2b = -50;
    minimo=0;
    maximo=0;
    mueve=4;
    subetapa=1;
    textFont(fuente1);
    noStroke();
    selector=2;
  }
}

void etapa2(){
  
  background(0);
//--------------------------------------------------------------------------------subetapa1
  if(subetapa==1){
    if(posX1a<808 && figuraSize<80){
      if(alfa<-10){
        posX1b = posX1a;
        alfa=25;
      }else{
        alfa-=1;
      }
      posX1a+=4;
      posY1a = height/2;
      fill(0,0,10,alfa);
      circle(posX1b,height/2, figuraSize);    //círculos estáticos que se desvanecen
    }else    subetapa = 2;
  }
  if(subetapa>=1){
    fill(10);
    circle(posX1a,posY1a, figuraSize);        //círculo que se mueve
  }
//--------------------------------------------------------------------------------subetapa2
  if(subetapa==2){
    if(figuraSize<310){                      //crecimiento del círculo
      figuraSize+=5;
    }else    subetapa=3;
  }

//--------------------------------------------------------------------------------subetapa3 
  if(subetapa>=3){
    if(posX1a>width/2+3 && tiempo<330){
      posX1b = posX1a;
      fill(10);
      textAlign(RIGHT,CENTER);
      textSize(20);
      text("-Sigue al agente con el cursor-", width-30,height-20);
      if(dist(posX1a,height/2, mouseX,mouseY)<=75  &&  (pmouseX!=mouseX  ||  pmouseY!=mouseY)){        //Bond interactivo
        posX1a-=2;
      }
    }else subetapa=4;
    if(tiempo<350)   image(Bond,posX1b,height/2);    //imagen Bond
  }
//--------------------------------------------------------------------------------subetapa4
  if(subetapa==4){
    if(tiempo<330){
      if(!keyPressed)  tiempo++;
      posX1a=width/2;
      if(tiempo<305){
        alfa=20;
      }else{
        alfa-=1;
      }
      fill(0,0,5,alfa);
      circle(posX1a-30,height/2-120, 60);    //humo del disparo
    }else    subetapa=5;
  }
//--------------------------------------------------------------------------------subetapa5   
  if(subetapa==5){
      if(tiempo<550) cortinaRoja(0,200,500,750,1000,1200);    //cortina de sangre tras el disparo
      if(posY2b<height+10){
      posY2b+=2;
      }else   subetapa=6;
  }
//--------------------------------------------------------------------------------subetapa6          
  if(subetapa==6){
    if(tiempo<340){
        if(!keyPressed)  tiempo++;
        minimo = width/2-10;
        maximo = width/2+10;
        alfa = 0;
      }
      if(maximo<680){
        if(!keyPressed)  tiempo++;      //oscilación
        //fill(2,0,10,0.5);
        //circle(posX1a,posY1a, circuloSize);    //nuevo círculo amarillento
        posX1a+=mueve;
        if(posX1a<minimo){
          minimo-=20;
          mueve = +4;
        }
        if(posX1a>maximo){
          maximo+=20;
          mueve = -4;
        }
      }else  subetapa=7;
  }
//--------------------------------------------------------------------------------subetapa7            
  if(subetapa==7){
    if(!keyPressed)  tiempo++;      //desplazamiento hacia abajo izquierda
    if(tiempo<550){
      posX1a-=4;
      posY1a+=1.5;
      fill(0,0,0,2.5);
      rect(-10,-10, width+10,height+10);
      fill(10);
      circle(posX1a,posY1a, figuraSize);
    }else  subetapa=8;
  }
//--------------------------------------------------------------------------------subetapa8              
  if(subetapa==8){
    if(tiempo<600){
      posX1a+=6;
      posY1a+=1.5;
      fill(0,0,0,2.5);
      rect(-10,-10, width+10,height+10);                              //desvanecimiento
      fill(10);
      circle(posX1a,posY1a, figuraSize);
    }else  subetapa=9;
  }
//--------------------------------------------------------------------------------subetapa9              
  if(subetapa==9){
      if(!keyPressed) tiempo++;
  }
}


float posY2b = -50;
void cortinaRoja(int pos1, int pos2, int pos3, int pos4, int pos5, int pos6){          //cortina de sangre
  
  fill(0,9,10,5);
  rectMode(CORNERS);
  rect(-10,-10, width+10,posY2b);
  arc((pos2-pos1)/2+pos1,posY2b, (pos2-pos1),int(random(130,170)), 0,PI);
  arc((pos3-pos2)/2+pos2,posY2b, (pos3-pos2),int(random(140,160)), 0,PI);
  arc((pos4-pos3)/2+pos3,posY2b, (pos4-pos3),int(random(70,100)), 0,PI);
  arc((pos5-pos4)/2+pos4,posY2b, (pos5-pos4),int(random(140,160)), 0,PI);
  arc((pos6-pos5)/2+pos5,posY2b, (pos6-pos5),int(random(100,130)), 0,PI);
}
