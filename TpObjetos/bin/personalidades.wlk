import sims.*

object interesado{
	method obtenerValoracionDeAlguien(alguienAValorar){
			return (alguienAValorar.dineroDeAmigos()*10)/100
	}
	
	method leAtrae(alguien, aEste){
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
	
	method leGusta(alguien, aEste){
		return self.esJovenParaSuperficial(alguien) && self.masPopularidadDeElQueMisAmigos(alguien, aEste) 
	}
	method trabajar(alguien){}
}

object buenazo{
	method obtenerValoracionDeAlguien(alguienAValorar){
			return 0.5 * alguienAValorar.nivelDeFelicidad()
	}
	
	method leGusta(alguien, aEste){
		return true
	}
	
	method trabajar(alguien){
		if (alguien.trabajaConTodosSusAmigos()){
			alguien.aumentarFelicidadDeBuenazo()
		}
		else{}
	}
	
}

object peleadoConLaVida{
	method obtenerValoracionDeAlguien(alguienAValorar){
			return 0
	}
	
	method leGusta(alguien, aEste){
		return alguien.nivelDeFelicidad() < 200
	}
	method trabajar(alguien){}
}
