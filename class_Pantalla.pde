class Pantalla{
  
//-------------------------------------------------------------------------------------------------PROPIEDADES
  int select, puntos,ganar,perder;
  PImage fondo, logo, scratch;
  boolean pausado;
  
  Peces[] peces;  Shark tibu;
  Carteles controles, creditos, jugar, puntaje, ganaste, perdiste, pausa;
  
  //SoundFile sharksSong;      //declarar objetos para sonido
  
//-------------------------------------------------------------------------------------------------CONSTRUCTOR
  Pantalla(){
    select=0;
    fondo = loadImage("underwater.png");        //cargas archivos
    logo = loadImage("Title.png");
    scratch = loadImage("Scratch.png");
    
    puntos=0;
    ganar=20;      //puntos para ganar
    perder=0;      //puntos para perder
    pausado=false;
    
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
    pausa = new Carteles("Pausa ||", width/2,height*2/5, width/16);
        
    //sharksSong = new SoundFile(this, "Sharks.mp3");            //si intento poner esto en una clase me tira que el constructor no existe                
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
    
    if(select>1  ||  pausado){  sharksSong.amp(0.15);    //cambiar volumen entre pantallas
    }else{  sharksSong.amp(0.5);  }
    if(!sharksSong.isPlaying()){
      sharksSong.jump(0.5);
      sharksSong.rate(1.1);
      sharksSong.loop();                              //música de fondo
    }
    
  }
  void show0(){          //pantalla inicial
    controles.show();
    creditos.show();
    jugar.show();

    
    image(logo, width/2,height*6/20, width/2,height/2);
  }
  void show1(){          //pantalla de juego
    jugar.burbujas();
    if(ganarSound.isPlaying()){  ganarSound.stop();  }
    if(perderSound.isPlaying()){  perderSound.stop();  }
    if(!pausado){
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
      if(puntos>=ganar){
        select=4;  reset();        //ganar
        ganarSound.amp(0.2);
        ganarSound.jump(0.2);
        ganarSound.play();
      }
      if(puntos<perder){
        select=5;  reset();          //perder
        perderSound.amp(0.2);
        perderSound.play();
      }
    }else{
      pausa.show();
      controles.show();
      creditos.show();
    }
    puntaje.show();    //cartel de puntaje
  }
  void show2(){          //pantalla de controles
    creditos.show();
    controles.burbujas();
    jugar.show();
    
    pushStyle();
      rectMode(CORNERS);  stroke(0);  strokeWeight(10);  fill(200,100,25);        //fondo
      rect(width*1/16,height*1/16, width*15/16,height*10/16, width/9);
      
      textAlign(CENTER,CENTER);  textSize(20);  fill(360);
      
      tint(360,25);  image(tibu.pose[0][0], width*3/16,height*3/16,  tibu.pose[0][0].width*2/3,tibu.pose[0][0].height*2/3);      //W para subir
      noTint();  image(tibu.pose[0][0], width*3/16,height*2.5/16,  tibu.pose[0][0].width*2/3,tibu.pose[0][0].height*2/3);
      text("Pulsa 'w'\npara subir.", width*3/16,height*4.5/16);
      
      tint(360,25);  image(tibu.pose[0][0], width*3/16,height*6.5/16,  tibu.pose[0][0].width*2/3,tibu.pose[0][0].height*2/3);      //S para bajar
      noTint();  image(tibu.pose[0][0], width*3/16,height*7/16,  tibu.pose[0][0].width*2/3,tibu.pose[0][0].height*2/3);
      text("Pulsa 's'\npara bajar.", width*3/16,height*8.5/16);
      
      noTint();  image(tibu.pose[1][0], width*8/16,height*2.5/16,  tibu.pose[1][0].width*2/3,tibu.pose[1][0].height*2/3);         //ESPACIO para comer
      text("Pulsa 'ESPACIO' para\nabrir la boca.", width*8/16,height*4.5/16);
      
      text("||\n \nPulsa 'p' para\npausar el juego.", width*8/16,height*8/16);                  //P para pausar
      
      noTint();  image(peces[0].pose[0], width*13/16,height*3/16);                                //Come peces para ganar
      text("Come "+ganar+" peces\npara ganar.", width*13/16,height*4.5/16);
      
      tint(200,100,100);  image(peces[0].pose[0], width*13/16,height*7/16);              //Cuidado con el pez venenoso
      text("¡Cuidado con el\npez venenoso!", width*13/16,height*8.5/16);
    popStyle();
  }
  void show3(){          //pantalla de créditos
    controles.show();
    creditos.burbujas();
    jugar.show();
    
    pushStyle();
      rectMode(CORNERS);  stroke(0);  strokeWeight(10);  fill(200,100,25);        //fondo
      rect(width*1/16,height*1/16, width*15/16,height*10/16, width/9);
      
      textAlign(LEFT,BOTTOM);  textSize(17);  fill(360);
      text("Canción: 'Sharks'\nde Imagine Dragons\n \nMateria:\nTecnología\nmultimedial 1\n \nComisión: 2\n \nDocentes:\nMatías Jauregui Lorda\nTobías Albirosa",
      width*1.5/16,height*8/16);
      
      textAlign(CENTER,TOP);  textSize(18);  fill(360);
      image(logo, width*8/16,height*4/16,  logo.width*1/3,logo.height*1/3);
      text("Juego creado por:\nFernando Cardos\nMartegani\n(84256/3)", width*8/16,height*7/16);
      
      textAlign(RIGHT,BOTTOM);  textSize(17);  fill(360);
      image(scratch, width*13.5/16,height*4/16, scratch.width*2/6,scratch.height*2/6);
      text("Imágenes de:\nScratch\n \nEl juego es una\nadaptación de un\nprograma que hice en\nScratch hace tiempo.",
      width*14.5/16,height*8/16);
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
        if(i==peces.length-1){
          tibu.poison=true;  puntos-=5;    //envenenar
          comerMaloSound.amp(0.5);
          comerMaloSound.jump(0.2);
          comerMaloSound.play();
        }else{
          puntos++;                      //sumar puntos
          comerBuenoSound.amp(0.5);
          comerBuenoSound.jump(0.2);
          comerBuenoSound.play();
        }
        puntaje.update(" "+puntos+" ");
      }
    }
  }
  
  void controles(char k, boolean p){
    if(k=='w'){  tibu.up=p;  }            //subir
    if(k=='s'){  tibu.down=p;  }          //bajar
    if(k==' '){  tibu.eat=p;  }           //morder
    if(!keyPressed  &&  k=='p'  &&  select==1){  pausado=!pausado;  }           //pausar/despausar juego
  }
  void click(){
    controles.click();
    creditos.click();
    jugar.click();
  }
  
  void reset(){
    puntos=0;
    puntaje.update(" "+puntos+" ");
    tibu.poison=false;  tibu.time=0;
    for(int i=0;  i<peces.length;  i++){      //métodos de los peces
      peces[i].time=0;
      peces[i].eaten=false;
    }
  }
  
}
