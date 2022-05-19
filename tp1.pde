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
int finEtapa1 = 300;
int finEtapa2 = 800;
int finEtapa3 = 1780;
int finEtapa4 = 2100;
int finEtapa5 = 2750;
int finEtapa6 = 3300;
int finEtapa7 = 3750;
int finEtapa8 = 4200;
int finEtapa9 = 5000;
void draw(){
  
  if(((0<=tiempo && tiempo<finEtapa1 || tiempo>=finEtapa9) && pausa!=true)){    //circulitos blancos
   preEtapa1();
   etapa1();
  }

  if((finEtapa1<=tiempo && tiempo<finEtapa2 && pausa!=true)){    //disparo
    preEtapa2();
    etapa2();
  }
  
  if((finEtapa2<=tiempo && tiempo<finEtapa3 && pausa!=true)){    //circulos de colores y título
    preEtapa3();
    etapa3();
  }
  
  if((finEtapa3<=tiempo && tiempo<finEtapa4 && pausa!=true)){    //titulo cambiante
    preEtapa4();
    etapa4();
  }
  
  if((finEtapa4<=tiempo && tiempo<finEtapa5 && pausa!=true)){    //starring 1
    preEtapa5();
    etapa5();
  }
  
  if((finEtapa5<=tiempo && tiempo<finEtapa6 && pausa!=true)){    //starring 2
    preEtapa6();
    etapa6();
  }
  
  if((finEtapa6<=tiempo && tiempo<finEtapa7 && pausa!=true)){    //starring 3
    preEtapa7();
    etapa7();
  }
  
  if((finEtapa7<=tiempo && tiempo<finEtapa8 && pausa!=true)){    //starring 4
    preEtapa8();
    etapa8();
  }
  
  if((finEtapa8<=tiempo && tiempo<finEtapa9 && pausa!=true)){    //selector con botones
    preEtapa9();
    etapa9();
  }
  
  if(!keyPressed)  pausa=false;
  if(mousePressed) pausa=true;
  
  
  //debug
  //println("etapa:"+selector+","+subetapa + "  ,  cursor:"+mouseX+","+mouseY + "  ,  tiempo:"+tiempo
  //+"  ,  pos1a:"+posX1a+","+posY1a + "  ,  size:"+figuraSize + "  contador:"+contador
  //+"\nDr.:"+(posX1c+(figuraSize3*2.5))+","+(posY1c+(figuraSize3*5.5))
  //+"  ,  NO:"+(posX1c+(figuraSize3*2.5))+","+(posY1a)
  //+"  ,  Dr-NO:"+(dist((posX1c+(figuraSize3*2.5)),(posY1c+(figuraSize3*5.5)),(posX1c+(figuraSize3*2.5)),(posY1a)))
  //+"  ,  pausa:"+pausa);
}


int selector = 0;
char selectorEtapa = '0';
boolean pausa = false;
void keyPressed(){    //selector de etapa pulsando los números. A veces hay que clicar el sketch para que funcione.
  
  pausa = true;
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
    if(selectorEtapa=='8')  preEtapa8();
    if(selectorEtapa=='9'){  preEtapa9();  tiempo=4300;  }
  }
}
