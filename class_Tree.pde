class Tree{
  
//----------------------------------------------------------------------------------------------Propiedades
  float posX, posY;
  boolean onFire;
  int strokeW;
  color troncoStroke,  hojas,  hojasStroke;
  float hojasWidth,  hojasHeight;
  
//----------------------------------------------------------------------------------------------Constructor
  Tree(float X, float Y){
    setX(X); setY(Y);
    setOnFire(false);
    setSW(10);
    setTS(color(30,60,80));
    setH(color(145,80,80));
    setHS(color(145,80,100));
    setHX(150);  setHY(125);
  }

//----------------------------------------------------------------------------------------------Métodos
  void show(){                  //mostrar árbol
    pushStyle();
      strokeWeight(getSW());
      stroke(getTS());                              //tronco y ramas
      line(getX(),getY(), getX(),getY()+100);
      line(getX(),getY(), getX()-50,getY()-50);
      line(getX(),getY(), getX()+50,getY()-25);
    if(!onFire){
      fill(getH());                            //hojas, si no le pegó ningún rayo todavía
      stroke(getHS());
      ellipse(posX,posY-50, getHX(),getHY());
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
  
  void setSW(int W){  strokeW=W;  }         //cambiar grosor de línea
  int getSW(){  return strokeW;  }            //ver grosor de línea
  
  void setTS(color S){  troncoStroke=color(S);  }         //cambiar color del tronco
  color getTS(){  return troncoStroke;  }            //ver color del tronco
  
  void setH(int H){  hojas=color(H);  }         //cambiar color de hojas
  color getH(){  return hojas;  }            //ver color de hojas
  
  void setHS(int S){  hojasStroke=color(S);  }         //cambiar color de borde de hojas
  color getHS(){  return hojasStroke;  }            //ver color de borde de hojas
  
  void setHX(float X){  hojasWidth=X;  }         //cambiar ancho de hojas
  float getHX(){  return hojasWidth;  }            //ver ancho de hojas
  
  void setHY(float Y){  hojasHeight=Y;  }         //cambiar alto de hojas
  float getHY(){  return hojasHeight;  }            //ver alto de hojas
}
