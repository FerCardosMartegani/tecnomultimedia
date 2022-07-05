/*
ALUMNO: FERNANDO CARDOS MARTEGANI (84256/3)
VIDEO: https://youtu.be/OBnCmYPVv04
*/

//arreglos y variables de juego
PImage[][] shark; PImage[] fish; PImage fondo,logo,scratch;
int sprite, bocaTime, enfermoTime, puntos;
float[][] posBubble, posFish; float[] posShark, mouth;
boolean up,down,eat,  enfermo,  click;

//arreglos y variables logísticos
PFont fuente;
float bsX,bsY,bX1,bX2,bY1,bY2,  logoSize;
int bCant=3,  pantalla=0;
color[] bColor = new color[bCant];
String[] bText = new String[bCant];
int[] bLink = new int[bCant];

int cantPeces = 4;  //      <--  MODIFICAR CANTIDAD DE PECES QUE HAY. Deben ser al menos 2
int ganar = 20;//            <--  MODIFICAR CANTIDAD DE PECES PARA GANAR
int perder = -20;//          <--  MODIFICAR CANTIDAD DE PECES PARA PERDER


void setup(){
  
  size(800,700);
  colorMode(HSB,360,100,100,100);
  imageMode(CENTER);  rectMode(CENTER);
  
  fondo = loadImage("underwater.png");        //cargas archivos
  logo = loadImage("Title.png");
  scratch = loadImage("Scratch.png");
  fuente = loadFont("CooperBlack-50.vlw");  textFont(fuente);

  shark = new PImage[4][2];                   //[s]sprite = [0]derecha, [1]izquierda
  fish = new PImage[2];                       //sprite = [0]derecha, [1]izquierda
  posBubble = new float[width/2][5];          //[b]burbuja = [0]posX,[1]posY,[2]moveX,[3]moveY,[4]viaje/inicio
  posFish = new float[cantPeces][5];          //[p]pez = [0]posX,[1]posY,[2]moveX,[3]moveY,[4]tiempo muerto
  posShark = new float[4];                    //Tibu = [0]posX,[1]posY,[2]moveX
  mouth = new float[4];                       //boca = [0]posX,[1]posY,[2]radio,[3]abierta/cerrada
  
  for(int b=0;  b<2;  b++){                                //cargar sprites de Tibu
    for(int a=0;  a<shark.length;  a++){
      shark[a][b] = loadImage("shark-"+a+","+b+".png");
    }
  }
  
  fish[0] = loadImage("fish-1.png");           //cargar sprites del pez
  fish[1] = loadImage("fish-2.png");
  
  bsX=width/5;  bsY=(bsX)/2;  bX1=width*1/3;  bY1=height*3/4-20;  bX2=width*2/3;  bY2=bY1+bsY*1.25;
  
//   color del botón         //    texto del botón  // a dónde va
  bColor[0]=color(130,50,70);  bText[0]="JUGAR";       bLink[0]=1;
  bColor[1]=color(40,90,100);  bText[1]="CONTROLES";   bLink[1]=2;
  bColor[2]=color(180,70,80);  bText[2]="CRÉDITOS";    bLink[2]=3;
  
  reset();        //condiciones iniciales
}


//-------------------------------------------------------------------------------------Reiniciar juego
void reset(){

  sprite=bocaTime=puntos=0;            //seteo de variables
  logoSize=0.05;
  up=down=eat=enfermo=false;
  
  posShark[0] = width/2;  posShark[1] = height/2;          //Tibu siempre aparece en el centro de la pantalla
  posShark[2] = 5*(map(round(random(0,1)), 0,1, -1,1));    //Tibu se mueve en X de a +5 o -5
  
  for(int p=0;  p<posFish.length;  p++){
    posFish[p][4]=1000;                        //solución bruta que debe ser ignorada por el profesor
    posFish(p);
  }
}


