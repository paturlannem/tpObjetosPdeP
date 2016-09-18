class TiposDeTrabajo{
	method trabajar(alguien){
		alguien.cambiarFelicidadEn(alguien.trabajo().felicidadQueGenera())
		alguien.aumentarDineroEn(alguien.trabajo().remuneracion())
	}
}

object copado inherits TiposDeTrabajo{}
object aburrido inherits TiposDeTrabajo{}

object mercenario{
	method trabajar(alguien){		
		alguien.aumentarDineroDeMercenario()
	}
}
