class Desocupado{
	method pasarUnDiaDeTrabajo(alguien){}
}

class Mercenario{
	method pasarUnDiaDeTrabajo(alguien){
		alguien.setDinero(alguien.dinero() + 100 + (alguien.dinero()*0.02))
	}
}

class TipoDeTrabajo{
	var dineroQueGenera
	var felicidadQueGenera
	
	constructor(unaCantidadDeDinero, unaCantidadDeFelicidad){
		dineroQueGenera = unaCantidadDeDinero
		felicidadQueGenera = unaCantidadDeFelicidad
	}
	
	method pasarUnDiaDeTrabajo(alguien){}
}

class Copado inherits TipoDeTrabajo{
	
	constructor(unaCantidadDeDinero, unaCantidadDeFelicidad) = super(unaCantidadDeDinero, unaCantidadDeFelicidad){
	}
	
	override method pasarUnDiaDeTrabajo(alguien){
		alguien.cambiarFelicidadEn(felicidadQueGenera)
		alguien.setDinero(alguien.dinero() + dineroQueGenera)
	}
}

class Aburrido inherits TipoDeTrabajo{
	
	constructor(unaCantidadDeDinero, unaCantidadDeFelicidad) = super(unaCantidadDeDinero, unaCantidadDeFelicidad){
	}
	
	override method pasarUnDiaDeTrabajo(alguien){
		alguien.cambiarFelicidadEn(-felicidadQueGenera)
		alguien.setDinero(alguien.dinero() + dineroQueGenera)
	}
}

