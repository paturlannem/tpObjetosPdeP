class TipoDeTrabajo{
	method pasarUnDiaDeTrabajo(alguien){}
}

class Desocupado inherits TipoDeTrabajo{
	override method pasarUnDiaDeTrabajo(alguien){}
}

class Mercenario inherits TipoDeTrabajo{
	override method pasarUnDiaDeTrabajo(alguien){
		alguien.dinero(alguien.dinero() + 100 + (alguien.dinero()*0.02))
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
	}
}

class Aburrido inherits TrabajosQueGeneranDineroYFelicidad{
	
	constructor(unaCantidadDeDinero, unaCantidadDeFelicidad) = super(unaCantidadDeDinero, unaCantidadDeFelicidad){
	}
	
	override method pasarUnDiaDeTrabajo(alguien){
		alguien.cambiarFelicidadEn(-felicidadQueGenera)
		alguien.dinero(alguien.dinero() + dineroQueGenera)
	}
}
