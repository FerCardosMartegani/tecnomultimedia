class Pantalla{
  
//-------------------------------------------------------------------------------------------------PROPIEDADES
  int select, puntos,ganar,perder;
  PImage fondo, logo, scratch;
  
  Peces[] peces;
  Shark tibu;
  Carteles controles;
  Carteles creditos;
  Carteles jugar;
  Carteles puntaje;
  Carteles ganaste;
  Carteles perdiste;
  
//-------------------------------------------------------------------------------------------------CONSTRUCTOR
  Pantalla(){
    select=0;
    fondo = loadImage("underwater.png");        //cargas archivos
    logo = loadImage("Title.png");
    scratch = loadImage("Scratch.png");
    
    puntos=0;
    ganar=20;      //puntos para ganar
    perder=0;      //puntos para perder
    
    tibu = new Shark(width/3,height/2, 5,10);    //tiburón = pos inicial X, pos inicial Y, velocidad X, velocidad Y
    peces = new Peces[4];
    for(int i=0;  i<peces.length-1;  i++){
      peces[i] = new Peces(false, random(width/4,width*3/4),random(height/4,height*3/4), 5,10);    //peces normales
    }
    peces[peces.length-1] = new Peces(true, random(width/4,width*3/4),random(height/4,height*3/4), 10,15);  //pez venenoso
    //peces = normales/venenoso, pos inicial X, pos inicial Y, velocidad mínima, velocidad máxima
    
    controles = new Carteles("CONTROLES", width*2/6,height*5/7, width/24, 2);      //botones
    creditos = new Carteles("CRÉDITOS", width*4/6,height*5/7, width/24, 3);
    jugar = new Carteles("JUGAR", width*1/2,height*6/7, width/16, 1);
    puntaje = new Carteles(" "+puntos+" ", width*9/10,height*1/12, width/20);      //carteles estáticos
    ganaste = new Carteles("Ganaste :D", width/2,height*2/5, width/16);
    perdiste = new Carteles("Perdiste :c", width/2,height*2/5, width/16);

  }
  
//-------------------------------------------------------------------------------------------------MÉTODOS
  void game(){
    image(fondo, width/2,height/2);                    //imagen del fondo
    
    if(select==0){  show0();  }          //pantalla inicial
    if(select==1){  show1();  }          //pantalla de juego
    if(select==2){  show2();  }          //pantalla de controles
    if(select==3){  show3();  }          //pantalla de créditos
    if(select==4){  show4();  }          //pantalla de ganar
    if(select==5){  show5();  }          //pantalla de perder
  }
  void show0(){          //pantalla inicial
    controles.show();
    creditos.show();
    jugar.show();
    
    image(logo, width/2,height*6/20, width/2,height/2);
  }
  void show1(){          //pantalla de juego
    jugar.burbujas();
    tibu.show();          //métodos del tiburón
    tibu.moverX();
    tibu.moverY();
    tibu.morder();
    tibu.enfermar();
    for(int i=0;  i<peces.length;  i++){      //métodos de los peces
      peces[i].show();
      peces[i].mover();
      peces[i].comido();
    }
    comer();          //detectar colisión
    puntaje.show();    //cartel de puntaje
    if(puntos>=ganar){  select=4;  reset();  }        //ganar
    if(puntos<perder){  select=5;  reset();  }          //perder
  }
  void show2(){          //pantalla de controles
    creditos.show();
    controles.burbujas();
    jugar.show();
    
    //acá hay un quilombo de coords que copié y pegué tal cual del tp3, ni lo revisé. 
      
    float posX1=width/25, posY1=posX1,                      //rect del fondo
    posX2=width-posX1, posY2=height*3/4-20-(width/5)/2,
    tamX=posX2-posX1, tamY=posY2-posY1;
    pushStyle();
      rectMode(CORNERS);  stroke(0);  strokeWeight(10);
      fill(200,100,25);
      rect(posX1,posY1, posX2,posY2, (width*1/3)/3);
      
      textAlign(CENTER,CENTER);  textSize(20);  fill(360);
      
      tint(360,25);
      image(tibu.pose[0][0], posX1+tamX*1/7,posY1+tamY*1.25/6,  tibu.pose[0][0].width*2/3,tibu.pose[0][0].height*2/3);
      image(tibu.pose[0][0], posX1+tamX*1/7,posY1+tamY*4/6,  tibu.pose[0][0].width*2/3,tibu.pose[0][0].height*2/3);
      tint(200,100,100);
      image(peces[0].pose[0], posX1+tamX*6/7,posY1+tamY*4/6);
      noTint();
      image(tibu.pose[0][0], posX1+tamX*1/7,posY1+tamY*1/6,  tibu.pose[0][0].width*2/3,tibu.pose[0][0].height*2/3);
      text("Pulsa 'w'\npara subir.", posX1+tamX*1/7,posY1+tamY*2.25/6);
      image(tibu.pose[0][0], posX1+tamX*1/7,posY1+tamY*4.25/6,  tibu.pose[0][0].width*2/3,tibu.pose[0][0].height*2/3);
      text("Pulsa 's'\npara bajar.", posX1+tamX*1/7,posY1+tamY*5.25/6);
      image(tibu.pose[1][0], posX1+tamX*3.5/7,posY1+tamY*1/6,  tibu.pose[1][0].width*2/3,tibu.pose[1][0].height*2/3);
      text("Pulsa 'ESPACIO' para\nabrir la boca.\nSi la abres mucho,\nte cansarás.", posX1+tamX*3.5/7,posY1+tamY*2.5/6);
      text("||\n \nPulsa 'p' para\npausar el juego.", posX1+tamX*3.5/7,posY1+tamY*5/6);
      image(peces[0].pose[0], posX1+tamX*6/7,posY1+tamY*1/6);
      text("Come "+ganar+" peces\npara ganar.", posX1+tamX*6/7,posY1+tamY*2.25/6);
      text("¡Cuidado con el\npez venenoso!", posX1+tamX*6/7,posY1+tamY*5.25/6);
    popStyle();
  }
  void show3(){          //pantalla de créditos
    controles.show();
    creditos.burbujas();
    jugar.show();
    
    float posX1=width/25, posY1=posX1,                      //rect del fondo
    posX2=width-posX1, posY2=height*3/4-20-(width/5)/2,
    tamX=posX2-posX1, tamY=posY2-posY1;
    pushStyle();
      rectMode(CORNERS);  stroke(0);  strokeWeight(10);
      fill(200,100,25);
      rect(posX1,posY1, posX2,posY2, (width*1/3)/3);
      
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
  }
  void show4(){          //pantalla de ganar
    ganaste.show();
    controles.show();
    creditos.show();
    jugar.show();
  }
  void show5(){          //pantalla de perder
    perdiste.show();
    controles.show();
    creditos.show();
    jugar.show();
  }
  
  void comer(){
    for(int i=0;  i<peces.length;  i++){
      if(dist(tibu.mouthX,tibu.mouthY,  peces[i].posX,peces[i].posY)<tibu.mouthR  &&  tibu.sprite==1  &&  !peces[i].eaten){
        peces[i].eaten=true;
        if(i==peces.length-1){  tibu.poison=true;  puntos-=5;  }else{  puntos++;  }
        puntaje.update(" "+puntos+" ");
      }
    }
  }
  
  void controles(char k, boolean p){
    if(k=='w'){  tibu.up=p;  }            //subir tibu
    if(k=='s'){  tibu.down=p;  }          //bajar tibu
    if(k==' '){  tibu.eat=p;  }           //morder tibu
  }
  void click(){
    controles.click();
    creditos.click();
    jugar.click();
  }
  
  void reset(){
    puntos=0;
    tibu.poison=false;  tibu.time=0;
    for(int i=0;  i<peces.length;  i++){      //métodos de los peces
      peces[i].time=0;
      peces[i].eaten=false;
    }
  }
  
}
