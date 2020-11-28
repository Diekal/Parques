class Ficha{
  
  //1. coordenada en x
  //2. coordenada en y
  //3. casilla segura
  //4. fichas que hay
  //5. color de la ficha en la casilla
  
  int [][] tablero = {{435,555,1,0,0},{435,525,0,0,0},{435,495,0,0,0},{435,465,0,0,0},{465,435,0,0,0},{495,435,0,0,0},{525,435,0,0,0},{555,435,1,0,0},{585,435,0,0,0},{615,435,0,0,0},{645,435,0,0,0},{675,435,0,0,0},{675,345,1,0,0},{675,255,0,0,0},{645,255,0,0,0},{615,255,0,0,0},{585,255,0,0,0},
                      {555,255,1,0,0},{525,255,0,0,0},{495,255,0,0,0},{465,255,0,0,0},{435,225,0,0,0},{435,195,0,0,0},{435,165,0,0,0},{435,135,1,0,0},{435,105,0,0,0},{435,75,0,0,0},{435,45,0,0,0},{435,15,0,0,0},{345,15,1,0,0},{255,15,0,0,0},{255,45,0,0,0},{255,75,0,0,0},{255,105,0,0,0},
                      {255,135,1,0,0},{255,165,0,0,0},{255,195,0,0,0},{255,225,0,0,0},{225,255,0,0,0},{195,255,0,0,0},{165,255,0,0,0},{135,255,1,0,0},{105,255,0,0,0},{75,255,0,0,0},{45,255,0,0,0},{15,255,0,0,0},{15,345,0,0,0},{15,435,0,0,0},{45,435,0,0,0},{75,435,0,0,0},{105,435,0,0,0},
                      {135,435,1,0,0},{165,435,0,0,0},{195,435,0,0,0},{225,435,0,0,0},{255,465,0,0,0},{255,495,0,0,0},{255,525,0,0,0},{255,555,1,0,0},{255,585,0,0,0},{255,615,0,0,0},{255,645,0,0,0},{255,675,0,0,0},{345,675,0,0,0},{435,675,0,0,0},{435,645,0,0,0},{435,615,0,0,0},{435,585,0,0,0}
};

 int[][] carcel; //Coordendas de la carcel
 color color_ficha; //Color ficha 
 int casilla_actual; //Casilla actual de la ficha
 int casillas_avanzadas; //Casillas avanzadas por la ficha
  
  Ficha(int jugador){
    
    carcel = new int [4][2];
    casilla_actual = 0;
    
    //Asigna valores segun el jugador
    switch(jugador){
      
      case 1:
      color_ficha = #FFFF00; //Amarillo
      
      //Coordenadas de la carcel
      carcel[0][0] = 550;
      carcel[0][1] = 550;
      carcel[1][0] = 620;
      carcel[1][1] = 550;
      carcel[2][0] = 550;
      carcel[2][1] = 620;
      carcel[3][0] = 620;
      carcel[3][1] = 620;
      
      break;
      
      case 2:
      color_ficha = #0000FF; //Azul
      
      //Coordenadas de la carcel
      carcel[0][0] = 550;
      carcel[0][1] = 70;
      carcel[1][0] = 620;
      carcel[1][1] = 70;
      carcel[2][0] = 550;
      carcel[2][1] = 140;
      carcel[3][0] = 620;
      carcel[3][1] = 140;
      
      break;
      
      case 3:
      color_ficha = #FF0000; //Rojo
      
      //Coordenadas de la carcel
      carcel[0][0] = 70;
      carcel[0][1] = 70;
      carcel[1][0] = 140;
      carcel[1][1] = 70;
      carcel[2][0] = 70;
      carcel[2][1] = 140;
      carcel[3][0] = 140;
      carcel[3][1] = 140;
      
      break;
      
      case 4:
      color_ficha = #009245; //Verde
      
      //Coordenadas de la carcel
      carcel[0][0] = 70;
      carcel[0][1] = 550;
      carcel[1][0] = 140;
      carcel[1][1] = 550;
      carcel[2][0] = 70;
      carcel[2][1] = 620;
      carcel[3][0] = 140;
      carcel[3][1] = 620;
      
      break;
    }
  }
  
  void dibujar(){
    push();
    stroke(0);
    strokeWeight(2);
    fill(color_ficha);
    
    circle(tablero[casilla_actual][0],tablero[casilla_actual][1],30);
    
    pop();
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
