class TipoDeTrabajo{
	method pasarUnDiaDeTrabajo(alguien){}
}

class Desocupado inherits TipoDeTrabajo{
	override method pasarUnDiaDeTrabajo(alguien){}
}

class Mercenario inherits TipoDeTrabajo{
	override method pasarUnDiaDeTrabajo(alguien){
		alguien.dinero(alguien.dinero() + 100 + (alguien.dinero()*0.02))
		alguien.volverALaNormalidad()
	}
}

class TrabajosQueGeneranDineroYFelicidad inherits TipoDeTrabajo{
	var dineroQueGenera
	var felicidadQueGenera
	constructor(unaCantidadDeDinero, unaCantidadDeFelicidad){
		dineroQueGenera = unaCantidadDeDinero
		felicidadQueGenera = unaCantidadDeFelicidad
	}
}

class Copado inherits TrabajosQueGeneranDineroYFelicidad{
	
	constructor(unaCantidadDeDinero, unaCantidadDeFelicidad) = super(unaCantidadDeDinero, unaCantidadDeFelicidad){
	}
	
	override method pasarUnDiaDeTrabajo(alguien){
		alguien.cambiarFelicidadEn(felicidadQueGenera)
		alguien.dinero(alguien.dinero() + dineroQueGenera)
		alguien.volverALaNormalidad()
	}
}

class Aburrido inherits TrabajosQueGeneranDineroYFelicidad{
	
	constructor(unaCantidadDeDinero, unaCantidadDeFelicidad) = super(unaCantidadDeDinero, unaCantidadDeFelicidad){
	}
	
	override method pasarUnDiaDeTrabajo(alguien){
		alguien.cambiarFelicidadEn(-felicidadQueGenera)
		alguien.dinero(alguien.dinero() + dineroQueGenera)
		alguien.volverALaNormalidad()
	}
}
class AburridoHastaLaMuerte inherits TrabajosQueGeneranDineroYFelicidad{
	var varN = 5
	constructor(unaCantidadDeDinero, unaCantidadDeFelicidad) = super(unaCantidadDeDinero, unaCantidadDeFelicidad){
	}
	override method pasarUnDiaDeTrabajo(alguien){
		alguien.cambiarFelicidadEn(-felicidadQueGenera * varN)
		alguien.dinero(alguien.dinero() + dineroQueGenera)
		alguien.volverALaNormalidad()
	}
	method cambioVarN(numero){
		varN = numero
	}	
}
class MercenarioSocial inherits TipoDeTrabajo{
	override method pasarUnDiaDeTrabajo(alguien){
		alguien.dinero(alguien.dinero() + 100 + (alguien.dinero()*0.02) + alguien.amigos().size())
		alguien.volverALaNormalidad()
	}
}
