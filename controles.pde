
//-------------------------------------------------------------------------------------Teclado
void keyPressed(){
  if(pantalla==1){
    if(key=='w'){  up=true;  }            //subir
    if(key=='s'){  down=true;  }          //bajar
    if(key==' '){  eat=true;  }           //morder
    if(key=='p'){
      pantalla=4;                         //pausar
      up=down=eat=false;
    }
  }
}
void keyReleased(){
  if(pantalla==1){
    if(key=='w'){  up=false;  }
    if(key=='s'){  down=false;  }
    if(key==' '){  eat=false;  }
  }
}


//-------------------------------------------------------------------------------------Click
void mousePressed(){
  click=true;
}
void mouseReleased(){
  click=false;
}


//-------------------------------------------------------------------------------------Botones
void button(float x, float y, float tamX, float tamY, int b){

  textAlign(CENTER,CENTER);
  if(b==0){ textSize(30);
  }else{  textSize(20);  }
  fill(bColor[b]);
  rect(x,y, tamX,tamY, tamX/3);
  fill(360);
  text(bText[b], x,y);
  boolean selected = mouseX<x+tamX/2 && mouseX>x-tamX/2 && mouseY<y+tamY/2 && mouseY>y-tamY/2;
  if(selected){
    fill(200,100,100,25);
    rect(x,y, tamX+15,tamY+15, tamX/3);                //resaltar botón seleccionado
    if(click){
      boolean restart = (pantalla==0 || puntos<=perder || puntos>=ganar);
      if(b==0  &&  restart){  reset();  }                                      //reiniciar juego
      for(int i=0;  i<posBubble.length;  i++){  
        posBubble[i][4]=0;                                    //reiniciar burbujas
      }
      pantalla=bLink[b];
      click=false;
    }
  }
}
