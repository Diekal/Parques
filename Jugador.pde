class Jugador {
  Ficha ficha1;
  Ficha ficha2;
  Ficha ficha3;
  Ficha ficha4;
  int espacios, fichas_enCarcel, ficha_a_mover, espacios_avanzados, jugador, entrada; //Dados //Fichas en la carcel //pares //ficha_a_mover //espacios avanzados por la ficha //jugador
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
      entrada = 0;
    } else if (numerodejugador==2) {
      ficha1 = new Ficha(2, 550, 70);
      ficha2 = new Ficha(2, 620, 70);
      ficha3 = new Ficha(2, 550, 140);
      ficha4 = new Ficha(2, 620, 140);
      entrada = 17;
    } else if (numerodejugador==3) {
      ficha1 = new Ficha(3, 70, 70);
      ficha2 = new Ficha(3, 140, 70);
      ficha3 = new Ficha(3, 70, 140);
      ficha4 = new Ficha(3, 140, 140);
      entrada = 34;
    } else if (numerodejugador==4) {
      ficha1 = new Ficha(4, 70, 550);
      ficha2 = new Ficha(4, 140, 550);
      ficha3 = new Ficha(4, 70, 620);
      ficha4 = new Ficha(4, 140, 620);
      entrada = 51;
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

    if (espacios==0 && pares==0) {
      turnoActual=true;
      Turno ++;
    }
  }
  //Elegir cuanto mover con cada ficha

  void moverFicha(int MouseX, int MouseY) {
    espacios_avanzados = 0;
    //Verificamos la ficha que se esta seleccionando 
    if ((MouseX >= (tablero[ficha1.casilla_actual%68][0]-15) && MouseX <= (tablero[ficha1.casilla_actual%68][0]+15)) && (MouseY >= (tablero[ficha1.casilla_actual%68][1]-15) && MouseY <= (tablero[ficha1.casilla_actual%68][1]+15)) && ficha1.entrada == false) {
      ficha_a_mover = 1;
    } else if ((MouseX >= (tablero[ficha2.casilla_actual%68][0]-15) && MouseX <= (tablero[ficha2.casilla_actual%68][0]+15)) && (MouseY >= (tablero[ficha2.casilla_actual%68][1]-15) && MouseY <= (tablero[ficha2.casilla_actual%68][1]+15)) && ficha2.entrada == false) {
      ficha_a_mover = 2;
    } else if ((MouseX >= (tablero[ficha3.casilla_actual%68][0]-15) && MouseX <= (tablero[ficha3.casilla_actual%68][0]+15)) && (MouseY >= (tablero[ficha3.casilla_actual%68][1]-15) && MouseY <= (tablero[ficha3.casilla_actual%68][1]+15)) && ficha3.entrada == false) {
      ficha_a_mover = 3;
    } else if ((MouseX >= (tablero[ficha4.casilla_actual%68][0]-15) && MouseX <= (tablero[ficha4.casilla_actual%68][0]+15)) && (MouseY >= (tablero[ficha4.casilla_actual%68][1]-15) && MouseY <= (tablero[ficha4.casilla_actual%68][1]+15)) && ficha4.entrada == false) {
      ficha_a_mover = 4;
    } else if (jugador == 1) {
      if (ficha1.entrada == true) {
        if (MouseX >= 330 && MouseX<= 360 && MouseY >= (420+(ficha1.casillas_coronar*30)) && MouseY <= (450+(ficha1.casillas_coronar*30))) {
          ficha_a_mover = 1;
        }
      }
      if (ficha2.entrada == true) {
        if (MouseX >= 330 && MouseX<= 360 && MouseY >= (420+(ficha2.casillas_coronar*30)) && MouseY <= (450+(ficha2.casillas_coronar*30))) {
          ficha_a_mover = 2;
        }
      }
      if (ficha3.entrada == true) {
        if (MouseX >= 330 && MouseX<= 360 && MouseY >= (420+(ficha3.casillas_coronar*30)) && MouseY <= (450+(ficha3.casillas_coronar*30))) {
          ficha_a_mover = 3;
        }
      }
      if (ficha4.entrada == true) {
        if (MouseX >= 330 && MouseX<= 360 && MouseY >= (420+(ficha4.casillas_coronar*30)) && MouseY <= (450+(ficha4.casillas_coronar*30))) {
          ficha_a_mover = 4;
        }
      }
    } else if (jugador == 2) {
      if (ficha1.entrada == true) {
        if (MouseX >= (420+(ficha1.casillas_coronar*30)) && MouseX <= (450+(ficha1.casillas_coronar*30)) && MouseY >= 330 && MouseY<= 360) {
          ficha_a_mover = 1;
        }
      }
      if (ficha2.entrada == true) {
        if (MouseX >= (420+(ficha2.casillas_coronar*30)) && MouseX <= (450+(ficha2.casillas_coronar*30)) && MouseY >= 330 && MouseY<= 360) {
          ficha_a_mover = 2;
        }
      }
      if (ficha3.entrada == true) {
        if (MouseX >= (420+(ficha3.casillas_coronar*30)) && MouseX <= (450+(ficha3.casillas_coronar*30)) && MouseY >= 330 && MouseY<= 360) {
          ficha_a_mover = 3;
        }
      }
      if (ficha4.entrada == true) {
        if (MouseX >= (420+(ficha4.casillas_coronar*30)) && MouseX <= (450+(ficha4.casillas_coronar*30)) && MouseY >= 330 && MouseY<= 360) {
          ficha_a_mover = 4;
        }
      }
    } else if (jugador == 3) {
      if (ficha1.entrada == true) {
        if (MouseX >= 330 && MouseX<= 360 && MouseY >= (210+(ficha1.casillas_coronar*30)) && MouseY <= (240+(ficha1.casillas_coronar*30))) {
          ficha_a_mover = 1;
        }
      }
      if (ficha2.entrada == true) {
        if (MouseX >= 330 && MouseX<= 360 && MouseY >= (210+(ficha2.casillas_coronar*30)) && MouseY <= (240+(ficha2.casillas_coronar*30))) {
          ficha_a_mover = 2;
        }
      }
      if (ficha3.entrada == true) {
        if (MouseX >= 330 && MouseX<= 360 && MouseY >= (210+(ficha3.casillas_coronar*30)) && MouseY <= (240+(ficha3.casillas_coronar*30))) {
          ficha_a_mover = 3;
        }
      }
      if (ficha4.entrada == true) {
        if (MouseX >= 330 && MouseX<= 360 && MouseY >= (210+(ficha4.casillas_coronar*30)) && MouseY <= (240+(ficha4.casillas_coronar*30))) {
          ficha_a_mover = 4;
        }
      }
    } else if (jugador == 4) {
      if (ficha1.entrada == true) {
        if (MouseX >= (210+(ficha1.casillas_coronar*30)) && MouseX <= (240+(ficha1.casillas_coronar*30)) && MouseY >= 330 && MouseY<= 360) {
          ficha_a_mover = 1;
        }
      }
      if (ficha2.entrada == true) {
        if (MouseX >= (210+(ficha2.casillas_coronar*30)) && MouseX <= (240+(ficha2.casillas_coronar*30)) && MouseY >= 330 && MouseY<= 360) {
          ficha_a_mover = 2;
        }
      }
      if (ficha3.entrada == true) {
        if (MouseX >= (210+(ficha3.casillas_coronar*30)) && MouseX <= (240+(ficha3.casillas_coronar*30)) && MouseY >= 330 && MouseY<= 360) {
          ficha_a_mover = 3;
        }
      }
      if (ficha4.entrada == true) {
        if (MouseX >= (210+(ficha4.casillas_coronar*30)) && MouseX <= (240+(ficha4.casillas_coronar*30)) && MouseY >= 330 && MouseY<= 360) {
          ficha_a_mover = 4;
        }
      }
    }

    bloqueoAdelante= false;
    if ((MouseX >= 715 && MouseX <= 822) && (MouseY >= 55 && MouseY <= 145) && MoverDado1 == true) {
      //Movemos la ficha si no hay bloqueo
      if (ficha_a_mover == 1) {
        for (int i=1; i<=Dado1; i++) {
          if (tablero[(ficha1.casilla_actual+i)%68][3]==1) {
            bloqueoAdelante=true;
          }
        }

        if (ficha1.entrada == false) {
          if (bloqueoAdelante== false && (ficha1.casillas_avanzadas+Dado1)<63) {
            comer(ficha1, Dado1);
            ficha1.mover(Dado1);
            espacios = espacios - Dado1;
            MoverDado1 = false;
            ficha1.entrada = false;
          } else if ((ficha1.casillas_avanzadas+Dado1)>=63) {
            tablero[ficha1.casilla_actual%68][4] -= 1;
            ficha1.entrar(Dado1-(63-ficha1.casillas_avanzadas));
            if (ficha1.movida) {
              if (ficha1.ficha_coronada) {
                if (jugador == 1) {
                  x1 = 345;
                  y1 = 375;
                } else if (jugador == 2) {
                  x1 = 375;
                  y1 = 345;
                } else if (jugador == 3) {
                  x1 = 345;
                  y1 = 315;
                } else if (jugador == 4) {
                  x1 = 315;
                  y1 = 345;
                }
              } else {
                if (jugador == 1) {
                  x1 = 345;
                  y1 = 435+(ficha1.casillas_coronar*30);
                } else if (jugador == 2) {
                  x1 = 435+(ficha1.casillas_coronar*30);
                  y1 = 345;
                } else if (jugador == 3) {
                  x1 = 345;
                  y1 = 225-(ficha1.casillas_coronar*30);
                } else if (jugador == 4) {
                  x1 = 225-(ficha1.casillas_coronar*30);
                  y1 = 345;
                }
              }
              espacios -= Dado1;
              MoverDado1 = false;
            }
            ficha1.entrada = true;
          }
        } else if (ficha1.entrada == true) {
          ficha1.entrar(Dado1);
          if (ficha1.movida) {
            if (ficha1.ficha_coronada) {
              if (jugador == 1) {
                x1 = 345;
                y1 = 375;
              } else if (jugador == 2) {
                x1 = 375;
                y1 = 345;
              } else if (jugador == 3) {
                x1 = 345;
                y1 = 315;
              } else if (jugador == 4) {
                x1 = 315;
                y1 = 345;
              }
            } else {
              if (jugador == 1) {
                x1 = 345;
                y1 = 435+(ficha1.casillas_coronar*30);
              } else if (jugador == 2) {
                x1 = 435+(ficha1.casillas_coronar*30);
                y1 = 345;
              } else if (jugador == 3) {
                x1 = 345;
                y1 = 225-(ficha1.casillas_coronar*30);
              } else if (jugador == 4) {
                x1 = 225-(ficha1.casillas_coronar*30);
                y1 = 345;
              }
            }
            espacios-=Dado1;
            MoverDado1 = false;
          }
        }
      } else if (ficha_a_mover == 2) {
        for (int i=1; i<=Dado1; i++) {
          if (tablero[(ficha2.casilla_actual+i)%68][3]==1) {
            bloqueoAdelante=true;
          }
        }
        if (ficha2.entrada == false) {
          if (bloqueoAdelante== false && (ficha2.casillas_avanzadas+Dado1)<63) {
            comer(ficha2, Dado1);
            ficha2.mover(Dado1);
            espacios = espacios - Dado1;
            MoverDado1 = false;
            ficha2.entrada = false;
          } else if ((ficha2.casillas_avanzadas+Dado1)>=63) {
            tablero[ficha2.casilla_actual%68][4] -= 1;
            ficha2.entrar(Dado1-(63-ficha2.casillas_avanzadas));
            if (ficha2.movida) {
              if (ficha2.ficha_coronada) {
                if (jugador == 1) {
                  x2 = 285;
                  y2 = 420;
                } else if (jugador == 2) {
                  x2 = 420;
                  y2 = 405;
                } else if (jugador == 3) {
                  x2 = 285;
                  y2 = 270;
                } else if (jugador == 4) {
                  x2 = 270;
                  y2 = 285;
                }
              } else {
                if (jugador == 1) {
                  x2 = 345;
                  y2 = 435+(ficha2.casillas_coronar*30);
                } else if (jugador == 2) {
                  x2 = 435+(ficha2.casillas_coronar*30);
                  y2 = 345;
                } else if (jugador == 3) {
                  x2 = 345;
                  y2 = 225-(ficha2.casillas_coronar*30);
                } else if (jugador == 4) {
                  x2 = 225-(ficha2.casillas_coronar*30);
                  y2 = 345;
                }
              }
              espacios -= Dado1;
              MoverDado1 = false;
            }
            ficha2.entrada = true;
          }
        } else if (ficha2.entrada == true) {
          ficha2.entrar(Dado1);
          if (ficha2.movida) {
            if (ficha2.ficha_coronada) {
              if (jugador == 1) {
                x2 = 285;
                y2 = 420;
              } else if (jugador == 2) {
                x2 = 420;
                y2 = 405;
              } else if (jugador == 3) {
                x2 = 285;
                y2 = 270;
              } else if (jugador == 4) {
                x2 = 270;
                y2 = 285;
              }
            } else {
              if (jugador == 1) {
                x2 = 345;
                y2 = 435+(ficha2.casillas_coronar*30);
              } else if (jugador == 2) {
                x2 = 435+(ficha2.casillas_coronar*30);
                y2 = 345;
              } else if (jugador == 3) {
                x2 = 345;
                y2 = 225-(ficha2.casillas_coronar*30);
              } else if (jugador == 4) {
                x2 = 225-(ficha2.casillas_coronar*30);
                y2 = 345;
              }
            }
            espacios-=Dado1;
            MoverDado1 = false;
          }
        }
      } else if (ficha_a_mover == 3) {
        for (int i=1; i<=Dado1; i++) {
          if (tablero[(ficha3.casilla_actual+i)%68][3]==1) {
            bloqueoAdelante=true;
          }
        }
        if (ficha3.entrada == false) {
          if (bloqueoAdelante== false && (ficha3.casillas_avanzadas+Dado1)<63) {
            comer(ficha3, Dado1);
            ficha3.mover(Dado1);
            espacios = espacios - Dado1;
            MoverDado1 = false;
            ficha3.entrada = false;
          } else if ((ficha3.casillas_avanzadas+Dado1)>=63) {
            
            tablero[ficha3.casilla_actual%68][4] -= 1;
            ficha3.entrar(Dado1-(63-ficha3.casillas_avanzadas));
            if (ficha3.movida) {
              if (ficha3.ficha_coronada) {
                if (jugador == 1) {
                  x3 = 345;
                  y3 = 420;
                } else if (jugador == 2) {
                  x3 = 420;
                  y3 = 345;
                } else if (jugador == 3) {
                  x3 = 345;
                  y3 = 270;
                } else if (jugador == 4) {
                  x3 = 270;
                  y3 = 345;
                }
              } else {
                if (jugador == 1) {
                  x3 = 345;
                  y3 = 435+(ficha3.casillas_coronar*30);
                } else if (jugador == 2) {
                  x3 = 435+(ficha3.casillas_coronar*30);
                  y3 = 345;
                } else if (jugador == 3) {
                  x3 = 345;
                  y3 = 225-(ficha3.casillas_coronar*30);
                } else if (jugador == 4) {
                  x3 = 225-(ficha3.casillas_coronar*30);
                  y3 = 345;
                }
              }
              espacios -= Dado1;
              MoverDado1 = false;
            }
            ficha3.entrada = true;
          }
        } else if (ficha3.entrada == true) {
          ficha3.entrar(Dado1);
          if (ficha3.movida) {
            if (ficha3.ficha_coronada) {
              if (jugador == 1) {
                x3 = 345;
                y3 = 420;
              } else if (jugador == 2) {
                x3 = 420;
                y3 = 345;
              } else if (jugador == 3) {
                x3 = 345;
                y3 = 270;
              } else if (jugador == 4) {
                x3 = 270;
                y3 = 345;
              }
            } else {
              if (jugador == 1) {
                x3 = 345;
                y3 = 435+(ficha3.casillas_coronar*30);
              } else if (jugador == 2) {
                x3 = 435+(ficha3.casillas_coronar*30);
                y3 = 345;
              } else if (jugador == 3) {
                x3 = 345;
                y3 = 225-(ficha3.casillas_coronar*30);
              } else if (jugador == 4) {
                x3 = 225-(ficha3.casillas_coronar*30);
                y3 = 345;
              }
            }
            espacios -= Dado1;
            MoverDado1 = false;
          }
        }
      } else if (ficha_a_mover == 4) {
        for (int i=1; i<=Dado1; i++) {
          if (tablero[(ficha4.casilla_actual+i)%68][3]==1) {
            bloqueoAdelante=true;
          }
        }
        if (ficha4.entrada == false) {
          if (bloqueoAdelante== false && (ficha4.casillas_avanzadas+Dado1)<63) {
            comer(ficha4, Dado1);
            ficha4.mover(Dado1);
            espacios = espacios - Dado1;
            MoverDado1 = false;
            ficha4.entrada = false;
          } else if ((ficha4.casillas_avanzadas+Dado1)>=63) {
            
            tablero[ficha4.casilla_actual%68][4] -= 1;
            ficha4.entrar(Dado1-(63-ficha4.casillas_avanzadas));
            if (ficha4.movida) {
              if (ficha4.ficha_coronada) {
                if (jugador == 1) {
                  x4 = 405;
                  y4 = 420;
                } else if (jugador == 2) {
                  x4 = 420;
                  y4 = 285;
                } else if (jugador == 3) {
                  x4 = 405;
                  y4 = 270;
                } else if (jugador == 4) {
                  x4 = 270;
                  y4 = 405;
                }
              } else {
                if (jugador == 1) {
                  x4 = 345;
                  y4 = 435+(ficha4.casillas_coronar*30);
                } else if (jugador == 2) {
                  x4 = 435+(ficha4.casillas_coronar*30);
                  y4 = 345;
                } else if (jugador == 3) {
                  x4 = 345;
                  y4 = 225-(ficha4.casillas_coronar*30);
                } else if (jugador == 4) {
                  x4 = 225-(ficha4.casillas_coronar*30);
                  y4 = 345;
                }
              }
              espacios -= Dado1;
              MoverDado1 = false;
            }
            ficha4.entrada = true;
          }
        } else if (ficha4.entrada == true) {
          ficha4.entrar(Dado1);
          if (ficha4.movida) {
            if (ficha4.ficha_coronada) {
              if (jugador == 1) {
                x4 = 405;
                y4 = 420;
              } else if (jugador == 2) {
                x4 = 420;
                y4 = 285;
              } else if (jugador == 3) {
                x4 = 405;
                y4 = 270;
              } else if (jugador == 4) {
                x4 = 270;
                y4 = 405;
              }
            } else {
              if (jugador == 1) {
                x4 = 345;
                y4 = 435+(ficha4.casillas_coronar*30);
              } else if (jugador == 2) {
                x4 = 435+(ficha4.casillas_coronar*30);
                y4 = 345;
              } else if (jugador == 3) {
                x4 = 345;
                y4 = 225-(ficha4.casillas_coronar*30);
              } else if (jugador == 4) {
                x4 = 225-(ficha4.casillas_coronar*30);
                y4 = 345;
              }
            }
            espacios -= Dado1;
            MoverDado1 = false;
          }
        }
      }
    } else if ((MouseX >= 857 && MouseX <= 947) && (MouseY >= 55 && MouseY <= 145)&& MoverDado2 == true) {
      //Movemos la ficha
      if (ficha_a_mover == 1) {
        for (int i=1; i<=Dado2; i++) {
          if (tablero[(ficha1.casilla_actual+i)%68][3]==1) {
            bloqueoAdelante=true;
          }
        }
        if (ficha1.entrada == false) {
          if (bloqueoAdelante== false && (ficha1.casillas_avanzadas+Dado2)<63) {
            comer(ficha1, Dado2);
            ficha1.mover(Dado2);
            espacios = espacios - Dado2;
            MoverDado2 = false;
            ficha1.entrada = false;
          } else if ((ficha1.casillas_avanzadas+Dado2)>=63) {
            
            tablero[ficha1.casilla_actual%68][4] -= 1;
            ficha1.entrar(Dado2-(63-ficha1.casillas_avanzadas));
            espacios -= Dado2;
            MoverDado2 = false;
          }
        } else if (ficha1.entrada == true) {
          ficha1.entrar(Dado2);
          if (ficha1.movida) {
            if (ficha1.ficha_coronada) {
              if (jugador == 1) {
                x1 = 345;
                y1 = 375;
              } else if (jugador == 2) {
                x1 = 375;
                y1 = 345;
              } else if (jugador == 3) {
                x1 = 345;
                y1 = 315;
              } else if (jugador == 4) {
                x1 = 315;
                y1 = 345;
              }
            } else {
              if (jugador == 1) {
                x1 = 345;
                y1 = 435+(ficha1.casillas_coronar*30);
              } else if (jugador == 2) {
                x1 = 435+(ficha1.casillas_coronar*30);
                y1 = 345;
              } else if (jugador == 3) {
                x1 = 345;
                y1 = 225-(ficha1.casillas_coronar*30);
              } else if (jugador == 4) {
                x1 = 225-(ficha1.casillas_coronar*30);
                y1 = 345;
              }
            }
            espacios-=Dado2;
            MoverDado2 = false;
          }
          ficha1.entrada = true;
        } else if (ficha1.entrada == true) {
          ficha1.entrar(Dado2);
          if (ficha1.movida) {
            if (ficha1.ficha_coronada) {
              if (jugador == 1) {
                x1 = 345;
                y1 = 375;
              } else if (jugador == 2) {
                x1 = 375;
                y1 = 345;
              } else if (jugador == 3) {
                x1 = 345;
                y1 = 315;
              } else if (jugador == 4) {
                x1 = 315;
                y1 = 345;
              }
            } else {
              if (jugador == 1) {
                x1 = 345;
                y1 = 435+(ficha1.casillas_coronar*30);
              } else if (jugador == 2) {
                x1 = 435+(ficha1.casillas_coronar*30);
                y1 = 345;
              } else if (jugador == 3) {
                x1 = 345;
                y1 = 225-(ficha1.casillas_coronar*30);
              } else if (jugador == 4) {
                x1 = 225-(ficha1.casillas_coronar*30);
                y1 = 345;
              }
            }
            espacios-=Dado1;
            MoverDado2 = false;
          }
        }
      } else if (ficha_a_mover == 2) {
        for (int i=1; i<=Dado2; i++) {
          if (tablero[(ficha2.casilla_actual+i)%68][3]==1) {
            bloqueoAdelante=true;
          }
        }
        if (ficha2.entrada == false) {
          if (bloqueoAdelante== false && (ficha2.casillas_avanzadas+Dado2)<63) {
            comer(ficha2, Dado2);
            ficha2.mover(Dado2);
            espacios = espacios - Dado2;
            MoverDado2 = false;
            ficha2.entrada = false;
          } else if ((ficha2.casillas_avanzadas+Dado2)>=63) {
            
            tablero[ficha2.casilla_actual%68][4] -= 1;
            ficha2.entrar(Dado2-(63-ficha2.casillas_avanzadas));
            if (ficha2.movida) {
              if (ficha2.ficha_coronada) {
                if (jugador == 1) {
                  x2 = 285;
                  y2 = 420;
                } else if (jugador == 2) {
                  x2 = 420;
                  y2 = 405;
                } else if (jugador == 3) {
                  x2 = 285;
                  y2 = 270;
                } else if (jugador == 4) {
                  x2 = 270;
                  y2 = 285;
                }
              } else {
                if (jugador == 1) {
                  x2 = 345;
                  y2 = 435+(ficha2.casillas_coronar*30);
                } else if (jugador == 2) {
                  x2 = 435+(ficha2.casillas_coronar*30);
                  y2 = 345;
                } else if (jugador == 3) {
                  x2 = 345;
                  y2 = 225-(ficha2.casillas_coronar*30);
                } else if (jugador == 4) {
                  x2 = 225-(ficha2.casillas_coronar*30);
                  y2 = 345;
                }
              }
              espacios -= Dado2;
              MoverDado2 = false;
            }
            ficha2.entrada = true;
          }
        } else if (ficha2.entrada == true) {
          ficha2.entrar(Dado2);
          if (ficha2.movida) {
            if (ficha2.ficha_coronada) {
              if (jugador == 1) {
                x2 = 285;
                y2 = 420;
              } else if (jugador == 2) {
                x2 = 420;
                y2 = 405;
              } else if (jugador == 3) {
                x2 = 285;
                y2 = 270;
              } else if (jugador == 4) {
                x2 = 270;
                y2 = 285;
              }
            } else {
              if (jugador == 1) {
                x2 = 345;
                y2 = 435+(ficha2.casillas_coronar*30);
              } else if (jugador == 2) {
                x2 = 435+(ficha2.casillas_coronar*30);
                y2 = 345;
              } else if (jugador == 3) {
                x2 = 345;
                y2 = 225-(ficha2.casillas_coronar*30);
              } else if (jugador == 4) {
                x2 = 225-(ficha2.casillas_coronar*30);
                y2 = 345;
              }
            }
            espacios-=Dado2;
            MoverDado2 = false;
          }
        }
      } else if (ficha_a_mover == 3) {
        for (int i=1; i<=Dado2; i++) {
          if (tablero[(ficha3.casilla_actual+i)%68][3]==1) {
            bloqueoAdelante=true;
          }
        }
        if (ficha3.entrada == false) {
          if (bloqueoAdelante== false && (ficha3.casillas_avanzadas+Dado2)<63) {
            comer(ficha3, Dado2);
            ficha3.mover(Dado2);
            espacios = espacios - Dado2;
            MoverDado2 = false;
            ficha3.entrada = false;
          } else if ((ficha3.casillas_avanzadas+Dado2)>=63) {
            
            tablero[ficha3.casilla_actual%68][4] -= 1;
            ficha3.entrar(Dado2-(63-ficha3.casillas_avanzadas));
            if (ficha3.movida) {
              if (ficha3.ficha_coronada) {
                if (jugador == 1) {
                  x3 = 345;
                  y3 = 420;
                } else if (jugador == 2) {
                  x3 = 420;
                  y3 = 345;
                } else if (jugador == 3) {
                  x3 = 345;
                  y3 = 270;
                } else if (jugador == 4) {
                  x3 = 270;
                  y3 = 345;
                }
              } else {
                if (jugador == 1) {
                  x3 = 345;
                  y3 = 435+(ficha3.casillas_coronar*30);
                } else if (jugador == 2) {
                  x3 = 435+(ficha3.casillas_coronar*30);
                  y3 = 345;
                } else if (jugador == 3) {
                  x3 = 345;
                  y3 = 225-(ficha3.casillas_coronar*30);
                } else if (jugador == 4) {
                  x3 = 225-(ficha3.casillas_coronar*30);
                  y3 = 345;
                }
              }
              espacios -= Dado2;
              MoverDado2 = false;
            }
            ficha3.entrada = true;
          }
        } else if (ficha3.entrada == true) {
          ficha3.entrar(Dado2);
          if (ficha3.movida) {
            if (ficha3.ficha_coronada) {
              if (jugador == 1) {
                x3 = 345;
                y3 = 420;
              } else if (jugador == 2) {
                x3 = 420;
                y3 = 345;
              } else if (jugador == 3) {
                x3 = 345;
                y3 = 270;
              } else if (jugador == 4) {
                x3 = 270;
                y3 = 345;
              }
            } else {
              if (jugador == 1) {
                x3 = 345;
                y3 = 435+(ficha3.casillas_coronar*30);
              } else if (jugador == 2) {
                x3 = 435+(ficha3.casillas_coronar*30);
                y3 = 345;
              } else if (jugador == 3) {
                x3 = 345;
                y3 = 225-(ficha3.casillas_coronar*30);
              } else if (jugador == 4) {
                x3 = 225-(ficha3.casillas_coronar*30);
                y3 = 345;
              }
            }
            espacios -= Dado2;
            MoverDado2 = false;
          }
        }
      }
    } else if (ficha_a_mover == 4) {
      for (int i=1; i<=Dado2; i++) {
        if (tablero[(ficha4.casilla_actual+i)%68][3]==1) {
          bloqueoAdelante=true;
        }
      }
      if (ficha4.entrada == false) {
        if (bloqueoAdelante== false && (ficha4.casillas_avanzadas+Dado2)<63) {
          comer(ficha4, Dado2);
          ficha4.mover(Dado2);
          espacios = espacios - Dado2;
          MoverDado2 = false;
          ficha4.entrada = false;
        } else if ((ficha4.casillas_avanzadas+Dado2)>=63) {
          
          tablero[ficha4.casilla_actual%68][4] -= 1;
          ficha4.entrar(Dado2-(63-ficha4.casillas_avanzadas));
          if (ficha4.movida) {
            if (ficha4.ficha_coronada) {
              if (jugador == 1) {
                x4 = 405;
                y4 = 420;
              } else if (jugador == 2) {
                x4 = 420;
                y4 = 285;
              } else if (jugador == 3) {
                x4 = 405;
                y4 = 270;
              } else if (jugador == 4) {
                x4 = 270;
                y4 = 405;
              }
            } else {
              if (jugador == 1) {
                x4 = 345;
                y4 = 435+(ficha4.casillas_coronar*30);
              } else if (jugador == 2) {
                x4 = 435+(ficha4.casillas_coronar*30);
                y4 = 345;
              } else if (jugador == 3) {
                x4 = 345;
                y4 = 225-(ficha4.casillas_coronar*30);
              } else if (jugador == 4) {
                x4 = 225-(ficha4.casillas_coronar*30);
                y4 = 345;
              }
            }
            espacios -= Dado2;
            MoverDado2 = false;
          }
          ficha4.entrada = true;
        }
      } else if (ficha4.entrada == true) {
        ficha4.entrar(Dado2);
        if (ficha4.movida) {
          if (ficha4.ficha_coronada) {
            if (jugador == 1) {
              x4 = 405;
              y4 = 420;
            } else if (jugador == 2) {
              x4 = 420;
              y4 = 285;
            } else if (jugador == 3) {
              x4 = 405;
              y4 = 270;
            } else if (jugador == 4) {
              x4 = 270;
              y4 = 405;
            }
          } else {
            if (jugador == 1) {
              x4 = 345;
              y4 = 435+(ficha4.casillas_coronar*30);
            } else if (jugador == 2) {
              x4 = 435+(ficha4.casillas_coronar*30);
              y4 = 345;
            } else if (jugador == 3) {
              x4 = 345;
              y4 = 225-(ficha4.casillas_coronar*30);
            } else if (jugador == 4) {
              x4 = 225-(ficha4.casillas_coronar*30);
              y4 = 345;
            }
          }
          espacios -= Dado2;
          MoverDado2 = false;
        }
      }
    }
    
    else if ((MouseX >= 731 && MouseX <= 947) && (MouseY >= 175 && MouseY <= 260)&& avanzarComer == true) {
      //Movemos la ficha
      if (ficha_a_mover == 1) {
        for (int i=1; i<=20; i++) {
          if (tablero[(ficha1.casilla_actual+i)%68][3]==1) {
            bloqueoAdelante=true;
          }
        }
        if (bloqueoAdelante== false) { 
          comer(ficha1, 20);
          ficha1.mover(20);  
          avanzarComer=false;
        }
      } else if (ficha_a_mover == 2) {
        for (int i=1; i<=20; i++) {
          if (tablero[(ficha2.casilla_actual+i)%68][3]==1) {
            bloqueoAdelante=true;
          }
        }
        if (bloqueoAdelante== false) {
          comer(ficha2, 20);
          ficha2.mover(20);  
          avanzarComer=false;
        }
      } else if (ficha_a_mover == 3) {
        for (int i=1; i<=20; i++) {
          if (tablero[(ficha3.casilla_actual+i)%68][3]==1) {
            bloqueoAdelante=true;
          }
        }
        if (bloqueoAdelante== false) {
          comer(ficha3, 20);
          ficha3.mover(20);  
          avanzarComer=false;
        }
      } else if (ficha_a_mover == 4) {
        for (int i=1; i<=20; i++) {
          if (tablero[(ficha4.casilla_actual+i)%68][3]==1) {
            bloqueoAdelante=true;
          }
        }
        if (bloqueoAdelante== false) {
          comer(ficha4, 20); 
          ficha4.mover(20); 
          avanzarComer=false;
        }
      }
    } if ((MouseX >= 780 && MouseX <= 880) && (MouseY >= 590 && MouseY <= 650)){
      Turno++;
    }


    //verificamos si se puede cambiar de turno
    if (espacios == 0 && pares == 0) {
      turnoActual=true;
      Turno++;
    }
  }


  void SacarCarcel() {

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

    //Sacamos fichas de la carcel si en la entrada hay menos de 2
    if (tablero[entrada][4]<2) {  
      if (Dado1 == 5) {
        if (ficha1.ficha_en_carcel == true) {
          ficha1.ficha_en_carcel = false;
          tablero[entrada][4] += 1;
          tablero[entrada][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
        } else if (ficha2.ficha_en_carcel == true) {
          ficha2.ficha_en_carcel = false;
          tablero[entrada][4] += 1;
          tablero[entrada][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
        } else if (ficha3.ficha_en_carcel == true) {
          ficha3.ficha_en_carcel = false;
          tablero[entrada][4] += 1;
          tablero[entrada][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
        } else if (ficha4.ficha_en_carcel == true) {
          ficha4.ficha_en_carcel = false;
          tablero[entrada][4] += 1;
          tablero[entrada][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
        }
      }
      if (Dado2 == 5) {
        if (ficha1.ficha_en_carcel == true) {
          ficha1.ficha_en_carcel = false;
          tablero[entrada][4] += 1;
          tablero[entrada][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado2= false;
        } else if (ficha2.ficha_en_carcel == true) {
          ficha2.ficha_en_carcel = false;
          tablero[entrada][4] += 1;
          tablero[entrada][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado2= false;
        } else if (ficha3.ficha_en_carcel == true) {
          ficha3.ficha_en_carcel = false;
          tablero[entrada][4] += 1;
          tablero[entrada][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado2= false;
        } else if (ficha4.ficha_en_carcel == true) {
          ficha4.ficha_en_carcel = false;
          tablero[ficha4.casilla_actual%68][4] += 1;
          tablero[ficha4.casilla_actual%68][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado2= false;
        }
      }
      if (espacios == 5) {
        if (ficha1.ficha_en_carcel == true) {
          ficha1.ficha_en_carcel = false;
          tablero[entrada][4] += 1;
          tablero[entrada][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
          MoverDado2= false;
        } else if (ficha2.ficha_en_carcel == true) {
          ficha2.ficha_en_carcel = false;
          tablero[entrada][4] += 1;
          tablero[entrada][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
          MoverDado2= false;
        } else if (ficha3.ficha_en_carcel == true) {
          ficha3.ficha_en_carcel = false;
          tablero[entrada][4] += 1;
          tablero[entrada][5] += jugador;
          fichas_enCarcel --;
          espacios = espacios - 5;
          MoverDado1= false;
          MoverDado2= false;
        } else if (ficha4.ficha_en_carcel == true) {
          ficha4.ficha_en_carcel = false;
          tablero[entrada][4] += 1;
          tablero[entrada][5] += jugador;
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
      if ((ficha1.casilla_actual%68 <= 3) || (ficha1.casilla_actual%68 >= 21 && ficha1.casilla_actual%68 <= 37) || (ficha1.casilla_actual%68 >= 55)) {
        x1 = tablero[ficha1.casilla_actual%68][0]+20 ;
        y1 = tablero[ficha1.casilla_actual%68][1];
        x2 = tablero[ficha2.casilla_actual%68][0]-20 ;
        y2 = tablero[ficha2.casilla_actual%68][1];
      }

      //Casillas verticales
      else if ((ficha1.casilla_actual%68 >= 4 && ficha1.casilla_actual%68 <= 20)||(ficha1.casilla_actual%68 >= 38 && ficha1.casilla_actual%68 <= 54)) {
        x1 = tablero[ficha1.casilla_actual%68][0];
        y1 = tablero[ficha1.casilla_actual%68][1]+20;
        x2 = tablero[ficha2.casilla_actual%68][0];
        y2 = tablero[ficha2.casilla_actual%68][1]-20;
      }
    } else if (ficha1.casilla_actual%68 == ficha3.casilla_actual%68 && ficha1.ficha_en_carcel == false && ficha3.ficha_en_carcel == false) {
      tablero[ficha1.casilla_actual%68][3] = 1;

      if ((ficha1.casilla_actual%68 <= 3) || (ficha1.casilla_actual%68 >= 21 && ficha1.casilla_actual%68 <= 37) || (ficha1.casilla_actual%68 >= 55)) {
        x1 = tablero[ficha1.casilla_actual%68][0]+20 ;
        y1 = tablero[ficha1.casilla_actual%68][1];
        x3 = tablero[ficha3.casilla_actual%68][0]-20 ;
        y3 = tablero[ficha3.casilla_actual%68][1];
      }

      //Casillas verticales
      else if ((ficha1.casilla_actual%68 >= 4 && ficha1.casilla_actual%68 <= 20)||(ficha1.casilla_actual%68 >= 38 && ficha1.casilla_actual%68 <= 54)) {
        x1 = tablero[ficha1.casilla_actual%68][0];
        y1 = tablero[ficha1.casilla_actual%68][1]+20;
        x3 = tablero[ficha3.casilla_actual%68][0];
        y3 = tablero[ficha3.casilla_actual%68][1]-20;
      }
    } else if (ficha1.casilla_actual%68 == ficha4.casilla_actual%68 && ficha1.ficha_en_carcel == false && ficha4.ficha_en_carcel == false) {
      tablero[ficha1.casilla_actual%68][3] = 1;

      if ((ficha1.casilla_actual%68 <= 3) || (ficha1.casilla_actual%68 >= 21 && ficha1.casilla_actual%68 <= 37) || (ficha1.casilla_actual%68 >= 55)) {
        x1 = tablero[ficha1.casilla_actual%68][0]+20 ;
        y1 = tablero[ficha1.casilla_actual%68][1];
        x4 = tablero[ficha4.casilla_actual%68][0]-20 ;
        y4 = tablero[ficha4.casilla_actual%68][1];
      }

      //Casillas verticales
      else if ((ficha1.casilla_actual%68 >= 4 && ficha1.casilla_actual%68 <= 20)||(ficha1.casilla_actual%68 >= 38 && ficha1.casilla_actual%68 <= 54)) {
        x1 = tablero[ficha1.casilla_actual%68][0];
        y1 = tablero[ficha1.casilla_actual%68][1]+20;
        x4 = tablero[ficha4.casilla_actual%68][0];
        y4 = tablero[ficha4.casilla_actual%68][1]-20;
      }
    } else if (ficha2.casilla_actual%68 == ficha3.casilla_actual%68 && ficha2.ficha_en_carcel == false && ficha3.ficha_en_carcel == false) {
      tablero[ficha2.casilla_actual%68][3] = 1;

      if ((ficha2.casilla_actual%68 <= 3) || (ficha2.casilla_actual%68 >= 21 && ficha2.casilla_actual%68 <= 37) || (ficha2.casilla_actual%68 >= 55)) {
        x2 = tablero[ficha2.casilla_actual%68][0]+20 ;
        y2 = tablero[ficha2.casilla_actual%68][1];
        x3 = tablero[ficha3.casilla_actual%68][0]-20 ;
        y3 = tablero[ficha3.casilla_actual%68][1];
      }

      //Casillas verticales
      else if ((ficha2.casilla_actual%68 >= 4 && ficha2.casilla_actual%68 <= 20)||(ficha2.casilla_actual%68 >= 38 && ficha2.casilla_actual%68 <= 54)) {
        x2 = tablero[ficha2.casilla_actual%68][0];
        y2 = tablero[ficha2.casilla_actual%68][1]+20;
        x3 = tablero[ficha3.casilla_actual%68][0];
        y3 = tablero[ficha3.casilla_actual%68][1]-20;
      }
    } else if (ficha2.casilla_actual%68 == ficha4.casilla_actual%68 && ficha2.ficha_en_carcel == false && ficha4.ficha_en_carcel == false) {
      tablero[ficha2.casilla_actual%68][3] = 1;

      if ((ficha2.casilla_actual%68 <= 3) || (ficha2.casilla_actual%68 >= 21 && ficha2.casilla_actual%68 <= 37) || (ficha2.casilla_actual%68 >= 55)) {
        x2 = tablero[ficha2.casilla_actual%68][0]+20 ;
        y2 = tablero[ficha2.casilla_actual%68][1];
        x4 = tablero[ficha4.casilla_actual%68][0]-20 ;
        y4 = tablero[ficha4.casilla_actual%68][1];
      }

      //Casillas verticales
      else if ((ficha2.casilla_actual%68 >= 4 && ficha2.casilla_actual%68 <= 20)||(ficha2.casilla_actual%68 >= 38 && ficha2.casilla_actual%68 <= 54)) {
        x2 = tablero[ficha2.casilla_actual%68][0];
        y2 = tablero[ficha2.casilla_actual%68][1]+20;
        x4 = tablero[ficha4.casilla_actual%68][0];
        y4 = tablero[ficha4.casilla_actual%68][1]-20;
      }
    } else if (ficha3.casilla_actual%68 == ficha4.casilla_actual%68 && ficha3.ficha_en_carcel == false && ficha4.ficha_en_carcel == false) {
      tablero[ficha3.casilla_actual%68][3] = 1;

      if ((ficha3.casilla_actual%68 <= 3) || (ficha3.casilla_actual%68 >= 21 && ficha3.casilla_actual%68 <= 37) || (ficha3.casilla_actual%68 >= 55)) {
        x3 = tablero[ficha3.casilla_actual%68][0]+20 ;
        y3 = tablero[ficha3.casilla_actual%68][1];
        x4 = tablero[ficha4.casilla_actual%68][0]-20 ;
        y4 = tablero[ficha4.casilla_actual%68][1];
      }

      //Casillas verticales
      else if ((ficha3.casilla_actual%68 >= 4 && ficha3.casilla_actual%68 <= 20)||(ficha3.casilla_actual%68 >= 38 && ficha3.casilla_actual%68 <= 54)) {
        x3 = tablero[ficha3.casilla_actual%68][0];
        y3 = tablero[ficha3.casilla_actual%68][1]+20;
        x4 = tablero[ficha4.casilla_actual%68][0];
        y4 = tablero[ficha4.casilla_actual%68][1]-20;
      }
    } else if (tablero[ficha1.casilla_actual%68][4] < 2 && tablero[ficha2.casilla_actual%68][4] < 2 && tablero[ficha3.casilla_actual%68][4] < 2 && tablero[ficha4.casilla_actual%68][4] < 2) {
      if (ficha1.entrada == false) {
        x1 = 0;
        y1 = 0;
      }
      if (ficha2.entrada == false) {
        x2 = 0;
        y2 = 0;
      }
      if (ficha3.entrada == false) {
        x3 = 0;
        y3 = 0;
      }
      if (ficha4.entrada == false) {
        x4 = 0;
        y4 = 0;
      }
    }
  }

  //comer otras fichas
  void comer(Ficha ficha, int Dado) {

    if (tablero[(ficha.casilla_actual+Dado)%68][2] == 1 && tablero[(ficha.casilla_actual+Dado)%68][4] == 1) { //si es casilla segura hay bloqueo
      tablero[(ficha.casilla_actual+Dado)%68][3] = 1;
      dibujarBloqueo();
    } else if (tablero[(ficha.casilla_actual+Dado)%68][2]==0 && tablero[(ficha.casilla_actual+Dado)%68][4]==1) {          // si no es segura se la come
      if (tablero[(ficha.casilla_actual+Dado)%68][5]==1 && ficha.numero_jugador!=1) {
        if (jugador1.ficha1.casilla_actual == ficha.casilla_actual+Dado) {
          jugador1.ficha1.ficha_en_carcel = true;
          jugador1.ficha1.casilla_actual = 0;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        } else if (jugador1.ficha2.casilla_actual == ficha.casilla_actual+Dado) {
          jugador1.ficha2.ficha_en_carcel = true;
          jugador1.ficha2.casilla_actual = 0;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        } else if (jugador1.ficha3.casilla_actual == ficha.casilla_actual+Dado) {
          jugador1.ficha3.ficha_en_carcel = true;
          jugador1.ficha3.casilla_actual = 0;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        } else if (jugador1.ficha4.casilla_actual == ficha.casilla_actual+Dado) {
          jugador1.ficha4.ficha_en_carcel = true;
          jugador1.ficha4.casilla_actual = 0;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        }
      } else if (tablero[(ficha.casilla_actual+Dado)%68][5]==2 && ficha.numero_jugador!=2) {
        if (jugador2.ficha1.casilla_actual == ficha.casilla_actual+Dado) {
          jugador2.ficha1.ficha_en_carcel = true;
          jugador2.ficha1.casilla_actual = 17;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        } else if (jugador2.ficha2.casilla_actual == ficha.casilla_actual+Dado) {
          jugador2.ficha2.ficha_en_carcel = true;
          jugador2.ficha2.casilla_actual = 17;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        } else if (jugador2.ficha3.casilla_actual == ficha.casilla_actual+Dado) {
          jugador2.ficha3.ficha_en_carcel = true;
          jugador2.ficha3.casilla_actual = 17;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        } else if (jugador2.ficha4.casilla_actual == ficha.casilla_actual+Dado) {
          jugador2.ficha4.ficha_en_carcel = true;
          jugador2.ficha4.casilla_actual = 17;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        }
      } else if (tablero[(ficha.casilla_actual+Dado)%68][5]==3 && ficha.numero_jugador!=3) {
        if (jugador3.ficha1.casilla_actual == ficha.casilla_actual+Dado) {
          jugador3.ficha1.ficha_en_carcel = true;
          jugador3.ficha1.casilla_actual = 34;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        } else if (jugador3.ficha2.casilla_actual == ficha.casilla_actual+Dado) {
          jugador3.ficha2.ficha_en_carcel = true;
          jugador3.ficha2.casilla_actual = 34;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        } else if (jugador3.ficha3.casilla_actual == ficha.casilla_actual+Dado) {
          jugador3.ficha3.ficha_en_carcel = true;
          jugador3.ficha3.casilla_actual = 34;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        } else if (jugador3.ficha4.casilla_actual == ficha.casilla_actual+Dado) {
          jugador3.ficha4.ficha_en_carcel = true;
          jugador3.ficha4.casilla_actual = 34;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        }
      } else if (tablero[(ficha.casilla_actual+Dado)%68][5]==4 && ficha.numero_jugador!=4) {
        if (jugador4.ficha1.casilla_actual == ficha.casilla_actual+Dado) {
          jugador4.ficha1.ficha_en_carcel = true;
          jugador4.ficha1.casilla_actual = 51;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        } else if (jugador4.ficha2.casilla_actual == ficha.casilla_actual+Dado) {
          jugador4.ficha2.ficha_en_carcel = true;
          jugador4.ficha2.casilla_actual = 51;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        } else if (jugador4.ficha3.casilla_actual == ficha.casilla_actual+Dado) {
          jugador4.ficha3.ficha_en_carcel = true;
          jugador4.ficha3.casilla_actual = 51;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        } else if (jugador4.ficha4.casilla_actual == ficha.casilla_actual+Dado) {
          jugador4.ficha4.ficha_en_carcel = true;
          jugador4.ficha4.casilla_actual = 51;
          tablero[(ficha.casilla_actual+Dado)%68][4] --;
          ficha.mover(Dado);
          avanzarComer = true;
        }
      }
    }
  }
}
