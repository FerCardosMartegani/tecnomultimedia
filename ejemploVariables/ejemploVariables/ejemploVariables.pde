PImage refe;

//-----------------------------------SETUP
void setup() {
  size(300, 300);

  refe = loadImage("refe.jpg");
}

//-----------------------------------DRAW
void draw() {
  background(253, 242, 179);

  //image(refe, 0, 0, 300, 300);

  //-----------------------------------MI DIBUJITO TODO BELLO
  //Torso
  fill(0, 0, 255);
  rect(73, 105, 150, 150);

  //Cabeza
  fill(255, 220, 170);
  rect(130, 30, 50, 70);

  //Brazos
  rect(150, 90, 150, 150);
  rect(0, 100, 70, 150);
}
