class Tree{
  
//----------------------------------------------------------------------------------------------Propiedades
  float posX, posY;
  boolean onFire;
  
//----------------------------------------------------------------------------------------------Constructor
  Tree(float X, float Y){
    setX(X); setY(Y);
    onFire=false;
  }

//----------------------------------------------------------------------------------------------Métodos
  void show(){                  //dibujar árbol
    pushStyle();
      strokeWeight(10);
      stroke(30,60,80);                      //tronco y ramas
      line(getX(),getY(), getX(),getY()+100);
      line(getX(),getY(), getX()-50,getY()-50);
      line(getX(),getY(), getX()+50,getY()-25);
    if(!onFire){
      fill(145,80,80);                        //hojas
      stroke(145,80,100);
      ellipse(posX,posY-50, 150,125);
    }
    popStyle();
  }
  
  void isOnFire(){
    if(dist(rayo[rayo.length-1].getX(),rayo[rayo.length-1].getY(), getX(),getY())<100  &&  rayo[rayo.length-1].showing){
      onFire=true;
    }
  }
  
  void setX(float X){  posX=X;  }          //cambiar X
  float getX(){  return posX;  }            //ver Y
  
  void setY(float Y){  posY=Y;  }         //cambiar Y
  float getY(){  return posY;  }            //ver Y
}
