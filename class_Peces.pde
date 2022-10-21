class Peces{
  
//-------------------------------------------------------------------------------------------------PROPIEDADES
  float posX,posY, tamX,tamY, moveX,moveY;
  int direc, time;
  boolean poison, eaten;
  PImage[] pose;
  
//-------------------------------------------------------------------------------------------------CONSTRUCTOR
  Peces(boolean v, float x, float y, float min, float max){
    posX=x; posY=y;
    poison=v;  eaten=false;
    moveX=random(min,max)*map(round(random(0,1)), 0,1, -1,1);
    moveY=random(min,max)*map(round(random(0,1)), 0,1, -1,1);
    if(moveX>0){  direc=0;
    }else{  direc=1;  }
    pose = new PImage[2];
    for(int i=0;  i<pose.length;  i++){
      pose[i] = loadImage("fish-"+(i+1)+".png");           //cargar sprites del pez
    }
    tamX = pose[direc].width;        //actualizar tam al sprite en uso
    tamY = pose[direc].height;
  }

//-------------------------------------------------------------------------------------------------MÉTODOS
  
  void show(){        //mostrar sprite
    if(!eaten){
      if(poison){  tint(200,100,100);          //tintar si es el venenoso
      }else{  noTint();  }
      if(moveX>0){  direc=0;  }else{  direc=1;  }
      image(pose[direc], posX,posY);
      noTint();
    }
  }
  
  void mover(){        //movimiento
    if(!eaten){
      posX+=moveX;  posY+=moveY;
      if(posX<tamX/2  ||  posX>width-tamX/2){  moveX=-moveX;  }      //rebotar izquierda y derecha
      if(posY<tamY/2  ||  posY>height-tamY/2){  moveY=-moveY;  }      //rebotar arriba y abajo
    }
  }
  
  void comido(){
    if(eaten){
      if(time<2*60){  time++;
      }else{  time=0;  eaten=false;  }
    }
  }
  
}