void draw(){
  
  image(fondo, width/2,height/2);                    //imagen del fondo


//-------------------------------------------------------------------------------------Pantalla de inicio
  if(pantalla==0){
    burbujas(width/2,height+50, width,width/10, false);
    
    float tamX=logo.width*logoSize,  posX=width/2,
    tamY=logo.height*logoSize,
    posY=height-map(logoSize, 0,1, 0,height-40);          //aparecer con movimiento
    if(tamX<(logo.width*3/4)){
      logoSize+=0.01;
    }else{
      button(bX1+(bX2-bX1)/2,bY2, bsX*1.25,bsY*1.25, 0);
      button(bX1,bY1, bsX,bsY, 1);
      button(bX2,bY1, bsX,bsY, 2);
    }
    image(logo, posX,posY, tamX,tamY);              //logo Shark's Dinner
  }


//-------------------------------------------------------------------------------------Pantalla de juego
  if(pantalla==1){
    burbujas(width/2,height+50, width,width/10, true);      //burbujas de fondo
  
    shark();                                              //Tibu
    
    for(int p=0;  p<posFish.length;  p++){
      peces(p, posFish[p][0],posFish[p][1]);                //Peces
    }
    
    cartel("   ", width*9/10,height*1/10, 50);
    
    if(puntos<0){  fill(360,100,map(abs(puntos), 0,abs(perder), 0,100));
    }else{  fill(100,100,map(puntos, 0,ganar, 0,100));  }
    text(puntos, width*9/10,height*1/10);                              //mostrar puntaje
    
    if(puntos<=perder)  pantalla=5;
    if(puntos>=ganar)  pantalla=6;
  }


//-------------------------------------------------------------------------------------Pantalla de controles
  if(pantalla==2){
    burbujas(bX1,bY1+bsY, bsX,50, false);
    
    float posX1=width/25, posY1=posX1,                      //rect del fondo
    posX2=width-posX1, posY2=bY1-bsY,
    tamX=posX2-posX1, tamY=posY2-posY1;
    pushStyle();
    rectMode(CORNERS);  stroke(0);  strokeWeight(10);
    fill(200,100,25);
    rect(posX1,posY1, posX2,posY2, bX1/3);
    
    textAlign(CENTER,CENTER);  textSize(20);  fill(360);
    
    tint(360,25);
    image(shark[0][0], posX1+tamX*1/7,posY1+tamY*1.25/6,  shark[0][0].width*2/3,shark[0][0].height*2/3);
    image(shark[0][0], posX1+tamX*1/7,posY1+tamY*4/6,  shark[0][0].width*2/3,shark[0][0].height*2/3);
    tint(200,100,100);
    image(fish[0], posX1+tamX*6/7,posY1+tamY*4/6);
    noTint();
    image(shark[0][0], posX1+tamX*1/7,posY1+tamY*1/6,  shark[0][0].width*2/3,shark[0][0].height*2/3);
    text("Pulsa 'w'\npara subir.", posX1+tamX*1/7,posY1+tamY*2.25/6);
    image(shark[0][0], posX1+tamX*1/7,posY1+tamY*4.25/6,  shark[0][0].width*2/3,shark[0][0].height*2/3);
    text("Pulsa 's'\npara bajar.", posX1+tamX*1/7,posY1+tamY*5.25/6);
    image(shark[1][0], posX1+tamX*3.5/7,posY1+tamY*1/6,  shark[1][0].width*2/3,shark[1][0].height*2/3);
    text("Pulsa 'ESPACIO' para\nabrir la boca.\nSi la abres mucho,\nte cansarás.", posX1+tamX*3.5/7,posY1+tamY*2.5/6);
    text("||\n \nPulsa 'p' para\npausar el juego.", posX1+tamX*3.5/7,posY1+tamY*5/6);
    image(fish[0], posX1+tamX*6/7,posY1+tamY*1/6);
    text("Come "+ganar+" peces\npara ganar.", posX1+tamX*6/7,posY1+tamY*2.25/6);
    text("¡Cuidado con el\npez venenoso!", posX1+tamX*6/7,posY1+tamY*5.25/6);
    popStyle();
    
    button(bX1+(bX2-bX1)/2,bY2, bsX*1.25,bsY*1.25, 0);
    button(bX2,bY1, bsX,bsY, 2);
  }


//-------------------------------------------------------------------------------------Pantalla de créditos
  if(pantalla==3){
    burbujas(bX2,bY1+bsY, bsX,50, false);
    
    float posX1=width/25, posY1=posX1,                      //rect del fondo
    posX2=width-posX1, posY2=bY1-bsY,
    tamX=posX2-posX1, tamY=posY2-posY1;
    pushStyle();
    rectMode(CORNERS);  stroke(0);  strokeWeight(10);
    fill(200,100,25);
    rect(posX1,posY1, posX2,posY2, bX1/3);
    
    fill(360);
    
    image(logo, posX1+tamX*1/2,posY1+tamY*2/6,  logo.width*1/3,logo.height*1/3);
    textAlign(CENTER,TOP);  textSize(20);
    text("Juego creado por:\nFernando Cardos\nMartegani\n(84256/3)", posX1+tamX/2,posY1+tamY*3/5);
    textAlign(LEFT,BOTTOM);  textSize(17);  
    text("Materia:\nTecnología\nmultimedial 1\n \nComisión: 2\n \nDocente:\nMatías Jauregui Lorda",
    posX1+tamX*1/20,posY1+tamY*7/8);
    image(scratch, posX1+tamX*8/9,posY1+tamY*2.5/6, scratch.width*2/6,scratch.height*2/6);
    textAlign(RIGHT,BOTTOM);  textSize(17); 
    text("Imágenes de:\nScratch\n \nEl juego es una\nadaptación de un\nprograma que hice en\nScratch hace tiempo.",
    posX1+tamX*19/20,posY1+tamY*7/8);
    popStyle();
    
    button(bX1+(bX2-bX1)/2,bY2, bsX*1.25,bsY*1.25, 0);
    button(bX1,bY1, bsX,bsY, 1);
  }


//-------------------------------------------------------------------------------------Pantalla de pausa
  if(pantalla==4){
    burbujas(width/2,height+50, width,width/10, false);
    
    cartel("| Pausa |", width/2,height/2, 50);
    
    button(bX1+(bX2-bX1)/2,bY2, bsX*1.25,bsY*1.25, 0);
    button(bX1,bY1, bsX,bsY, 1);
    button(bX2,bY1, bsX,bsY, 2);
  }


//-------------------------------------------------------------------------------------Pantalla de perder
  if(pantalla==5){
    burbujas(width/2,height+50, width,width/10, false);
    image(shark[2][0], width/5,height/4, shark[2][0].width*1.25,shark[2][0].height*1.25);      //Tibu triste
    image(fish[1], width*4/5,height/4-20, fish[1].width*2,fish[1].height*2);                   //Pez
    
    cartel("Perdiste :c", width/2,height/2, 50);
    
    button(bX1+(bX2-bX1)/2,bY2, bsX*1.25,bsY*1.25, 0);
    button(bX1,bY1, bsX,bsY, 1);
    button(bX2,bY1, bsX,bsY, 2);
  }


//-------------------------------------------------------------------------------------Pantalla de ganar
  if(pantalla==6){
    burbujas(width/2,height+50, width,width/10, false);
    image(shark[1][0], width*2/5,height/4, shark[1][0].width*1.25,shark[1][0].height*1.25);      //Tibu triste
    image(fish[0], width*3/5,height/4, fish[0].width,fish[0].height);                   //Pez
    
    cartel("Ganaste :D", width/2,height/2, 50);
    
    button(bX1+(bX2-bX1)/2,bY2, bsX*1.25,bsY*1.25, 0);
    button(bX1,bY1, bsX,bsY, 1);
    button(bX2,bY1, bsX,bsY, 2);
  }
  
  println(pantalla);
}


//-------------------------------------------------------------------------------------Carteles
void cartel(String texto, float x, float y, float tam){
  fill(200,100,100,50);
  rect(x,y, texto.length()*tam*3/4,tam*3/2, tam/2);
  textAlign(CENTER,CENTER);  textSize(tam);  fill(360);
  text(texto,x,y);
}
