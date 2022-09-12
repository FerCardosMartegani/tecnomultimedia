class Tree{
  
//----------------------------------------------------------------------------------------------Propiedades
  float posX, posY;
  boolean onFire;
  
//----------------------------------------------------------------------------------------------Constructor
  Tree(float X, float Y){
    setX(X); setY(Y);
    setOnFire(false);
  }

//----------------------------------------------------------------------------------------------Métodos
  void show(){                  //mostrar árbol
    pushStyle();
      strokeWeight(10);
      stroke(30,60,80);                              //tronco y ramas
      line(getX(),getY(), getX(),getY()+100);
      line(getX(),getY(), getX()-50,getY()-50);
      line(getX(),getY(), getX()+50,getY()-25);
    if(!onFire){
      fill(145,80,80);                            //hojas, si no le pegó ningún rayo todavía
      stroke(145,80,100);
      ellipse(posX,posY-50, 150,125);
    }
    popStyle();
  }
  
  void isOnFire(){                                  //detectar colisión rayo-árbol
    if(dist(rayo[rayo.length-1].getX(),rayo[rayo.length-1].getY(), getX(),getY())<100  &&  rayo[0].getS()){
      setOnFire(true);
    }
  }
  void setOnFire(boolean F){  onFire=F;  }          //cambiar si lo golpeó un rayo
  boolean getOnFire(){  return onFire;  }            //ver si lo golpeó un rayo
  
  void setX(float X){  posX=X;  }          //cambiar X
  float getX(){  return posX;  }            //ver X
  
  void setY(float Y){  posY=Y;  }         //cambiar Y
  float getY(){  return posY;  }            //ver Y
}
