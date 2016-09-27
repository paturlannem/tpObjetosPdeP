import sims.*
// Dejaríamos el esMasPopular(),esMasRico() y esAmigoDeMiPareja() como método en class Sim
//consultar

class PorPlata {
    method efectosDeCelos(unSim){ 
    	unSim.cambiarFelicidadEn(-10)
    	unSim.eliminarAmigosMasRicos()
     }
}

class PorPopularidad {
     method efectoDeCelos(unSim){
     	unSim.cambiarFelicidadEn(-10)
     	unSim.eliminarAmigosMasPopulares()
	}
}

class PorAmigoDePareja {
     method efectoDeCelos(unSim){
     	unSim.cambiarFelicidadEn(-10)
		unSim.eliminarAmigosQueSonAmigosDeMiPareja()
	}	
}