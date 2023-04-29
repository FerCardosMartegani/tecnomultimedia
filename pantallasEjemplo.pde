String pantalla;    //variable que define en qué pantalla estoy
int tiempo;    //variable que cuenta el tiempo transcurrido
float botX, botY, botT;
color bg;

void setup() {
  size(800, 600);
  textSize(20);
  textAlign(CENTER,CENTER);
  
  pantalla = "menu";    //pantalla arranca en "menu" y tiempo en 0
  tiempo = 0;
  
  botX = width/2;      //posición del botón
  botY = height/4*3;
  botT = 100;
  
  bg = color(0);
  
  frameRate(60);    //fijar los frames por segundo en 60 (así viene por defecto). O sea que 60frames = 1segundo
}

void draw() {
  
  /*
  poner pantalla.equals("algo") es lo mismo que poner pantalla=="algo"
  pero al String le gusta más con .equals() porque se quiere hacer el interesante (?
  es para preguntarle a pantalla cuánto vale
  */
  
  background(bg);      //pintar el fondo de color bg
  
  text("tiempo: "+tiempo, 100,50);    //mostrar tiempo
  text("pantalla: "+pantalla, 100,100);    //mostrar pantalla

//--------------------------------------------------------------------------------------------//cuando pantalla está en "menu"
  if (pantalla.equals("menu")) {
    bg = color(0);    //cambiar color del fondo
    text("estoy en el menu", width/2, height/2);
    
    tiempo++;
    if(tiempo >= frameRate*5){        //cuando hayan pasado 60*5 frames, o sea 5 segundos...
      pantalla = "p1";                //...pasar a pantalla 1
      tiempo = 0;                      //y reiniciar tiempo
    }
    
    if(dist(mouseX,mouseY,botX,botY) < botT/2){      //si pongo el mouse en el botón (mouseOver), pintar de gris
      fill(127);
    }else{
      fill(255);        //si no pongo el mouse en el botón, pintar de blanco 
    }
    ellipse(botX,botY, botT,botT);      //dibujar botón para siguiente pantalla
    
    fill(255);    //para que el color del botón no afecte al texto

//--------------------------------------------------------------------------------------------//cuando pantalla está en "p1"
  } else if (pantalla.equals("p1")) {
    bg = color(100);    //cambiar color del fondo
    text("estoy en la pantalla 1", width/2, height/2);
    
    tiempo++;
    if(tiempo >= frameRate*2){        //cuando hayan pasado 60*2 frames, o sea 2 segundos...
      pantalla = "p2";                //...pasar a pantalla 2
      tiempo = 0;                      //y reiniciar tiempo
    }

//--------------------------------------------------------------------------------------------//cuando pantalla está en "p2"
  } else if (pantalla.equals("p2")) {
    bg = color(200);    //cambiar color del fondo
    text("estoy en la pantalla 2", width/2, height/2);
    
    if(dist(mouseX,mouseY,botX,botY) < botT/2){      //si pongo el mouse en el botón (mouseOver), pintar de gris
      fill(127);
    }else{
      fill(255);        //si no pongo el mouse en el botón, pintar de blanco 
    }
    ellipse(botX,botY, botT,botT);      //dibujar botón para siguiente pantalla
    
    fill(255);    //para que el color del botón no afecte al texto

//--------------------------------------------------------------------------------------------//cuando pantalla no es ninguna de las anteriores
  } else {
    bg = color(200,0,0);    //cambiar color del fondo
    text("no sé dónde estoy :v", width/2, height/2);
    
  }
  
  println(frameRate);
}

void mousePressed(){                              //si estoy apretando el clic...
  if(pantalla.equals("menu")){                        //y además estoy en la pantalla de menu...
    if(dist(mouseX,mouseY,botX,botY) < botT/2){          //y además pongo el mouse en el botón (mouseOver)...
      pantalla = "p1";                                   //...cambiar a pantalla 1
      tiempo = 0;                                        //y reiniciar tiempo
    }
  }
  
  if(pantalla.equals("p2")){                        //y además estoy en la pantalla 2...
    if(dist(mouseX,mouseY,botX,botY) < botT/2){          //y además pongo el mouse en el botón (mouseOver)...
      pantalla = "menu";                                   //...volver a pantalla menu
      tiempo = 0;                                        //y reiniciar tiempo
    }
  }
}

void keyPressed(){                //si presiono una tecla...
  pantalla = "asfafw3poakwpoa";      //...cambiar pantalla a asfafw3poakwpoa
}
