import sims.*

class Celos{
	method ataqueDeCelo(unSim){}
		
	method efectosDeCelos(unSim){
		unSim.cambiarFelicidadEn(-10)
		self.ataqueDeCelo(unSim)
	}
}

class CelosPorPlata inherits Celos{
    override method ataqueDeCelo(unSim){ 
    	unSim.eliminarAmigosMasRicos()
     }
}

class CelosPorPopularidad inherits Celos{
    override method ataqueDeCelo(unSim){
     	unSim.eliminarAmigosMasPopulares()
	}
}

class CelosPorAmigoDePareja inherits Celos{
    override method ataqueDeCelo(unSim){
		unSim.eliminarAmigosQueSonAmigosDeMiPareja()
	}	
}