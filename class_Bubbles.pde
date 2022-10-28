class Bubbles{
  
//-------------------------------------------------------------------------------------------------PROPIEDADES
  float posX,posY, tam, moveX,moveY;
  int area, cant;
  float[][] bubbles;
  
//-------------------------------------------------------------------------------------------------CONSTRUCTOR
  Bubbles(float x, float y, int a){
    posX=x;  posY=y;  area=a;
    tam=25;  cant=area*1/10;
    bubbles = new float[cant][4];
    for(int i=0;  i<cant;  i++){
      bubbles[i][0]=posX;                  //posición inicial X
      bubbles[i][1]=posY;                  //posición inicial Y
      bubbles[i][2]=random(-5,5);         //velocidad X
      bubbles[i][3]=-random(3,5);         //velocidad Y
    }
  }
  
//-------------------------------------------------------------------------------------------------MÉTODOS
  void show(){            //dibujar burbujas
    pushStyle();
      noStroke();  fill(200,100,100,50);
      for(int i=0;  i<cant;  i++){
        if(dist(posX,posY, bubbles[i][0],bubbles[i][1])<area)      //sólo dibujar dentro del area
          ellipse(bubbles[i][0],bubbles[i][1], tam,tam);
      }
    popStyle();
  }
  void mover(){
    for(int i=0;  i<cant;  i++){
      if(dist(posX,posY, bubbles[i][0],bubbles[i][1])<area){
        bubbles[i][0]+=bubbles[i][2];                            //mover en X
        bubbles[i][1]+=bubbles[i][3];                            //mover en Y
      }
    }
  }
  
}
