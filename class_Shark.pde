class Shark{
  
//-------------------------------------------------------------------------------------------------PROPIEDADES
  float posX,posY, tamX,tamY, moveX,moveY,  mouthX,mouthY,mouthR;
  int sprite,direc,  time;
  PImage[][] pose;
  boolean eat,up,down,  poison;
  
//-------------------------------------------------------------------------------------------------CONSTRUCTOR
  Shark(float x, float y, float mx, float my){
    posX=x;  posY=y;  moveX=mx;  moveY=my;
    mouthR=75;  mouthX=posX+moveX*10;  mouthY=posY;
    eat=up=down=poison=false;
    sprite=time=0;
    if(posX<width/2){  direc=0;  }else{  direc=1;  }
    pose = new PImage[3][2];
    for(int b=0;  b<2;  b++){                                //cargar sprites de Tibu
      for(int a=0;  a<pose.length;  a++){
        pose[a][b] = loadImage("shark-"+a+","+b+".png");
      }
    }
  }
  
//-------------------------------------------------------------------------------------------------MÉTODOS
  void show(){
    if(moveX>0){  direc=0;  }else{  direc=1;  }
    image(pose[sprite][direc], posX,posY);    //mostrar sprite
    tamX = pose[sprite][direc].width;        
    tamY = pose[sprite][direc].height;        //actualizar tam al sprite en uso
    
    //ellipse(mouthX,mouthY,mouthR,mouthR);    //elipse de testeo
  }
  
  void moverY(){                    //mover arriba y abajo
    if(up){  posY-=moveY;  }
    if(down){  posY+=moveY;  }
    if(posY<height-tamY/2){  posY+=1;  }
    posY=constrain(posY, tamY/2,height-tamY/2);      //restringir movimiento para que no se vaya de la pantalla
  }
  void moverX(){              //mover izquierda y derecha
    posX+=moveX;
    if(posX<tamX/2  ||  posX>width-tamX/2){  moveX=-moveX;  }    //rebotar en los bordes
  }
  void morder(){                                     //abrir la boca al pulsar ESPACIO
    if(!poison){
      if(eat){  sprite=1;
      }else{  sprite=0;  }
    }
    mouthX=posX+moveX*10;  mouthY=posY;      //actualizar posición de la boca
  }
  void enfermar(){
    if(poison){
      sprite=2;
      if(time<3*60){  time++;  }else{  poison=false;  time=0;  }
    }
  }

}
