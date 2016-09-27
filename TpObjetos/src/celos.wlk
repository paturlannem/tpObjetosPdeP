import sims.*
// Dejaríamos el esMasPopular(),esMasRico() y esAmigoDeMiPareja() como método en class Sim
//consultar

class Celos {
     method disminuirFelicidad(unSim){
		return unSim.cambiarFelicidadEn(-10)
		}
}


class PorPlata inherits Celos {
    method efectosDeCelos(unSim){ 
    	return unSim.eliminarAmigosMasRicos()
     }
}

class PorPopularidad inherits Celos   {
     method efectoDeCelos(unSim){
     	return unSim.eliminarAmigosMasPopulares()
	}
}

class PorAmigoDePareja inherits Celos {
     method efectoDeCelos(unSim){
		return unSim.eliminarAmigosQueSonAmigosDeMiPareja()
	}	
}