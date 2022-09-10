Tree[] trees;  int cantT=6;  //        <-- <-- cantidad de árboles
Rayo[] rayo;  int corR=5;  //        <-- <-- cantidad de esquinas del rayo

void setup(){
  size(800,600);
  colorMode(HSB, 360,100,100,100);
  
  trees = new Tree[cantT];
  for(int i=0;  i<cantT;  i++){
    //trees[i] = new Tree(width*i/(cantT+1),height*3/4);
    trees[i] = new Tree(width*i/(cantT-1),height*3/4);
  }
  rayo = new Rayo[5];
  rayo[0] = new Rayo (0, random(width*1/10,width*9/10),height*(0)/5);      //punto inicial del rayo, define al resto
  for(int i=1;  i<corR;  i++){
    rayo[i] = new Rayo(i, rayo[0].getX(),height*i/5);
  }
}

void draw(){
  background(180);

  for(int i=0;  i<corR;  i++){
    rayo[i].time();
  }
  for(int i=0;  i<cantT;  i++){
    trees[i].show();
    trees[i].isOnFire();
  }
  
  if(keyPressed && key=='p'){
    println(mouseX+","+mouseY);
  }
}
