PImage refeI;  boolean reset,  showCartel,  debug1,debug2,  conColor;
int tiempo,  cartel,tCartel,alfa;
float cuboX,cuboY,cuboH,  cubos,seg,  sombraX,sombraY,  cuboColor,cuboSat;;
void setup(){
  size(600,600);  //máximo 800x600
  refeI = loadImage("referencia cubos.jpg");
  colorMode(HSB,360,100,100,100);
  reset=true;
}

void reset(){

  if(reset){                                            //valores iniciales
    cubos=4;  seg=3;  cartel=-1;
    sombraX=sombraY=tiempo=cartel=tCartel=alfa=0;
    cuboColor=cuboSat=0;  conColor=false;
    debug1=debug2=showCartel=false;
    reset=false;
  }
  cuboX=width/(cubos*2); cuboY=cuboX*tan(radians(30));             //trigonometría
  cuboH=sqrt(sq(cuboX)+sq(cuboY));  //pitágoras
}


//----------------------------------------------------------------------Dibujo repetido.
void draw(){
  
  reset();
  
  background(180);
  if(debug2)  referencia();                                              //cargar imagen de referencia
  
  if(!debug2){
    for(int Y=0;  Y<cubos;  Y++){
      for(int X=0; X<=(cubos+1);  X++){
        if(X%cubos==0){  cuboColor=map(X, 0,cubos,  0,300);                  //cambiar colores
        }else{  cuboColor=map(cubos-X, 0,cubos,  0,300);  }
        cubo(-cuboX*0.5+X*(cuboX*2),Y*(cuboH*2+cuboY*2), false);                            //cubos
        cubo(-cuboX*3.5+X*(cuboX*2),(cuboH+cuboY)+Y*(cuboH*2+cuboY*2), false);
        sombras(-cuboX*0.5+X*(cuboX*2),Y*(cuboH*2+cuboY*2));                                //sombras
        sombras(-cuboX*3.5+X*(cuboX*2),(cuboH+cuboY)+Y*(cuboH*2+cuboY*2));
      }
    }
  }
  
  if(!(debug1 || debug2))  controles();
  
  if(debug1)  debug();
}


//----------------------------------------------------------------------Dibujar cubos
void cubo(float posX, float posY, boolean showRefe){
  
  if(showRefe){  fill(0,0,100,90);  stroke(0,0,0,25);  strokeWeight(1);
  }else{  fill(cuboColor,cuboSat,60);  stroke(0);  strokeWeight(8-seg);  }
  strokeJoin(ROUND);  rectMode(CORNER);

  quad(posX,posY,  posX+cuboX,posY+cuboY,  posX+cuboX*2,posY,  posX+cuboX,posY-cuboY);    //cara superior
  for(int L=1;  L<seg;  L++){
    float X1=(posX+cuboX*(L/seg));                                       //líneas ascendentes
    float Y1=(posY+cuboY*(L/seg));
    line(X1,Y1,  X1+cuboX,Y1-cuboY);
  }
  for(int L=1;  L<seg;  L++){
    float X1=(posX+cuboX*(L/seg));                                       //líneas descendentes
    float Y1=(posY-cuboY*(L/seg));
    line(X1,Y1,  X1+cuboX,Y1+cuboY);
  }
  
  quad(posX,posY,  posX+cuboX,posY+cuboY,  posX+cuboX,posY+cuboY+cuboH,  posX,posY+cuboH);    //cara izquierda
  for(int L=1;  L<seg;  L++){
    line(posX , (posY+cuboH*(L/seg)),                                    //líneas horizontales
    (posX+cuboX) , (posY+cuboH*(L/(seg*2))+cuboY*(L/seg+1)));
  }
  for(int L=1;  L<seg;  L++){
    float X1=(posX+cuboX*(L/seg));                                      //líneas verticales
    float Y1=(posY+cuboY*(L/seg));
    line(X1,Y1,  X1,Y1+cuboH);
  }
  
  quad(posX+cuboX*2,posY,  posX+cuboX*2,posY+cuboH,  posX+cuboX,posY+cuboY+cuboH, posX+cuboX,posY+cuboY);  //cara derecha
  for(int L=1;  L<seg;  L++){
    float X1=(posX+cuboX);
    line(X1,(posY+cuboH*(L/(seg*2))+cuboY*(L/seg+1)),                    //líneas horizontales
    X1+cuboX,(posY+cuboH*(L/seg)));
  }
  for(int L=1;  L<seg;  L++){
    float X1=(posX+cuboX*(L/seg+1));                                     //líneas verticales
    float Y1=(posY-cuboY*(L/seg-1));
    line(X1,Y1,  X1,Y1+cuboH);
  }
  
  if(showRefe){                                     //líneas de referencia para construir el cubo
    textSize(15);  strokeWeight(5);
    color color1=(color(360,100,100));
      stroke(color1);
      line(posX,posY,  posX+cuboX,posY);
      fill(color1);
      textAlign(LEFT,BOTTOM);
      text("cuboX",  posX+cuboX/2,posY-5);
    color color2=(color(240,100,100));
      stroke(color2);
      line(posX+cuboX,posY,  posX+cuboX,posY+cuboY);
      fill(color2);
      textAlign(LEFT,CENTER);
      text("cuboY",  posX+cuboX*(3/2),posY+cuboY/2);
    color color3=(color(290,100,100));
      stroke(color3);
      line(posX,posY,  posX+cuboX,posY+cuboY);
      fill(color3);
      textAlign(LEFT,TOP);
      text("cuboH",  posX,posY+cuboY/2);
  }
}


