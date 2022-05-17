PFont fuente1, fuente2, fuente3;
PImage Bond;
void setup(){
 
  size(1200,675);
  colorMode(HSB,10,10,10,10);
  fuente1 = loadFont("nombres.vlw");
  fuente2 = loadFont("Titulo.vlw");
  fuente3 = loadFont("007.vlw");
  Bond = loadImage("Bond.png");
  imageMode(CENTER);
}


int tiempo = 0;
int siguienteEtapa;
int finEtapa1 = 300;
int finEtapa2 = 800;
int finEtapa3 = 1780;
int finEtapa4 = 2100;
int finEtapa5 = 2750;
int finEtapa6 = 3300;
int finEtapa7 = 6000;
void draw(){
  
  if((0<=tiempo && tiempo<finEtapa1 && !keyPressed)){    //circulitos blancos
   preEtapa1();
   etapa1();
   siguienteEtapa = finEtapa1-tiempo;
  }

  if((finEtapa1<=tiempo && tiempo<finEtapa2 && !keyPressed)){    //disparo
    preEtapa2();
    etapa2();
    siguienteEtapa = finEtapa2-tiempo;
  }
  
  if((finEtapa2<=tiempo && tiempo<finEtapa3 && !keyPressed)){    //circulos de colores y título
    preEtapa3();
    etapa3();
    siguienteEtapa = finEtapa3-tiempo;
  }
  
  if((finEtapa3<=tiempo && tiempo<finEtapa4 && !keyPressed)){    //titulo cambiante
    preEtapa4();
    etapa4();
    siguienteEtapa = finEtapa4-tiempo;
  }
  
  if((finEtapa4<=tiempo && tiempo<finEtapa5 && !keyPressed)){    //starring 1
    preEtapa5();
    etapa5();
    siguienteEtapa = finEtapa5-tiempo;
  }
  
  if((finEtapa5<=tiempo && tiempo<finEtapa6 && !keyPressed)){    //starring 2
    preEtapa6();
    etapa6();
    siguienteEtapa = finEtapa6-tiempo;
  }
  
  if((finEtapa6<=tiempo && tiempo<finEtapa7 && !keyPressed)){    //starring 3
    preEtapa7();
    etapa7();
    siguienteEtapa = finEtapa7-tiempo;
  }
  
  
  //debug
  println("etapa:"+selector+","+subetapa + "  ,  cursor:"+mouseX+","+mouseY + "  ,  tiempo:"+tiempo
  +"  ,  pos1a:"+posX1a+","+posY1a + "  ,  size:"+figuraSize + "  contador:"+contador
  +"\nDr.:"+(posX1c+(figuraSize3*2.5))+","+(posY1c+(figuraSize3*5.5))
  +"  ,  NO:"+(posX1c+(figuraSize3*2.5))+","+(posY1a)
  +"  ,  Dr-NO:"+(dist((posX1c+(figuraSize3*2.5)),(posY1c+(figuraSize3*5.5)),(posX1c+(figuraSize3*2.5)),(posY1a)))
  );
}


int selector = 0;
char selectorEtapa = '0';
void keyPressed(){    //selector de etapa pulsando los números. A veces hay que clicar el sketch para que funcione.
  if(key!=' '){
    selector = 0;
    selectorEtapa = key;
    if(selectorEtapa=='1')  preEtapa1();
    if(selectorEtapa=='2')  preEtapa2();
    if(selectorEtapa=='3')  preEtapa3();
    if(selectorEtapa=='4')  preEtapa4();
    if(selectorEtapa=='5')  preEtapa5();
    if(selectorEtapa=='6')  preEtapa6();
    if(selectorEtapa=='7')  preEtapa7();
  }
}
