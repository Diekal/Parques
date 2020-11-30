class Ficha {

  int[] carcel={0, 0};                                       //Coordendas de la carcel
  int casilla_actual;                                        //Casilla actual de la ficha
  int casillas_avanzadas;                                    //Casillas avanzadas por la ficha
  color color_ficha;                                         //Color ficha 
  Boolean ficha_en_carcel, bloqueo;                                   //Estado de la ficha (en la carcel o no) //Estado de casilla en bloqueo

  Ficha(int jugador, int carcelX, int carcelY) {

    ficha_en_carcel = true;                                  //La ficha inicia en la carcel
    color_ficha = colores[jugador-1];                        //Se le asigna el color del jugador
    carcel[0]=carcelX;                                       //Guardamos las coordenadas de la carcel
    carcel[1]=carcelY;

    //Asigna valores segun el jugador
    switch(jugador) {
    case 1:
      casilla_actual = 0;  //su salida
      break;

    case 2:
      casilla_actual = 17;  //su salida
      break;

    case 3:
      casilla_actual = 34;  //su salida
      break;

    case 4:
      casilla_actual = 51;  //su salida
      break;
    }
  }

  void dibujar(int x) {
    push();
    stroke(0);
    strokeWeight(2);
    fill(color_ficha);

    if (x == 0) {
      if (ficha_en_carcel==false) {                                                //Verificamos si la ficha está en juego o en la carcel y se dibuja
        circle(tablero[casilla_actual%68][0], tablero[casilla_actual%68][1], 30);
      } else {
        circle(carcel[0], carcel[1], 30);
      }
    } else {
      print("ok","");
      circle(x, tablero[casilla_actual][1], 30);
    }
    pop();
  }

  void mover(int espacios) {
    if (tablero[casilla_actual%68][3] == 2) {
      bloqueo = false;
    }
    tablero[casilla_actual%68][3] -= 1;
    casilla_actual += espacios;
    casillas_avanzadas+=espacios;
    tablero[casilla_actual%68][3] += 1;
    if (tablero[casilla_actual%68][3] == 2) {
      bloqueo = true;
      print(bloqueo,"");
      dibujar(tablero[casilla_actual][0]+15);
    }
  }

  // CAMBIAR SEGUROS -- VANE 
  // MOVER (VERIFICAR SI SE PUEDE MOVER, MOVER) CLASE FICHA
  // COMER (MOVER 20 ESPACIOS, MANDAR A LA CARCEL, COMER OBLIGATORIAMENTE) FUNCION POR FUERA -- SEBAS
  // SACAR DE LA CARCEL(COMER LAS FICHAS QUE ESTEN EN LA SALIDA) -- SEBAS
  // ENTRADA Y CORONAR FICHA (MOVER 10 ESPACIOS) -- VANE

  //DADOS (POR FUERA) 

  // CLASE JUGADOR

  //Crear 4 fichas 
  // Seleccionar cuantos espacios mover con cada ficha
  // Manejar el turno
  // CONSTRUCTOR (Color, coordenadas de la carcel, casilla de salida y de entrada)
}
