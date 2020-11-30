class Jugador {
  Ficha ficha1;
  Ficha ficha2;
  Ficha ficha3;
  Ficha ficha4;
  int espacios, fichas_enCarcel, pares, ficha_a_mover, espacios_avanzados; //Dados //Fichas en la carcel //pares //ficha_a_mover //espacios avanzados por la ficha //tiempo transcurrido 


  Jugador(int numerodejugador) {

    //Cada jugador tiene un número asignado del cual depende su color y su turno
    // se crea cada ficha con las coordenadas de su carcel 
    if (numerodejugador==1) {
      ficha1 = new Ficha(1, 550, 550);
      ficha2 = new Ficha(1, 620, 550);
      ficha3 = new Ficha(1, 550, 620);
      ficha4 = new Ficha(1, 620, 620);
    } else if (numerodejugador==2) {
      ficha1 = new Ficha(2, 550, 70);
      ficha2 = new Ficha(2, 620, 70);
      ficha3 = new Ficha(2, 550, 140);
      ficha4 = new Ficha(2, 620, 140);
    } else if (numerodejugador==3) {
      ficha1 = new Ficha(3, 70, 70);
      ficha2 = new Ficha(3, 140, 70);
      ficha3 = new Ficha(3, 70, 140);
      ficha4 = new Ficha(3, 140, 140);
    } else if (numerodejugador==4) {
      ficha1 = new Ficha(4, 70, 550);
      ficha2 = new Ficha(4, 140, 550);
      ficha3 = new Ficha(4, 70, 620);
      ficha4 = new Ficha(4, 140, 620);
    }
  }
  //Dibujamos las 4 fichas del jugador
  void DibujarFichas() {
    ficha1.dibujar(0);
    ficha2.dibujar(0);
    ficha3.dibujar(0);
    ficha4.dibujar(0);
  }
  //Tirar dados
  void TirarDados() {
    Dado1= (int)random(6) +1;
    Dado2= (int)random(6) +1;
    espacios = Dado1 + Dado2;

    //Comprobamos el número de fichas en la carcel y sacamos alguna si se puede
    fichas_enCarcel = 0;
    if (ficha1.ficha_en_carcel == true) {
      fichas_enCarcel ++;
    }
    if (ficha2.ficha_en_carcel == true) {
      fichas_enCarcel ++;
    }
    if (ficha3.ficha_en_carcel == true) {
      fichas_enCarcel ++;
    }
    if (ficha4.ficha_en_carcel == true) {
      fichas_enCarcel ++;
    }

    //Sacamos fichas de la carcel
    if (Dado1 == 5) {
      if (fichas_enCarcel == 4) {
        ficha1.ficha_en_carcel = false;
        tablero[ficha1.casilla_actual][3] = 1;
        fichas_enCarcel --;
        espacios = espacios - 5;
      } else if (fichas_enCarcel == 3) {
        ficha2.ficha_en_carcel = false;
        tablero[ficha2.casilla_actual][3] = 1;
        fichas_enCarcel --;
        espacios = espacios - 5;
      } else if (fichas_enCarcel == 2) {
        ficha3.ficha_en_carcel = false;
        tablero[ficha3.casilla_actual][3] = 1;
        fichas_enCarcel --;
        espacios = espacios - 5;
      } else if (fichas_enCarcel == 1) {
        ficha4.ficha_en_carcel = false;
        tablero[ficha4.casilla_actual][3] = 1;
        fichas_enCarcel --;
        espacios = espacios - 5;
      }
    }
    if (Dado2 == 5) {
      if (fichas_enCarcel == 4) {
        ficha1.ficha_en_carcel = false;
        tablero[ficha1.casilla_actual][3] = 1;
        fichas_enCarcel --;
        espacios = espacios - 5;
      } else if (fichas_enCarcel == 3) {
        ficha2.ficha_en_carcel = false;
        tablero[ficha2.casilla_actual][3] = 1;
        fichas_enCarcel --;
        espacios = espacios - 5;
      } else if (fichas_enCarcel == 2) {
        ficha3.ficha_en_carcel = false;
        tablero[ficha3.casilla_actual][3] = 1;
        fichas_enCarcel --;
        espacios = espacios - 5;
      } else if (fichas_enCarcel == 1) {
        ficha4.ficha_en_carcel = false;
        tablero[ficha4.casilla_actual][3] = 1;
        fichas_enCarcel --;
        espacios = espacios - 5;
      }
    }
    if (espacios == 5) {
      if (fichas_enCarcel == 4) {
        ficha1.ficha_en_carcel = false;
        tablero[ficha1.casilla_actual][3] = 1;
        fichas_enCarcel --;
        espacios = espacios - 5;
      } else if (fichas_enCarcel == 3) {
        ficha2.ficha_en_carcel = false;
        tablero[ficha2.casilla_actual][3] = 1;
        fichas_enCarcel --;
        espacios = espacios - 5;
      } else if (fichas_enCarcel == 2) {
        ficha3.ficha_en_carcel = false;
        tablero[ficha3.casilla_actual][3] = 1;
        fichas_enCarcel --;
        espacios = espacios - 5;
      } else if (fichas_enCarcel == 1) {
        ficha4.ficha_en_carcel = false;
        tablero[ficha4.casilla_actual][3] = 1;
        fichas_enCarcel --;
        espacios = espacios - 5;
      }
    }

    delay(100);


    //Verifica si se puede avanzar de turno
    if (Dado1 == Dado2) {
      pares ++;
      if (pares == 3) {
        Turno ++;
        pares = 0;
      }
    } else {
      pares = 0;
    }

    if (fichas_enCarcel == 4 && pares == 0) {
      Turno ++;
    }
  }
  //Elegir cuanto mover con cada ficha

  void moverFicha(int MouseX, int MouseY) {
    espacios_avanzados = 0;
    //Verificamos la ficha que se esta seleccionando
    if ((MouseX >= (tablero[ficha1.casilla_actual%68][0]-15) && MouseX <= (tablero[ficha1.casilla_actual%68][0]+15)) && (MouseY >= (tablero[ficha1.casilla_actual%68][1]-15) && MouseY <= (tablero[ficha1.casilla_actual%68][1]+15))) {
      ficha_a_mover = 1;
    } else if ((MouseX >= (tablero[ficha2.casilla_actual%68][0]-15) && MouseX <= (tablero[ficha2.casilla_actual%68][0]+15)) && (MouseY >= (tablero[ficha2.casilla_actual%68][1]-15) && MouseY <= (tablero[ficha2.casilla_actual%68][1]+15))) {
      ficha_a_mover = 2;
    } else if ((MouseX >= (tablero[ficha3.casilla_actual%68][0]-15) && MouseX <= (tablero[ficha3.casilla_actual%68][0]+15)) && (MouseY >= (tablero[ficha3.casilla_actual%68][1]-15) && MouseY <= (tablero[ficha3.casilla_actual%68][1]+15))) {
      ficha_a_mover = 3;
    } else if ((MouseX >= (tablero[ficha4.casilla_actual%68][0]-15) && MouseX <= (tablero[ficha4.casilla_actual%68][0]+15)) && (MouseY >= (tablero[ficha4.casilla_actual%68][1]-15) && MouseY <= (tablero[ficha3.casilla_actual%68][1]+15))) {
      ficha_a_mover = 4;
    } 


    if ((MouseX >= 715 && MouseX <= 805) && (MouseY >= 225 && MouseY <= 315)) {
      //Movemos la ficha
      if (ficha_a_mover == 1) {
        ficha1.mover(Dado1);
      } else if (ficha_a_mover == 2) {
        ficha2.mover(Dado1);
      } else if (ficha_a_mover == 3) {
        ficha3.mover(Dado1);
      } else if (ficha_a_mover == 4) {
        ficha4.mover(Dado1);
      };
      espacios = espacios - Dado1;
    } else if ((MouseX >= 835 && MouseX <= 925) && (MouseY >= 225 && MouseY <= 315)) {
      //Movemos la ficha
      if (ficha_a_mover == 1) {
        ficha1.mover(Dado2);
      } else if (ficha_a_mover == 2) {
        ficha2.mover(Dado2);
      } else if (ficha_a_mover == 3) {
        ficha3.mover(Dado2);
      } else if (ficha_a_mover == 4) {
        ficha4.mover(Dado2);
      }
      espacios = espacios - Dado2;
    }

    //verificamos si se puede cambiar de turno
    if (espacios == 0 && pares == 0) {
      Turno++;
    }
  }
}
