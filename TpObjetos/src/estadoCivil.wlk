import sims.*

object soltero{}

class Relacion{
	
	var pareja
	var amigosDeSiempre
	
	constructor(unaPareja,unosAmigosDeSiempre){
		pareja = unaPareja
		amigosDeSiempre = unosAmigosDeSiempre
	} 
	
	method pareja(){
		return pareja
	}
	
	method amigosDeSiempre(){
		return amigosDeSiempre
	}
}
