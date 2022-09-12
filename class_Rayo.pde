class Rayo{
/*
for(int i=0;  i<corR;  i++){
  rayo[i];
}
*/

//----------------------------------------------------------------------------------------------Propiedades
  float posX, posY;
  int time;
  boolean showing;

//----------------------------------------------------------------------------------------------Constructor
  Rayo(int i, float X, float Y){
    setX(X+random(-50,50));      //i%2 para alternar izquierda y derecha, le da más forma de rayo.
    setY(Y);
    setS(false);
  }

//----------------------------------------------------------------------------------------------Métodos
  void show(){                       //dibujar rayo
    pushStyle();
      //fill(60,50,100);
      //ellipse(posX,posY, 10,10);    //al principio dibujaba elipses para testear
      stroke(60,50,100);
      strokeWeight(10);
      for(int i=0;  i<corR-1;  i++){
        line(rayo[i].getX(),rayo[i].getY(), rayo[i+1].getX(),rayo[i+1].getY());
      }
    popStyle();
  }
  void time(){                    //tiempo de aparición
    if(getT()<60*4){
      setT(getT()+1);                        //¿cómo aplicar la lógica de objetos? <-- <-- <-- <-- <-- <-- <-- <-- <-- <-- <--
      if(getT()>60*3){
        setS(false);
        show();
        if(getT()%5==0){
          fondo.show();          //(si no está, se actualiza tan rápido que se ve feo)
          setS(true);
          shake();
        }
      }
    }else{
      setS(false);
      reset();
      setT(0);
    }
  }
  
  void reset(){
    rayo[0].setX(random(width*1/10,width*9/10));  rayo[0].setY(height*0/5);      //punto inicial del rayo, define al resto
    shake();
  }
  void shake(){                                      //mover los puntos después del inicial
   for(int i=1;  i<corR;  i++){
      rayo[i].setX(rayo[0].getX()+random(-50,50)); rayo[i].setY(height*i/5);
    }
  }
  
  void setX(float X){  posX=X;  }          //cambiar X
  float getX(){  return posX;  }            //ver X
  
  void setY(float Y){  posY=Y;  }         //cambiar Y
  float getY(){  return posY;  }            //ver Y
  
  void setT(int T){  time=T;  }          //cambiar tiempo
  int getT(){  return time;  }            //ver tiempo
  
  void setS(boolean S){  showing=S;  }          //cambiar mostrar
  boolean getS(){  return showing;  }            //ver si se muestra
}
