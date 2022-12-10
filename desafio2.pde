char[][] fichas = new char[3][3];  char[] ficha = new char[3];
boolean click=false, win;  int turno, wait, tam;


void setup(){
  
  size(600,600);
  colorMode(HSB, 360,100,100,100);

  win=false;
  if(round(random(0,1))==0){
    ficha[1] = 'X';  ficha[2] = 'O';
    turno=1;  wait=0;
  }else{
    ficha[1] = 'O';  ficha[2] = 'X';
    turno=2;  wait=60;
  }
  ficha[0] = '-';
  for(int x=0;  x<3;  x++){
    for(int y=0;  y<3;  y++){
      fichas[x][y] = ficha[0];
    }
  }
}


void draw(){

  background(180);
  tam=height/5;

  for(int x=0;  x<3;  x++){
    for(int y=0;  y<3;  y++){
      int posX = width*(x+1)/4;
      int posY = height*(y+1)/4;
      if(dist(mouseX,mouseY, posX,posY)<tam/2  &&  turno==1){
        if(mousePressed  &&  fichas[x][y] == ficha[0]){
          fichas[x][y] = ficha[1];
          turno=2;
          click=false;
        }
      }
      for(int c=0;  c<ficha.length;  c++){
        if(fichas[x][y]==ficha[c]){
          fill(map(c, 0,ficha.length, 0,360),100,100);
        }
      }
      textSize(tam);
      textAlign(CENTER,CENTER);
      text(fichas[x][y],  posX,posY);
    }
  }

  ganar();
  if(turno==2){
    player2();
  }
  
  fill(360);
  textSize(tam/4);
  textAlign(RIGHT,CENTER);
  text((ficha[1]+" "+ficha[2]), width-tam/4,tam/4);
}


void player2(){

  wait++;
  if(wait>60){
    int x=0, y=0;
    for( ;  fichas[x][y]!=ficha[0]  ; ){
      x=round(random(0,2));
      y=round(random(0,2));
    }
    fichas[x][y]=ficha[2];
    wait=0;
    turno=1;
  }
}


void ganar(){
  
  for(int x=0;  x<3;  x++){
    if(fichas[x][0]==fichas[x][1]
    && fichas[x][1]==fichas[x][2]
    && fichas[x][2]==fichas[x][0]){
      for(int p=1;  p<3;  p++){
        if(fichas[x][0]==ficha[p]){
          turno=0;
          println("gana "+p);
          fill(0,0,100,50);
          rectMode(CENTER);
          rect(width*(x+1)/4,height/2,  tam,height);
        }
      }
    }else{
      println("no winner");
    }
  }
}


void mouseClicked(){ click=true; }
void mouseMoved(){ click=false; }

void keyPressed(){  setup();  }
