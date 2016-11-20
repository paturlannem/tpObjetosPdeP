import sims.*

object interesado{
	var valoracionPresta
	
	method obtenerValoracionDeAlguien(alguienAValorar){
			return (alguienAValorar.dineroDeAmigos()*0.10)
	}
	method leAtraeA(alguien, aEste){
		return (aEste.dinero() * 2) <= (alguien.dinero())
	}
	method trabajar(alguien){}
	
	method prestamo(unSim, unAmigo, cantidad){
		valoracionPresta = unSim.valoracionPrestamo(unSim, unAmigo)
		return unSim.prestamoBase(unAmigo, cantidad)
		}
}

object superficial{
	var valoracionPresta
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
	
	method prestamo(unSim, unAmigo, cantidad){
		valoracionPresta = unSim.valoracionPrestamo(unSim, unAmigo)
			return unSim.prestamoBase(unAmigo, cantidad)
			}
}

object buenazo{
	var valoracionPresta
	method obtenerValoracionDeAlguien(alguienAValorar){
			return 0.5 * alguienAValorar.nivelDeFelicidad()
	}
	
	method leAtraeA(alguien, aEste){
		return true
	}
	
	method trabajar(alguien){
		if (alguien.trabajaConTodosSusAmigos()){
			alguien.nivelDeFelicidad(alguien.felicidad() + alguien.felicidad()*0.1)
		}
		else{}
	}
	
	method prestamo(unSim, unAmigo, cantidad){
		valoracionPresta = unSim.valoracionPrestamo(unSim, unAmigo)	
			return unSim.prestamoBase(unAmigo, cantidad)
		}
	
}

object peleadoConLaVida{
	var valoracionPresta
	method obtenerValoracionDeAlguien(alguienAValorar){
			return 0
	}
	
	method leAtraeA(alguien, aEste){
		return alguien.nivelDeFelicidad() < 200
	}
	method trabajar(alguien){}
	
	method prestamo(unSim, unAmigo, cantidad){ 
		valoracionPresta = unSim.valoracionPrestamo(unSim, unAmigo)
		return unSim.prestamoBase(unAmigo, cantidad)
		}
}
