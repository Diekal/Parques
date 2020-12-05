class Jugador {
  Ficha ficha1;
  Ficha ficha2;
  Ficha ficha3;
  Ficha ficha4;
  int espacios, fichas_enCarcel, ficha_a_mover, espacios_avanzados, jugador; //Dados //Fichas en la carcel //pares //ficha_a_mover //espacios avanzados por la ficha //jugador
  int x1, x2, x3, x4, y1, y2, y3, y4; 
  boolean bloqueoAdelante;


  Jugador(int numerodejugador) {

    jugador = numerodejugador;

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
    ficha1.dibujar(x1, y1);
    ficha2.dibujar(x2, y2);
    ficha3.dibujar(x3, y3);
    ficha4.dibujar(x4, y4);
    bloqueo();
  }
  //Tirar dados
  void TirarDados() {
    Dado1= (int)random(6) +1;
    Dado2= (int)random(6) +1;
    espacios = Dado1 + Dado2;
    MoverDado1= true;
    MoverDado2= true;
    SacarCarcel();

    //Verifica si se puede avanzar de turno
    if (Dado1 == Dado2) {
      pares ++;
      if (pares == 3) {
        turnoActual=true;
        Turno ++;
        pares = 0;
      }
    } else {
      pares = 0;
    }

    if (fichas_enCarcel == 4 && pares == 0) {
      turnoActual=true;
      Turno ++;
    }
    
    if(espacios==0 && pares==0){
      turnoActual=true;
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
    } else if ((MouseX >= (tablero[ficha4.casilla_actual%68][0]-15) && MouseX <= (tablero[ficha4.casilla_actual%68][0]+15)) && (MouseY >= (tablero[ficha4.casilla_actual%68][1]-15) && MouseY <= (tablero[ficha4.casilla_actual%68][1]+15))) {
      ficha_a_mover = 4;
    } 

    bloqueoAdelante= false;
    if ((MouseX >= 715 && MouseX <= 805) && (MouseY >= 225 && MouseY <= 315) && MoverDado1 == true) {
      //Movemos la ficha si no hay bloqueo
      if (ficha_a_mover == 1) {
        for (int i=0; i<=Dado1 ;i++){
          if (tablero[(ficha1.casilla_actual+i)%68][3]==1){
            bloqueoAdelante=true;
          }
        }
        if (bloqueoAdelante== false){
          ficha1.mover(Dado1); 
          espacios = espacios - Dado1;
          MoverDado1 = false;
        }
        
      } else if (ficha_a_mover == 2) {
        for (int i=0; i<=Dado1 ;i++){
          if (tablero[(ficha2.casilla_actual+i)%68][3]==1){
            bloqueoAdelante=true;
          }
        }
        if (bloqueoAdelante== false){
          ficha2.mover(Dado1);
          espacios = espacios - Dado1;
          MoverDado1 = false;
        }
      } else if (ficha_a_mover == 3) {
        for (int i=0; i<=Dado1 ;i++){
          if (tablero[(ficha3.casilla_actual+i)%68][3]==1){
            bloqueoAdelante=true;
          }
        }
        if (bloqueoAdelante== false){
          ficha3.mover(Dado1);  
          espacios = espacios - Dado1;
          MoverDado1 = false;
        }
      } else if (ficha_a_mover == 4) {
        for (int i=0; i<=Dado1 ;i++){
          if (tablero[(ficha4.casilla_actual+i)%68][3]==1){
            bloqueoAdelante=true;
          }
        }
        if (bloqueoAdelante== false){
          ficha4.mover(Dado1);  
          espacios = espacios - Dado1;
          MoverDado1 = false;
        }
      }
      
    } else if ((MouseX >= 835 && MouseX <= 925) && (MouseY >= 225 && MouseY <= 315)&& MoverDado2 == true) {
      //Movemos la ficha
      if (ficha_a_mover == 1) {
        for (int i=0; i<=Dado2 ;i++){
          if (tablero[(ficha1.casilla_actual+i)%68][3]==1){
            bloqueoAdelante=true;
          }
        }
        if (bloqueoAdelante== false){
          ficha1.mover(Dado2);  
          espacios = espacios - Dado2;
          MoverDado2 = false;
        }
      } else if (ficha_a_mover == 2) {
        for (int i=0; i<=Dado2 ;i++){
          if (tablero[(ficha2.casilla_actual+i)%68][3]==1){
            bloqueoAdelante=true;
          }
        }
        if (bloqueoAdelante== false){
          ficha2.mover(Dado2); 
          espacios = espacios - Dado2;
          MoverDado2 = false;
        }
      } else if (ficha_a_mover == 3) {
        for (int i=0; i<=Dado2 ;i++){
          if (tablero[(ficha3.casilla_actual+i)%68][3]==1){
            bloqueoAdelante=true;
          }
        }
        if (bloqueoAdelante== false){
          ficha3.mover(Dado2); 
          espacios = espacios - Dado2;
          MoverDado2 = false;
        }
      } else if (ficha_a_mover == 4) {
        for (int i=0; i<=Dado2 ;i++){
          if (tablero[(ficha4.casilla_actual+i)%68][3]==1){
            bloqueoAdelante=true;
          }
        }
        if (bloqueoAdelante== false){
          ficha4.mover(Dado2); 
          espacios = espacios - Dado2;
          MoverDado2 = false;
        }
      }
      
    }

    //verificamos si se puede cambiar de turno
    if (espacios == 0 && pares == 0) {
      turnoActual=true;
      Turno++;
    }
  }

  void SacarCarcel(){
    
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

    //Sacamos fichas de la carcel si en la casilla hay menos de 2
    if (tablero[ficha1.casilla_actual%68][4]<2){  
      if (Dado1 == 5) {
        if (fichas_enCarcel == 4) {
          ficha1.ficha_en_carcel = false;
          tablero[ficha1.casilla_actual%68][4] += 1;
          tablero[ficha1.casilla_actual%68][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
        } else if (fichas_enCarcel == 3) {
          ficha2.ficha_en_carcel = false;
          tablero[ficha2.casilla_actual%68][4] += 1;
          tablero[ficha2.casilla_actual%68][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
        } else if (fichas_enCarcel == 2) {
          ficha3.ficha_en_carcel = false;
          tablero[ficha3.casilla_actual%68][4] += 1;
          tablero[ficha3.casilla_actual%68][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
        } else if (fichas_enCarcel == 1) {
          ficha4.ficha_en_carcel = false;
          tablero[ficha4.casilla_actual%68][4] += 1;
          tablero[ficha4.casilla_actual%68][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
        }
      }
      if (Dado2 == 5) {
        if (fichas_enCarcel == 4) {
          ficha1.ficha_en_carcel = false;
          tablero[ficha1.casilla_actual%68][4] += 1;
          tablero[ficha1.casilla_actual%68][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado2= false;
        } else if (fichas_enCarcel == 3) {
          ficha2.ficha_en_carcel = false;
          tablero[ficha2.casilla_actual%68][4] += 1;
          tablero[ficha2.casilla_actual%68][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado2= false;
        } else if (fichas_enCarcel == 2) {
          ficha3.ficha_en_carcel = false;
          tablero[ficha3.casilla_actual%68][4] += 1;
          tablero[ficha3.casilla_actual%68][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado2= false;
        } else if (fichas_enCarcel == 1) {
          ficha4.ficha_en_carcel = false;
          tablero[ficha4.casilla_actual%68][4] += 1;
          tablero[ficha4.casilla_actual%68][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado2= false;
        }
      }
      if (espacios == 5) {
        if (fichas_enCarcel == 4) {
          ficha1.ficha_en_carcel = false;
          tablero[ficha1.casilla_actual%68][4] += 1;
          tablero[ficha1.casilla_actual%68][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
          MoverDado2= false;
        } else if (fichas_enCarcel == 3) {
          ficha2.ficha_en_carcel = false;
          tablero[ficha2.casilla_actual%68][4] += 1;
          tablero[ficha2.casilla_actual%68][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
          MoverDado2= false;
        } else if (fichas_enCarcel == 2) {
          ficha3.ficha_en_carcel = false;
          tablero[ficha3.casilla_actual%68][4] += 1;
          tablero[ficha3.casilla_actual%68][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
          MoverDado2= false;
        } else if (fichas_enCarcel == 1) {
          ficha4.ficha_en_carcel = false;
          tablero[ficha4.casilla_actual%68][4] += 1;
          tablero[ficha4.casilla_actual%68][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
          MoverDado2= false;
        }
      }
    }
  }

  //Bloqueos

  void bloqueo() {
    //comparamos cada una de las fichas del jugador
    if (ficha1.casilla_actual%68 == ficha2.casilla_actual%68 && ficha1.ficha_en_carcel == false && ficha2.ficha_en_carcel == false) {
      tablero[ficha1.casilla_actual%68][3] = 1;

      //Casillas horizontales
      if ((ficha1.casilla_actual%68 <= 2) || (ficha1.casilla_actual%68 >= 22 && ficha1.casilla_actual%68 <= 36) || (ficha1.casilla_actual%68 >= 56)) {
        x1 = tablero[ficha1.casilla_actual%68][0]+20 ;
        y1 = tablero[ficha1.casilla_actual%68][1];
        x2 = tablero[ficha2.casilla_actual%68][0]-20 ;
        y2 = tablero[ficha2.casilla_actual%68][1];
      }

      //Casillas verticales
      else if ((ficha1.casilla_actual%68 >= 5 && ficha1.casilla_actual%68 <= 19)||(ficha1.casilla_actual%68 >= 39 && ficha1.casilla_actual%68 <= 53)) {
        x1 = tablero[ficha1.casilla_actual%68][0];
        y1 = tablero[ficha1.casilla_actual%68][1]+20;
        x2 = tablero[ficha2.casilla_actual%68][0];
        y2 = tablero[ficha2.casilla_actual%68][1]-20;
      }
    } else if (ficha1.casilla_actual%68 == ficha3.casilla_actual%68 && ficha1.ficha_en_carcel == false && ficha3.ficha_en_carcel == false) {
      tablero[ficha1.casilla_actual%68][3] = 1;

      if ((ficha1.casilla_actual%68 <= 2) || (ficha1.casilla_actual%68 >= 22 && ficha1.casilla_actual%68 <= 36) || (ficha1.casilla_actual%68 >= 56)) {
        x1 = tablero[ficha1.casilla_actual%68][0]+20 ;
        y1 = tablero[ficha1.casilla_actual%68][1];
        x3 = tablero[ficha3.casilla_actual%68][0]-20 ;
        y3 = tablero[ficha3.casilla_actual%68][1];
      }

      //Casillas verticales
      else if ((ficha1.casilla_actual%68 >= 5 && ficha1.casilla_actual%68 <= 19)||(ficha1.casilla_actual%68 >= 39 && ficha1.casilla_actual%68 <= 53)) {
        x1 = tablero[ficha1.casilla_actual%68][0];
        y1 = tablero[ficha1.casilla_actual%68][1]+20;
        x3 = tablero[ficha3.casilla_actual%68][0];
        y3 = tablero[ficha3.casilla_actual%68][1]-20;
      }
    } else if (ficha1.casilla_actual%68 == ficha4.casilla_actual%68 && ficha1.ficha_en_carcel == false && ficha4.ficha_en_carcel == false) {
      tablero[ficha1.casilla_actual%68][3] = 1;

      if ((ficha1.casilla_actual%68 <= 2) || (ficha1.casilla_actual%68 >= 22 && ficha1.casilla_actual%68 <= 36) || (ficha1.casilla_actual%68 >= 56)) {
        x1 = tablero[ficha1.casilla_actual%68][0]+20 ;
        y1 = tablero[ficha1.casilla_actual%68][1];
        x4 = tablero[ficha4.casilla_actual%68][0]-20 ;
        y4 = tablero[ficha4.casilla_actual%68][1];
      }

      //Casillas verticales
      else if ((ficha1.casilla_actual%68 >= 5 && ficha1.casilla_actual%68 <= 19)||(ficha1.casilla_actual%68 >= 39 && ficha1.casilla_actual%68 <= 53)) {
        x1 = tablero[ficha1.casilla_actual%68][0];
        y1 = tablero[ficha1.casilla_actual%68][1]+20;
        x4 = tablero[ficha4.casilla_actual%68][0];
        y4 = tablero[ficha4.casilla_actual%68][1]-20;
      }
    } else if (ficha2.casilla_actual%68 == ficha3.casilla_actual%68 && ficha2.ficha_en_carcel == false && ficha3.ficha_en_carcel == false) {
      tablero[ficha2.casilla_actual%68][3] = 1;

      if ((ficha2.casilla_actual%68 <= 2) || (ficha2.casilla_actual%68 >= 22 && ficha2.casilla_actual%68 <= 36) || (ficha2.casilla_actual%68 >= 56)) {
        x2 = tablero[ficha2.casilla_actual%68][0]+20 ;
        y2 = tablero[ficha2.casilla_actual%68][1];
        x3 = tablero[ficha3.casilla_actual%68][0]-20 ;
        y3 = tablero[ficha3.casilla_actual%68][1];
      }

      //Casillas verticales
      else if ((ficha2.casilla_actual%68 >= 5 && ficha2.casilla_actual%68 <= 19)||(ficha2.casilla_actual%68 >= 39 && ficha2.casilla_actual%68 <= 53)) {
        x2 = tablero[ficha2.casilla_actual%68][0];
        y2 = tablero[ficha2.casilla_actual%68][1]+20;
        x3 = tablero[ficha3.casilla_actual%68][0];
        y3 = tablero[ficha3.casilla_actual%68][1]-20;
      }
    } else if (ficha2.casilla_actual%68 == ficha4.casilla_actual%68 && ficha2.ficha_en_carcel == false && ficha4.ficha_en_carcel == false) {
      tablero[ficha2.casilla_actual%68][3] = 1;

      if ((ficha2.casilla_actual%68 <= 2) || (ficha2.casilla_actual%68 >= 22 && ficha2.casilla_actual%68 <= 36) || (ficha2.casilla_actual%68 >= 56)) {
        x2 = tablero[ficha2.casilla_actual%68][0]+20 ;
        y2 = tablero[ficha2.casilla_actual%68][1];
        x4 = tablero[ficha4.casilla_actual%68][0]-20 ;
        y4 = tablero[ficha4.casilla_actual%68][1];
      }

      //Casillas verticales
      else if ((ficha2.casilla_actual%68 >= 5 && ficha2.casilla_actual%68 <= 19)||(ficha2.casilla_actual%68 >= 39 && ficha2.casilla_actual%68 <= 53)) {
        x2 = tablero[ficha2.casilla_actual%68][0];
        y2 = tablero[ficha2.casilla_actual%68][1]+20;
        x4 = tablero[ficha4.casilla_actual%68][0];
        y4 = tablero[ficha4.casilla_actual%68][1]-20;
      }
    } else if (ficha3.casilla_actual%68 == ficha4.casilla_actual%68 && ficha3.ficha_en_carcel == false && ficha4.ficha_en_carcel == false) {
      tablero[ficha3.casilla_actual%68][3] = 1;

      if ((ficha3.casilla_actual%68 <= 2) || (ficha3.casilla_actual%68 >= 22 && ficha3.casilla_actual%68 <= 36) || (ficha3.casilla_actual%68 >= 56)) {
        x3 = tablero[ficha3.casilla_actual%68][0]+20 ;
        y3 = tablero[ficha3.casilla_actual%68][1];
        x4 = tablero[ficha4.casilla_actual%68][0]-20 ;
        y4 = tablero[ficha4.casilla_actual%68][1];
      }

      //Casillas verticales
      else if ((ficha3.casilla_actual%68 >= 5 && ficha3.casilla_actual%68 <= 19)||(ficha3.casilla_actual%68 >= 39 && ficha3.casilla_actual%68 <= 53)) {
        x3 = tablero[ficha3.casilla_actual%68][0];
        y3 = tablero[ficha3.casilla_actual%68][1]+20;
        x4 = tablero[ficha4.casilla_actual%68][0];
        y4 = tablero[ficha4.casilla_actual%68][1]-20;
      }
    } else {
      tablero[ficha1.casilla_actual%68][3] = 0;
      tablero[ficha2.casilla_actual%68][3] = 0;
      tablero[ficha3.casilla_actual%68][3] = 0;
      tablero[ficha4.casilla_actual%68][3] = 0;
      x1 = 0;
      x2 = 0;
      x3 = 0;
      x4 = 0;
      y1 = 0;
      y2 = 0;
      y3 = 0;
      y4 = 0;
    }
  }
}
