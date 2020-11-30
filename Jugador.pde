class Jugador{
  Ficha ficha1;
  Ficha ficha2;
  Ficha ficha3;
  Ficha ficha4;
  
 
  Jugador(int numerodejugador){
    
    //Cada jugador tiene un número asignado del cual depende su color y su turno
    // se crea cada ficha con las coordenadas de su carcel 
    if (numerodejugador==1){
      ficha1 = new Ficha(1, 550, 550);
      ficha2 = new Ficha(1, 620, 550);
      ficha3 = new Ficha(1, 550, 620);
      ficha4 = new Ficha(1, 620, 620);
    }else if (numerodejugador==2){
      ficha1 = new Ficha(2, 550, 70);
      ficha2 = new Ficha(2, 620, 70);
      ficha3 = new Ficha(2, 550, 140);
      ficha4 = new Ficha(2, 620, 140);
    }else if (numerodejugador==3){
      ficha1 = new Ficha(3, 70, 70);
      ficha2 = new Ficha(3, 140, 70);
      ficha3 = new Ficha(3, 70, 140);
      ficha4 = new Ficha(3, 140, 140);
    }else if (numerodejugador==4){
      ficha1 = new Ficha(4, 70, 550);
      ficha2 = new Ficha(4, 140, 550);
      ficha3 = new Ficha(4, 70, 620);
      ficha4 = new Ficha(4, 140, 620);
    }
    
  }
  //Dibujamos las 4 fichas del jugador
  void DibujarFichas(){
    ficha1.dibujar();
    ficha2.dibujar();
    ficha3.dibujar();
    ficha4.dibujar();
  }
  //Tirar dados
  void TirarDados(){
    Dado1= (int)random(6) +1;
    Dado2= (int)random(6) +1;
    
    delay(100);
    Turno++;
  }
  //Elegir cuanto mover con cada ficha
  
}
