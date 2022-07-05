
//-------------------------------------------------------------------------------------Tibu
void shark(){
  
  int direc;
  if(posShark[2]<0){  direc=1;    //definir dirección
  }else{  direc=0;  }
  
  float tamX = shark[sprite][direc].width/2;
  float tamY = shark[sprite][direc].height/2;
  //
  if(posShark[0]<tamX){         //rebotar en borde izquierdo
    posShark[2]=5;
  }
  if((width-tamX)<posShark[0]){         //rebotar en borde derecho
    posShark[2]=-5;
  }
  if(!up  &&  !down  &&  posShark[1]<(height-tamY)){         //bajar hasta llegar al fondo
    posShark[1]+=1;
  }else{
    if(up){  posShark[1]-=10;  }            //mover hacia arriba
    if(down){  posShark[1]+=10;  }          //mover hacia abajo
  }

  posShark[0]+=posShark[2];                                    //mover en X
  posShark[1]=constrain(posShark[1], tamY,(height-tamY));         //restringir Y
  
  bocaTime++;
  if(keyPressed  &&  eat  &&  !enfermo              //abrir boca con ESPACIO
  &&  0<=bocaTime  &&  bocaTime<2*60){             //sólo puede tenerla abierta 2 segundos
    sprite=1;
  }else{
    if(0<=bocaTime  &&  bocaTime<2*60){
      sprite=bocaTime=0;
    }else{
      sprite=2;
      if(2*60<bocaTime)  bocaTime=-3*60;
    }
  }
  mouth[0]=posShark[0]+posShark[2]*10;          //posición y tamaño de la boca
  mouth[1]=posShark[1];
  mouth[2]=75;  mouth[3]=sprite;
  
  if(enfermo){                                   //enfermarse
    sprite=3;  enfermoTime++;
    if(enfermoTime>3*60){  enfermo=false;  }
  }else{  enfermoTime=0;  }
  
  image(shark[sprite][direc], posShark[0],posShark[1]);    //insertar imagen de Tibu
}




//-------------------------------------------------------------------------------------Peces
void peces(int p, float x, float y){
  
  int direc;
  if(posFish[p][2]<0){  direc=1;  //definir dirección
  }else{  direc=0;  }

  float tamX=fish[direc].width/2;
  float tamY=fish[direc].height/2;
  //
  if(posFish[p][0]<tamX  ||  (width-tamX)<posFish[p][0]){    //rebotar en borde X
    posFish[p][2]=-posFish[p][2];
  }
  if((height-tamY)<posFish[p][1]  ||  posFish[p][1]<tamY){   //rebotar en borde Y
    posFish[p][3]=-posFish[p][3];
  }

  posFish[p][0]+=posFish[p][2];    //mover en X
  posFish[p][1]+=posFish[p][3];    //mover en Y

  boolean eaten = (mouth[3]==1  &&  dist(x,y,mouth[0],mouth[1])<mouth[2]);          //ser comido
  int delay=2*60;
  if(eaten  ||  (posFish[p][4]<=delay  ||  posFish[p][4]>0))  posFish[p][4]++;
  if(eaten  &&  posFish[p][4]>=delay){
    posFish[p][4]=0;
    if(p==(posFish.length-1)){                             //sumar-restar puntos
      puntos-=10;  enfermo=true;
    }else{  puntos++;  posFish(p);  }
  }
  if(!eaten  &&  (posFish[p][4]>=delay  ||  posFish[p][4]<=0)){
    if(p==(posFish.length-1)){  tint(200,100,100);                      //tintar pez enfermo
    }else{  noTint();  }
    image(fish[direc], x,y);                                            //mostrar la imagen del pez
  }
  noTint();
}
void posFish(int p){                                        //dar a cada pez en un lugar y velocidad random
  float direc = (map(round(random(0,1)), 0,1, -1,1));
  posFish[p][0] = random(50,width-50);
  posFish[p][1] = random(50,height-50);
  posFish[p][2] = (random(5,10))*direc;
  posFish[p][3] = (random(1,10))*direc;
  if(p==(posFish.length-1)){
    posFish[posFish.length-1][2] = (random(7,15))*direc;              //el pez enfermo es más rápido y molesto
    posFish[posFish.length-1][3] = (random(7,15))*direc;
  }
  for(  ;  dist(posFish[p][0],posFish[p][1],  posShark[0],posShark[1])<width/2;  posFish(p)){}    //ubicar lejos de Tibu
}




//-------------------------------------------------------------------------------------Burbujas
void burbujas(float x, float y, float r, int c, boolean loop){
  
  int rango = round(constrain(r, 0,posBubble.length));
    for(int b=0;  b<c;  b++){
      if(posBubble[b][4]<=0){                             //condiciones iniciales
        posBubble[b][0]=0;
        posBubble[b][1]=0;
        posBubble[b][2]=random(-7,7);
        posBubble[b][3]=random(3,7);
      }
      posBubble[b][4]=1;
    }
  for(int b=0;  b<c;  b++){
    if(abs(posBubble[b][0])<rango  &&  abs(posBubble[b][1])<rango*2){            //mover hasta salir del rango
      posBubble[b][0]+=posBubble[b][2];
      posBubble[b][1]-=posBubble[b][3];
      pushStyle();
      noStroke();  fill(200,100,100,25);
      ellipse((x+posBubble[b][0]),(y+posBubble[b][1]), 25,25);            //dibujar burbuja
    }else{
      if(loop)  posBubble[b][4]=0;                                 //reiniciar
    }
  }
  popStyle();
}
