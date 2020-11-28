PImage fondo;
Ficha ficha;
//hola
void setup(){
  size(690,690);
  fondo = loadImage("FondoParques.jpg");
  ficha = new Ficha(1);
}

void draw(){
  image(fondo,0,0,width,height);
  ficha.dibujar();
}

void keyPressed(){
  if (keyCode == UP){
    ficha.casilla_actual++;
    ficha.casilla_actual = ficha.casilla_actual < 0 ? 67 : ficha.casilla_actual % 68;
  } 
}
