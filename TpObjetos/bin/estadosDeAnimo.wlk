import sims.*

object normal{
	method aplicarEstado(alguien){}
}

object soniador{
	method aplicarEstado(alguien){
		alguien.cambiarFelicidadEn(1000)
		alguien.leAgarraAmnesia()
	}
}

object incomodidad{
	method aplicarEstado(alguien){
		alguien.cambiarFelicidadEn(-200)
	}
}