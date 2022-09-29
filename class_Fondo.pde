class Fondo{
  
//--------------------------------------------------------------------------------------------------------Propiedades
  color sky, grass;
  float posX,posY,tamX,tamY;
  
  
  Rayo rayo;              //declarar objetos de otras clases
  //Trees t1, t2;
  Trees[] trees;
  
//--------------------------------------------------------------------------------------------------------Constructor
  Fondo(){
    sky=color(180);                //propiedades del fondo
    grass=color(145,80,80);
    posX=0;  posY=height*4/6;
    tamX=width; tamY=height;
    /*
    t1 = new Trees(width*1/4,height*4/6);          //instanciar árboles
    t2 = new Trees(width*2/4,height*4/6);
    */
    trees = new Trees[5];
    for(int i=0;  i<trees.length;  i++){
      trees[i] = new Trees(i*width/(trees.length-1),height*4/6);
    }
    
    rayo = new Rayo(random(width*1/10,width*9/10),height*5/7, 5);                      //instanciar rayo
    //              posX,    posY,    esquinas (al menos 2)

  }
  
//--------------------------------------------------------------------------------------------------------Métodos  

  void ejecutar(){            //método ejecutar, desencadena todo lo demás
    this.show();
    this.cartel();
    /*
    t1.show();
    t2.show();
    */
    for(int i=0;  i<trees.length;  i++){
      trees[i].show();
    }
    rayo.show();
    
    this.strike();
  }
  
  void show(){
    if(rayo.showing){              //relámpagos
      sky=color(360);
    }else{
      sky=color(180);          //fondo normal
    }

    background(sky);        //mostrar fondo
    
    pushStyle();
      rectMode(CORNERS);
      fill(color(grass));
      noStroke();
      rect(posX,posY, tamX,tamY);          //mostrar pasto
    popStyle();
  }
  void cartel(){                    //mostrar cartel de controles
    pushStyle();
      fill(0);
      textAlign(RIGHT,BOTTOM);
      textSize(12);
      text("Pulsa R para que los árboles vuelvan a crecer", width-10,tamY-10);
    popStyle();
  }
  
  void strike(){                    //detectar colisión árbol-rayo
    /*
    if(rayo.showing){
      if(dist(rayo.posX,rayo.posY, t1.posX,t1.posY)<100){
        t1.onFire=true;
      }
      if(dist(rayo.posX,rayo.posY, t2.posX,t2.posY)<100){
        t2.onFire=true;
      }
    }
    */
    for(int i=0;  i<trees.length;  i++){
      if(dist(rayo.posX,rayo.posY, trees[i].posX,trees[i].posY)<trees[i].tamX/2  &&  rayo.showing){
        trees[i].onFire=true;
      }
    }
  }
  void reset(){                //reiniciar animación
    rayo.time=60*5;
    /*
    t1.onFire=false;
    t2.onFire=false;
    */
    for(int i=0;  i<trees.length;  i++){
      trees[i].onFire=false;
    }
  }
}
