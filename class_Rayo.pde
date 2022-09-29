class Rayo{
  
//--------------------------------------------------------------------------------------------------------Propiedades
  float posX,posY;
  int cantEsquinas, lineWeight, time;
  float[][] pos;
  color line;
  boolean showing;

//--------------------------------------------------------------------------------------------------------Constructor
  Rayo(float X, float Y, int cor){
    posX=X;  posY=Y;
    pos = new float[cor][2];
    pos[pos.length-1][0]=posX;  pos[pos.length-1][1]=posY;            //posición inicial del rayo, la de más abajo, fija
    for(int i=0;  i<pos.length-1;  i++){
      pos[i][0]=this.posX+random(-50,50);  pos[i][1]=posY*i/(pos.length-1);            //posiciones intermedias
    }
    line=color(60,50,100);
    lineWeight=10;
  }

//--------------------------------------------------------------------------------------------------------Métodos
  void dibujar(){
    pushStyle();
      stroke(line);
      strokeWeight(lineWeight);
      for(int i=0;  i<pos.length-1;  i++){
        line(pos[i][0],pos[i][1], pos[i+1][0],pos[i+1][1]);            //mostrar líneas que dibujan el rayo
      }
    popStyle();
  }
  
  void show(){                    //tiempo de aparición
    if(time<60*4){
      time++;
      if(time>60*3){          //el rayo aparece cada 3 segundos y dura 1 segundo
        showing=false;
        this.dibujar();
        if(time%5==0){
          showing=true;
          shake();
        }
      }
    }else{
      showing=false;
      time=0;
      reset();
    }
  }
  
  void reset(){                    //reiniciar el rayo
    showing=false;
    posX=random(width*1/10,width*9/10);
    pos[pos.length-1][0]=posX;  pos[pos.length-1][1]=posY;
    shake();
  }
  void shake(){                                          //sacudir el rayo, movimiento de puntos intermedios
    for(int i=0;  i<pos.length-1;  i++){
      pos[i][0]=this.posX+random(-50,50);  pos[i][1]=posY*i/(pos.length-1);
    }
  }
}
