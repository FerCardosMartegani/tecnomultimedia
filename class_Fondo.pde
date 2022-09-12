class Fondo{
  
//----------------------------------------------------------------------------------------------Propiedades
  float posX1, posY1, posX2, posY2, posX3, posY3;
  color sky, grass;
  String texto;

//----------------------------------------------------------------------------------------------Constructor
  Fondo(){
    setX1(-10);  setY1(height*5/6);
    setX2(width+10);  setY2(height+10);
    setS(color(180));
    setG(color(145,80,80));
    setX3(width-10);  setY3(height-10);
    setT("Pulsa R para que los árboles vuelvan a crecer");
  }
  
//----------------------------------------------------------------------------------------------Métodos
  void show(){
    if(rayo[0].getS()){          //relámpagos
      setS(color(360));
    }else{
      setS(color(180));          //fondo normal
    }
    background(getS());
    pushStyle();
      fill(getG());
      rectMode(CORNERS);
      rect(getX1(),getY1(), getX2(),getY2());        //pasto
    popStyle();
    pushStyle();
      textAlign(RIGHT,CENTER);
      fill(0);
      text(getT(), getX3(),getY3());              //cartel
    popStyle();
  }
  
  void setX1(float X){  posX1=X;  }          //cambiar X1
  float getX1(){  return posX1;  }            //ver X1
  
  void setX2(float X){  posX2=X;  }          //cambiar X2
  float getX2(){  return posX2;  }            //ver X2
  
  void setY1(float Y){  posY1=Y;  }          //cambiar Y1
  float getY1(){  return posY1;  }            //ver Y1
  
  void setY2(float Y){  posY2=Y;  }          //cambiar Y2
  float getY2(){  return posY2;  }            //ver Y2
  
  void setS(color S){  sky=S;  }          //cambiar color del cielo
  color getS(){  return sky;  }            //ver color del cielo
  
  void setG(color G){  grass=G;  }          //cambiar color del pasto
  color getG(){  return grass;  }            //ver color del pasto
  
  void setX3(float X){  posX3=X;  }          //cambiar X del texto
  float getX3(){  return posX3;  }            //ver X del texto
  
  void setY3(float Y){  posY3=Y;  }          //cambiar X del texto
  float getY3(){  return posY3;  }            //ver Y del texto
  
  void setT(String T){  texto=T;  }          //cambiar color del pasto
  String getT(){  return texto;  }            //ver color del pasto
}
