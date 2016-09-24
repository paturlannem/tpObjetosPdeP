object normal{}

object soniador{
	method cambiarFelicidadDeSoniador(alguien){
		var felicidadActual = alguien.nivelDeFelicidad()
		alguien.setNivelDeFelicidad(1000 + felicidadActual)
	}	
	method borrarConocimiento(alguien){
		alguien.conocimiento().clear()
	}
	
	method aplicarEstado(alguien){
		self.cambiarFelicidadDeSoniador(alguien)
		self.borrarConocimiento(alguien)
	}
}

object incomodidad{
	method aplicarEstado(alguien){
		alguien.cambiarFelicidadEn(-200)
	}
}