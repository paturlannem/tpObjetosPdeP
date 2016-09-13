object interesado{
	method obtenerValoracionDeAlguien(alguienAValorar){
			return (alguienAValorar.listaDeAmigos().sum({unAmigo => unAmigo.dinero()})) * 0.1
	}
	
	method leGusta(alguien, aEste){
		return (aEste.dinero() * 2) >= (alguien.dinero())
	}
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
}

object buenazo{
	method obtenerValoracionDeAlguien(alguienAValorar){
			return 0.5 * alguienAValorar.nivelDeFelicidad()
	}
	
	method leGusta(alguien, aEste){
		return true
	}
}

object peleadoConLaVida{
	method obtenerValoracionDeAlguien(alguienAValorar){
			return 0
	}
	
	method leGusta(alguien, aEste){
		return alguien.nivelDeFelicidad() < 200
	}
}