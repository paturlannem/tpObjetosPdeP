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

class Copado inherits TipoDeTrabajo {
	
	var dineroQueGenera
	var felicidadQueGenera
	constructor(unaCantidadDeDinero, unaCantidadDeFelicidad){
		dineroQueGenera = unaCantidadDeDinero
		felicidadQueGenera = unaCantidadDeFelicidad
	}
	method dineroQueGenera(){
		return dineroQueGenera
	}
	method felicidadQueGenera(){
		return felicidadQueGenera
	}
	method dineroQueGenera(unaCantidadDeDinero){
		dineroQueGenera = unaCantidadDeDinero
	}
		method felicidadQueGenera(unaCantidadDeFelicidad){
		felicidadQueGenera = unaCantidadDeFelicidad
	}
	override method pasarUnDiaDeTrabajo(alguien){
		alguien.cambiarFelicidadEn(felicidadQueGenera)
		alguien.dinero(alguien.dinero() + dineroQueGenera)
		alguien.volverALaNormalidad()
	}
}

class Aburrido inherits TipoDeTrabajo{
	
	var dineroQueGenera
	var felicidadQueGenera
	constructor(unaCantidadDeDinero, unaCantidadDeFelicidad){
		dineroQueGenera = unaCantidadDeDinero
		felicidadQueGenera = unaCantidadDeFelicidad
	}
		method dineroQueGenera(){
		return dineroQueGenera
	}
	method felicidadQueGenera(){
		return felicidadQueGenera
	}
	method dineroQueGenera(unaCantidadDeDinero){
		dineroQueGenera = unaCantidadDeDinero
	}
	method felicidadQueGenera(unaCantidadDeFelicidad){
		felicidadQueGenera = unaCantidadDeFelicidad
	}
	override method pasarUnDiaDeTrabajo(alguien){
		alguien.cambiarFelicidadEn(-felicidadQueGenera)
		alguien.dinero(alguien.dinero() + dineroQueGenera)
		alguien.volverALaNormalidad()
	}
}
class AburridoHastaLaMuerte inherits Aburrido{
	var varN = 5
	constructor (unaCantidadDeDinero, unaCantidadDeFelicidad, n) = super (unaCantidadDeDinero, unaCantidadDeFelicidad) {
		varN = n
	}
		override method pasarUnDiaDeTrabajo(alguien){
		super(alguien.cambiarFelicidadEn()* varN)
	} 
	method cambioVarN(numero){
		varN = numero
	}	
}
class MercenarioSocial inherits Mercenario{
	override method pasarUnDiaDeTrabajo(alguien){
		super(alguien.dinero()) + alguien.amigos().size()
		alguien.volverALaNormalidad()
	}
}
