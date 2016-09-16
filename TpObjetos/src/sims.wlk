import personalidades.*

class Sims{
	var sexo
	var edad
	var nivelDeFelicidad
	var amigos = []
	var personalidad
	var dinero
	var sexoDePreferencia
	var estaEnPareja
	var suPareja
	var trabajo
	
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
	
	method trabajo(){
		return trabajo
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
	}
	
	method unirAmigos(unSim){
		amigos = (self.listaDeAmigos() + unSim.amigos()).asSet().asList() 
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
	
	method sePudreTodo(unSim){
		if (self.leAtraeUnAmigo() || unSim.leAtraeUnAmigo()){
			self.romperRelacion()
			unSim.romperRelacion()
		}
	}
		method aumentarDinero(unaCantidadDeDinero){
		dinero += unaCantidadDeDinero
	}
	
	//method dineroDeMercenario(){		
	//	var dinerilloExtra = (dinero *2)/100 + 100
	//	unSim.aumentarDinero(dinerilloExtra)		
	//}
	
	//method aumentarFelicidadEn10Porciento(){
	//	felicidad += (felicidad*10)/100
	//}	
	
	method trabajaConTodosSusAmigos(){}
	
	method dineroYTrabajo(unSim){
		if (unSim.personalidad() == "copado" ){
			unSim.aumentarFelicidadEn(5) and
			unSim.aumentarDinero(100)
		}
		else if (unSim.personalidad() == "mercenario" ){
			unSim.dineroDeMercenario()
		}
		else if (unSim.personalidad() == "aburrido" ){
			unSim.aumentarFelicidadEn(-5) and
			unSim.aumentarDinero(100)
		}
		and if(unSim.personalidad() == "buenazo" and unSim.trabajaConTodosSusAmigos()){
			unSim.aumentarFelicidadEnDiezPorciento()
		}	
	}
	
}

object martin inherits Sims(true, 24, 100, [], buenazo, 10, false){}
object lucia inherits Sims(false, 26, 100, [], buenazo, 50, true){}
object colo inherits Sims(true, 27, 100, [], buenazo, 10, false){}

