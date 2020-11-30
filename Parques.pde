int [][] tablero = {{435,555,1,0,0},{435,525,0,0,0},{435,495,0,0,0},{435,465,0,0,0},{465,435,0,0,0},{495,435,0,0,0},{525,435,0,0,0},{555,435,1,0,0},{585,435,0,0,0},{615,435,0,0,0},{645,435,0,0,0},{675,435,0,0,0},{675,345,1,0,0},{675,255,0,0,0},{645,255,0,0,0},{615,255,0,0,0},{585,255,0,0,0},
                      {555,255,1,0,0},{525,255,0,0,0},{495,255,0,0,0},{465,255,0,0,0},{435,225,0,0,0},{435,195,0,0,0},{435,165,0,0,0},{435,135,1,0,0},{435,105,0,0,0},{435,75,0,0,0},{435,45,0,0,0},{435,15,0,0,0},{345,15,1,0,0},{255,15,0,0,0},{255,45,0,0,0},{255,75,0,0,0},{255,105,0,0,0},
                      {255,135,1,0,0},{255,165,0,0,0},{255,195,0,0,0},{255,225,0,0,0},{225,255,0,0,0},{195,255,0,0,0},{165,255,0,0,0},{135,255,1,0,0},{105,255,0,0,0},{75,255,0,0,0},{45,255,0,0,0},{15,255,0,0,0},{15,345,0,0,0},{15,435,0,0,0},{45,435,0,0,0},{75,435,0,0,0},{105,435,0,0,0},
                      {135,435,1,0,0},{165,435,0,0,0},{195,435,0,0,0},{225,435,0,0,0},{255,465,0,0,0},{255,495,0,0,0},{255,525,0,0,0},{255,555,1,0,0},{255,585,0,0,0},{255,615,0,0,0},{255,645,0,0,0},{255,675,0,0,0},{345,675,0,0,0},{435,675,0,0,0},{435,645,0,0,0},{435,615,0,0,0},{435,585,0,0,0}
};

color[] colores = {#FFFF00, #0000FF, #FF0000, #009245};    //Colores disponibles (amarillo, azul, rojo, verde)
PImage fondo;
Jugador jugador1, jugador2, jugador3, jugador4; 
int NumeroJugadores, Turno, Ronda, Dado1, Dado2;
int seguro1, seguro2;
String[] JugadorenTurno = {"Amarillo", "Azul", "Rojo", "Verde"};

void setup(){
  NumeroJugadores = 2;
  size(990,690);
  fondo = loadImage("TableroParques3.jpg");
    
  Dado1= 0;                                          //Iniciamos los dados en 0
  Dado2= 0;
  
  if(NumeroJugadores>=2){                            //creamos los jugadores necesarios
    jugador1 = new Jugador(1);
    jugador2 = new Jugador(2);
  }if(NumeroJugadores>=3){
    jugador3 = new Jugador(3);
  }if(NumeroJugadores==4){
    jugador4 = new Jugador(4);
  }
}

void draw(){
  
  image(fondo,0,0,width,height);
  jugador1.DibujarFichas();                           //Dibujamos las fichas de los jugadores
  jugador2.DibujarFichas();
  
  
  textSize(64);                                       //Escribimos el valor de los dados
  fill(0, 0, 0);
  text( Dado1, 760, 270);
  text( Dado2, 880, 270);
  
  textSize(60);                                       //Escribimos el color del jugador siguiente
  fill(colores[Turno % NumeroJugadores]);
  text(JugadorenTurno[Turno % NumeroJugadores], 720, 170);
}

void keyPressed(){
  if (key == ENTER) {
    if(Turno % NumeroJugadores == 0 ){                 //Con el módulo del turno entre los jugadores sabemos quien tira los dados 
      jugador1.TirarDados();
      
    }else if(Turno % NumeroJugadores == 1 ){
      jugador2.TirarDados();
      
    }else if(Turno % NumeroJugadores == 2 ){
      jugador3.TirarDados();
      
    }else if(Turno % NumeroJugadores == 3 ){
      jugador4.TirarDados();
      
    } 
  }
}