//----------------------------------------------------------------------Teclas que hacen cosas
void keyPressed(){
  
  if(tiempo%10==0  ||  tiempo==0){                                //mantener pulsado hace que cambie de vez en cuando
    tiempo=0;
    if(key=='a'  ||  key=='d'  ||  key=='r'  ||  key=='s'  ||  key==' '){        //S para definir valores random
      if(key=='a'  ||  key=='s')
        for(float i=cubos;  i==cubos;  cubos=int(random(2,6))){}         //A para cambiar sólo cantidad de cubos
      if(key=='d'  ||  key=='s')
        for(float i=seg;  i==seg;  seg=int(random(3,7))){};              //D para cambiar sólo cantidad de cuadrados
      if(key=='r')  debug2=!debug2;                           //mostrar cubo de referencia
      if(key==' ')  conColor=!conColor;                       //ESPACIO para cambiar entre colorido o monocromático
        if(conColor){
          cuboSat=75;
        }else{
          cuboSat=0;
        }
    }else{
      reset=true;                                            //valores iniciales
    }
  }
  tiempo++;
}
void keyReleased(){  tiempo=0;  }


//----------------------------------------------------------------------mostrar cubo de referencia
void mouseClicked(){  debug1=!debug1;  }


//----------------------------------------------------------------------Sombras
void mouseMoved(){  sombraX=mouseX;  sombraY=mouseY;  }

void sombras(float posX, float posY){

  noStroke();  rectMode(CORNER);
  color sombra1=(color(0,0,100,35));
  color sombra2=(color(0,0,75,35));
  color sombra3=(color(0,0,25,35));
  color sombra4=(color(0,0,0,35));
  
  if(sombraY>posY+cuboY){  fill(sombra4);
  }else{  fill(sombra1);  }
  quad(posX,posY,  posX+cuboX,posY+cuboY,  posX+cuboX*2,posY,  posX+cuboX,posY-cuboY);    //cara superior
  if(sombraX>posX+cuboX){  fill(sombra3);
  }else{  fill(sombra2);  }
  quad(posX,posY,  posX+cuboX,posY+cuboY,  posX+cuboX,posY+cuboY+cuboH,  posX,posY+cuboH);    //cara izquierda
  if(sombraX>posX+cuboX){  fill(sombra2);
  }else{  fill(sombra3);  }
  quad(posX+cuboX*2,posY,  posX+cuboX*2,posY+cuboH,  posX+cuboX,posY+cuboY+cuboH, posX+cuboX,posY+cuboY);  //cara derecha
}


//----------------------------------------------------------------------Imagen de referencia
void referencia(){
  imageMode(CENTER);
  tint(360,25);
  image(refeI, width/2,height/2, width,height);
}


//----------------------------------------------------------------------Cartel de controles
void controles(){
  int tam=18;
  int posX=width/2;
  int posY=height-tam;
  if(tCartel<=5*60){                                          //cada 5 segundos, aparecer o desaparecer el cartel
    tCartel++;
    if(tCartel==2*60)  showCartel=!showCartel;
    }else{  tCartel=0;  }
  if(showCartel){
    if(alfa<100)  alfa+=5;               //aumentar opacidad del cartel
  }else{
    if(0<=alfa){
      alfa-=5;                           //reducir opacidad del cartel
      if(alfa==0){
        cartel++;                        //cambiar el cartel, en secuencia
        if(7<cartel)  cartel=0;
      }
    }
  }
  fill(360,map(alfa, 0,100, 0,80));                  //cambiar opacidad a la vez sin completarse
  rect(0,posY-(tam/2), width,posY+(tam/2));
  fill(0,alfa);  textSize(tam);
  textAlign(CENTER,CENTER);
  if(cartel==0)  text("Mueve el cursor para cambiar la fuente de luz", posX,posY);
  if(cartel==1)  text("Pulsa A para cambiar el tamaño de los cubos", posX,posY);
  if(cartel==2)  text("Pulsa D para cambiar las subdivisiones de los cubos", posX,posY);
  if(cartel==3)  text("Pulsa S para cambiar el tamaño y las subdivisiones de los cubos", posX,posY);
  if(cartel==4)  text("Pulsa ESPACIO para prender/apagar el color de los cubos", posX,posY);
  if(cartel==5)  text("Pulsa R para mostrar/ocultar la imagen de referencia", posX,posY);
  if(cartel==6)  text("Haz clic para mostrar/ocultar el cubo de referencia", posX,posY);
  if(cartel==7)  text("Pulsa cualquier otra tecla para reiniciar", posX,posY);
}


//----------------------------------------------------------------------Debug
void debug(){
  fill(180);
  cubo(mouseX,mouseY,true);                                             //cubo de referencia
  println("cursor:"+mouseX+","+mouseY
  +"  ,  cubos:"+cubos+" ,segmentos:"+seg
  +"  ,  cubo: X:"+cuboX+" ,Y:"+cuboY+" ,H:"+cuboH
  );
}
