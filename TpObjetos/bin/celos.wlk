import sims.*
// Dejaríamos el esMasPopular(),esMasRico() y esAmigoDeMiPareja() como método en class Sim
//consultar

class CelosPorPlata {
    method efectosDeCelos(unSim){ 
    	unSim.cambiarFelicidadEn(-10)
    	unSim.eliminarAmigosMasRicos()
     }
}

class CelosPorPopularidad {
     method efectoDeCelos(unSim){
     	unSim.cambiarFelicidadEn(-10)
     	unSim.eliminarAmigosMasPopulares()
	}
}

class CelosPorAmigoDePareja {
     method efectoDeCelos(unSim){
     	unSim.cambiarFelicidadEn(-10)
		unSim.eliminarAmigosQueSonAmigosDeMiPareja()
	}	
}