float posX1a = -130;      //declaradas como globales para que sus valores puedan cambiar
float posX1b = -130;
float alfa = 10;
float figuraSize = 75;

void preEtapa1(){
  if(selector!=1){
    tiempo=0;
    background(0);
    posX1a = -130;
    posX1b = -130;
    alfa = 10;
    figuraSize = 75;
    subetapa = 0;
    textFont(fuente1);
    noStroke();
    selector=1;
  }
}

void etapa1(){
  
  alfa-=1;
  background(0);
  fill(10);
  circle(posX1a,height/2, figuraSize);    //círculo que se mueve

  if(posX1a<520){
    posX1a+=4;
    fill(0,0,10,alfa);
    circle(posX1b,height/2, figuraSize);    //círculos estáticos que se desvanecen
    if(alfa<-10){
      posX1b = posX1a;
      alfa=25;
      println(posX1a);
    }
  }else{                                                          //texto
    fill(10);
    textSize(30);
    textAlign(RIGHT,CENTER);
    text("HARRY SALTZMAN", posX1a-75,height/2);
    
    fill(0);
    textSize(40);
    textAlign(CENTER,CENTER);
    text("&", posX1a,height/2);
  
    fill(10);
    textSize(30);
    textAlign(LEFT,CENTER);
    text("ALBERT R.BROCCOLI   present", posX1a+75,height/2);
    
    if(!keyPressed) tiempo++;    //se puede pausar la animación apretando cualquier tecla
  }

  //println(alfa);
}
