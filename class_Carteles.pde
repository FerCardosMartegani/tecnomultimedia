class Carteles{
  
//-------------------------------------------------------------------------------------------------PROPIEDADES
  float posX, posY, tam;
  String texto;
  int link;
  PFont fuente;
  color colorFondo;
  boolean showing;
  
  Bubbles burbujas;
  
//-------------------------------------------------------------------------------------------------CONSTRUCTOR
  Carteles(String s, float x, float y, float t){          //carteles estáticos
    constructor(s,x,y,t);  link=0;
    colorFondo=color(200,100,100,50);
  }
  Carteles(String s, float x, float y, float t, int l){            //botones
    constructor(s,x,y,t);  link=l;
    colorFondo=color(map(link, 0,6, 0,360),50,75);
  }
  void constructor(String s, float x, float y, float t){
    posX=x;  posY=y;  tam=t;  texto=s;
    fuente = loadFont("CooperBlack-20.vlw");  textFont(fuente);
    burbujas = new Bubbles(0,0,0);      //se instancia pero no se manifiesta
  }
  
//-------------------------------------------------------------------------------------------------MÉTODOS
  void show(){
    pushStyle();
      fill(colorFondo);
      rectMode(CENTER);
      rect(posX,posY, texto.length()*tam*2/3,tam*7/6, tam/2);
      textAlign(CENTER,CENTER);  textSize(tam*2/3);  fill(360);
      text(texto, posX,posY);
    popStyle();
    if(link!=0  &&  mouseX<posX+(texto.length()*tam*2/3+tam/2)/2 && mouseX>posX-(texto.length()*tam*2/3+tam/2)/2
       && mouseY<posY+(tam*7/6+tam/2)/2 && mouseY>posY-(tam*7/6+tam/2)/2){
      pushStyle();
        fill(200,100,100,25);
        rect(posX,posY, texto.length()*tam*2/3+tam/2,tam*7/6+tam/2, tam/2);
      popStyle();
    }
  }
  void update(String s){        //actualizar datos en pantalla
    texto=s;
  }
  void click(){
    if(mouseX<posX+(texto.length()*tam*2/3+tam/2)/2 && mouseX>posX-(texto.length()*tam*2/3+tam/2)/2
       && mouseY<posY+(tam*7/6+tam/2)/2 && mouseY>posY-(tam*7/6+tam/2)/2
       &&  link!=0  &&  screen.select!=link){
      screen.select=link;      //al hacer clic en el botón, cambiar de pantalla
      
      burbujas = new Bubbles(posX,posY+tam, width/3);    //al hacer clic en el botón, generar burbujas
    }
  }
  void burbujas(){
    burbujas.show();
    burbujas.mover();
  }

}
