class TiposDeTrabajo{
	method trabajar(alguien){
		alguien.aumentarFelicidadEn(alguien.trabajo().felicidadQueGenera())
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
