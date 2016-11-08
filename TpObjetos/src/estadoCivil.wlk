import sims.*

object soltero{
	method estaSoltero(){
		return true
	}
}

class Relacion{
	
	var pareja
	var amigosDeSiempre
	
	constructor(unaPareja,unosAmigosDeSiempre){
		pareja = unaPareja
		amigosDeSiempre = unosAmigosDeSiempre
	} 
	
	method estaSoltero(){
		return false
	}
	
	method pareja(){
		return pareja
	}
	
	method amigosDeSiempre(){
		return amigosDeSiempre
	}
}
