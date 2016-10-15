import sims.*

object interesado{
	method obtenerValoracionDeAlguien(alguienAValorar){
			return (alguienAValorar.dineroDeAmigos()*0.10)
	}
	method leAtraeA(alguien, aEste){
		return (aEste.dinero() * 2) <= (alguien.dinero())
	}
	method trabajar(alguien){}
}

object superficial{
	method obtenerValoracionDeAlguien(alguienAValorar){
			return 20 * alguienAValorar.popularidad()
	}
	method esJovenParaSuperficial(alguien){
		return alguien.edad() > 18 && alguien.edad() < 29
	}
	
	method masPopularidadDeElQueMisAmigos(alguien, yo){
		return (yo.amigos().max({unAmigo => unAmigo.popularidad()}).popularidad()) >= alguien.popularidad()	
	}
	
	method leAtraeA(alguien, aEste){
		return self.esJovenParaSuperficial(alguien) && self.masPopularidadDeElQueMisAmigos(alguien, aEste) 
	}
	method trabajar(alguien){}
}

object buenazo{
	method obtenerValoracionDeAlguien(alguienAValorar){
			return 0.5 * alguienAValorar.nivelDeFelicidad()
	}
	
	method leAtraeA(alguien, aEste){
		return true
	}
	
	method trabajar(alguien){
		if (alguien.trabajaConTodosSusAmigos()){
			alguien.setNivelDeFelicidad(alguien.felicidad() + alguien.felicidad()*0.1)
		}
		else{}
	}
	
}

object peleadoConLaVida{
	method obtenerValoracionDeAlguien(alguienAValorar){
			return 0
	}
	
	method leAtraeA(alguien, aEste){
		return alguien.nivelDeFelicidad() < 200
	}
	method trabajar(alguien){}
}
