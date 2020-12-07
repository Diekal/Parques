void Seguros(){
  
  //Cada 2 rondas cambian  de lugar los seguros
  if ((Turno%20)==0 && Turno!=0){
    tablero[seguro1][2]=1;
    tablero[seguro2][2]=1;
    tablero[seguro1+17][2]=1;
    tablero[seguro2+17][2]=1;
    tablero[seguro1+34][2]=1;
    tablero[seguro2+34][2]=1;
    tablero[seguro1+51][2]=1;
    tablero[seguro2+51][2]=1;
  }
  int[] seguros = {seguro1, seguro2};
  fill(#9c9c9c);
  //Dibujamos los seguros, incluyendo los casos especiales de la esquinas
  for(int i=0; i<2; i++){
    if (seguros[i]==3){
      
    }else if (seguros[i]==4){
      
    }else if (seguros[i]==1 |seguros[i]==2){
      rect(tablero[seguros[i]][0]-45, tablero[seguros[i]][1]-15, 90, 30);
      rect(tablero[seguros[i]+17][0]-15, tablero[seguros[i]+17][1]-45, 30, 90);
      rect(tablero[seguros[i]+34][0]-45, tablero[seguros[i]+34][1]-15, 90, 30);
      rect(tablero[seguros[i]+51][0]-15, tablero[seguros[i]+51][1]-45, 30, 90);
      
    }else if (seguros[i]>=5 && seguros[i]<=16){
      rect(tablero[seguros[i]][0]-15, tablero[seguros[i]][1]-45, 30, 90);
      rect(tablero[seguros[i]+17][0]-45, tablero[seguros[i]+17][1]-15, 90, 30);
      rect(tablero[seguros[i]+34][0]-15, tablero[seguros[i]+34][1]-45, 30, 90);
      rect(tablero[seguros[i]+51][0]-45, tablero[seguros[i]+51][1]-15, 90, 30);
      
    }
  }
}
