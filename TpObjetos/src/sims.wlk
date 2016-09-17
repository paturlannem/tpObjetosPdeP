import personalidades.*

class Sims{
	var sexo
	var edad
	var nivelDeFelicidad
	var amigos = []
	var personalidad
	var dinero
	var sexoDePreferencia
	var estaEnPareja = false
	var suPareja
	var amigosAntesDeTenerPareja = []
	
	//Para el sexo usamos true=hombre, false= mujer
	
	constructor(unSexo, unaEdad, unNivelDeFelicidad, listaDeAmigos, unaPersonalidad, cantDinero, unSexoDePreferencia){
		sexo = unSexo
		edad = unaEdad
		nivelDeFelicidad = unNivelDeFelicidad
		amigos = listaDeAmigos
		personalidad = unaPersonalidad
		dinero = cantDinero
		sexoDePreferencia = unSexoDePreferencia
	}

	//GETTERS

	method edad(){
		return edad
	}
	
	method sexo(){
		return sexo
	}
	
	method nivelDeFelicidad(){
		return nivelDeFelicidad
	}
	
	method listaDeAmigos(){
		return amigos
	}
	
	method personalidad(){
		return personalidad
	}
	
	method dinero(){
		return dinero
	}
	
	method estaEnPareja(){
		return estaEnPareja
	}
	
	method suPareja(){
		return suPareja
	}
	
	//SETTERS
	
	method setEdad(unaEdad){
		edad = unaEdad
	}
	
	method setSexo(unSexo){
		sexo = unSexo
	}
	
	method setNivelDeFelicidad(unNivelDeFelicidad){
		nivelDeFelicidad = unNivelDeFelicidad
	}
	
	method setAmigos(listaAmigos){
		amigos = listaAmigos
	}
		
	method setPersonalidad(unaPersonalidad){
		personalidad = unaPersonalidad
	}
	
	// FIN SETTERS
	
	method agregarAmigo(unAmigo){
		amigos.add(unAmigo)
		nivelDeFelicidad += personalidad.obtenerValoracionDeAlguien(unAmigo)
	}
	
	method eliminarAmigo(unAmigo){
		amigos.remove(unAmigo)
	}
	
	method esAmigoDe(unAmigo){
		return amigos.contains(unAmigo)
	}
	
	method aumentarFelicidadEn(cant){
		nivelDeFelicidad += cant
	}
	
	method popularidad(){
		return amigos.sum({unAmigo => unAmigo.nivelDeFelicidad()})	
	}
	
	method esDelSexoDeSuPreferencia(unSim){
		return unSim.sexo() == sexoDePreferencia
	}
	
	method leAtrae(unSim){
		return self.esDelSexoDeSuPreferencia(unSim) && personalidad.leGusta(unSim, self)
	}
	
	method darAbrazoComunA(alguien){
		self.aumentarFelicidadEn(2)
		alguien.aumentarFelicidadEn(4)
	}
	
	method darAbrazoProlongadoA(alguien){
		if(alguien.leAtrae(self)){
			//Alguien Se pone SOÑADOR
		}
		else{
			//Alguien se pone incomodo
		}
	}
	method ponerEnPareja(alguien){
		estaEnPareja = true
		suPareja = alguien
	}
	
	method romperRelacion(){
		estaEnPareja = false
		suPareja = null
		amigos = amigosAntesDeTenerPareja
	}
	
	method unirAmigos(unSim){
		amigosAntesDeTenerPareja = amigos
		amigos = (self.listaDeAmigos() + unSim.listaDeAmigos()).asSet().asList() 
	}
	
	method enRelacionCon(unSim){
		if (self.leAtrae(unSim) && unSim.leAtrae(self)){
			self.ponerEnPareja(unSim)
			unSim.ponerEnPareja(self)
			self.unirAmigos(unSim)
			unSim.unirAmigos(self)
		}	
	}
	
	method leAtraeUnAmigo(){
		return amigos.any({unAmigo => self.leAtrae(unAmigo)})
	}
	
	method sePudreTodoCon(unSim){
		if (self.leAtraeUnAmigo() || unSim.leAtraeUnAmigo()){
			self.romperRelacion()
			unSim.romperRelacion()
		}
	}
}