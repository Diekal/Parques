void Seguros(){
  
  //Cada 2 rondas cambian  de lugar los seguros
  if (Ronda==2){
    seguro1=(int)random(16)+1;  //16 casillas posibles +1 porque la casilla 0 es el primer seguro
    seguro2=(int)random(16)+1;
  }
  int[] seguros = {seguro1, seguro2};
  
  //Dibujamos los seguros, incluyendo los casos especiales de la esquinas
  for(int i=0; i<2; i++){
    if (seguros[i]==3){
      break;
    }else if (seguros[i]==4){
      break;
    }else{
      break;
    }
  }
}
