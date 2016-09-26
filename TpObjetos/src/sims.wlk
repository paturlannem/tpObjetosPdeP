import personalidades.*
import trabajos.*
import tiposDeTrabajo.*
import estadosDeAnimo.*

//package sexo {	
//object hombre {}
//object mujer {}
//}

class Sim{
	var sexo
	var edad
	var nivelDeFelicidad
	var amigos = []
	var personalidad
	var dinero
	var sexoDePreferencia
	var estaEnPareja = false
	var suPareja
	var amigosDeSiempre = []
	var trabajo
	var estadoDeAnimo = normal
	var conocimiento = []
	
	constructor(unSexo, unaEdad, unNivelDeFelicidad, amigosDelSim, unaPersonalidad, cantDinero, unSexoDePreferencia, unTrabajo){
		sexo = unSexo
		edad = unaEdad
		nivelDeFelicidad = unNivelDeFelicidad
		amigos = amigosDelSim
		personalidad = unaPersonalidad
		dinero = cantDinero
		sexoDePreferencia = unSexoDePreferencia
		trabajo = unTrabajo
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
	
	method amigosDelSim(){
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
	
	method trabajo(){
		return trabajo
	}
	
	method conocimiento(){
		return conocimiento
	}
	
	method estadoDeAnimo(){
		return estadoDeAnimo
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
	
	method setAmigos(amigosDelSim){
		amigos = amigosDelSim
	}
		
	method setPersonalidad(unaPersonalidad){
		personalidad = unaPersonalidad
	}
	
	method setTrabajo(unTrabajo) {
		trabajo = unTrabajo
	}
	
	method setEstadoDeAnimo(unEstadoDeAnimo){
		estadoDeAnimo = unEstadoDeAnimo 
	}
	
	method setConocimiento(conocimientos){
		conocimiento = conocimientos
	}
	
	// FIN SETTERS
	
	method dineroDeAmigos(){
		return amigos.sum({unAmigo=>unAmigo.dinero()})
	}
	
	method agregarAmigo(unAmigo){
		if (estaEnPareja = true){
			amigosDeSiempre.add(unAmigo)
			amigos.add(unAmigo)
			nivelDeFelicidad += personalidad.obtenerValoracionDeAlguien(unAmigo)
		}
		else {
		amigos.add(unAmigo)
		nivelDeFelicidad += personalidad.obtenerValoracionDeAlguien(unAmigo)
		}
	}
	
	
	method amigoAQuienMasValora(){
		return amigos.max({unAmigo => personalidad.obtenerValoracionDeAlguien(unAmigo)})
	}
	
	method eliminarAmigo(unAmigo){
			amigos.remove(unAmigo)
			amigosDeSiempre.remove(unAmigo)
	}
	
	method esAmigoDe(unAmigo){
		return amigos.contains(unAmigo)
	}
	
	method cantidadDeAmigosQueTiene(){
		return amigos.size()
	}
	
	method cambiarFelicidadEn(cant){
		nivelDeFelicidad += cant
	}
	
	method aumentarFelicidadDeBuenazo(){
		nivelDeFelicidad += nivelDeFelicidad * 0.1
	}
	
	method popularidad(){
		return amigos.sum({unAmigo => unAmigo.nivelDeFelicidad()})	
	}
	
	method esElMasPopularDeSusAmigos(){
		return amigos.all({unAmigo => unAmigo.esMasPopular(self)})
	}
	
	method esDelSexoDeSuPreferencia(unSim){
		return unSim.sexo() == sexoDePreferencia
	}
	
	method leAtrae(unSim){
		return self.esDelSexoDeSuPreferencia(unSim) && personalidad.leAtrae(unSim, self)
	}
	
	method darAbrazoComunA(alguien){
		self.cambiarFelicidadEn(2)
		alguien.cambiarFelicidadEn(4)
	}
	
	method darAbrazoProlongadoA(alguien){
		if(alguien.leAtrae(self)){
			alguien.setEstadoDeAnimo(soniador)
			alguien.estadoDeAnimo().aplicarEstado()
		}
		else{
			alguien.setEstadoDeAnimo(incomodidad)
			alguien.estadoDeAnimo().aplicarEstado()
		}
	}
	
	method volverALaNormalidad(){
		self.setEstadoDeAnimo(normal)
	}
	
	method ponerEnPareja(alguien){
		estaEnPareja = true
		suPareja = alguien
	}
	
	method romperRelacion(){
		estaEnPareja = false
		suPareja = null
		amigos = amigosDeSiempre
	}
	
	method unirAmigos(unSim){
		amigosDeSiempre = amigos
		amigos = (amigos + unSim.amigosDelSim()).asSet() 
	}
	
	method iniciarRelacionCon(unSim){
		if (self.leAtrae(unSim) && unSim.leAtrae(self)){
			self.ponerEnPareja(unSim)
			unSim.ponerEnPareja(self)
			self.unirAmigos(unSim)
			unSim.unirAmigos(self)
		}	
	}
	
	method simsEnPareja(){
		return [self, suPareja]
	}
	
	method leAtraeUnAmigo(){
		return amigos.any({unAmigo => self.leAtrae(unAmigo)})
	}
	
	method sePudreTodoConSuPareja(){
		if (self.leAtraeUnAmigo() || suPareja.leAtraeUnAmigo()){
			suPareja.romperRelacion()
			self.romperRelacion()
		}
	}
	
	method trabajaConTodosSusAmigos(){
		return amigos.all({unAmigo => unAmigo.trabajo() == trabajo})
	}
	
	method irATrabajar(){
		trabajo.tipoDeTrabajo().trabajar(self)
		personalidad.trabajar(self)
	}

	method agregarConocimiento(unConocimiento){
		if (!conocimiento.contains(unConocimiento)){
			conocimiento.add(unConocimiento)
		}
	}
	
	method conocimientoTotal(){
		return conocimiento.sum({unConocimiento => unConocimiento.size()})
	}
	
	method leAgarraAmnesia(){
		self.setConocimiento([])
	}
	
	method esMasRico(unAmigo){
		return unAmigo.dinero() > dinero
	}
	
	method eliminarAmigosMasRicos(){
		return amigos.filter({unAmigo => !(self.esMasRico(unAmigo))})
	}	
	
	method esAmigoDeMiPareja(unAmigo){
		return suPareja.amigos().contains(unAmigo)
	}
	
	method eliminarAmigosQueSonAmigosDeMiPareja(){
		return amigos.filter({unAmigo => !(self.esAmigoDeMiPareja(unAmigo))})
	}

// Dejaríamos el esMasPopular(),esMasRico() y esAmigoDeMiPareja() como método en class Sim
//consultar

class Celos {
     method disminuirFelicidad(unSim){
		return unSim.cambiarFelicidadEn(-10)
		}
}


class PorPlata inherits Celos {
    method efectosDeCelos(unSim){ 
    	return unSim.eliminarAmigosMasRicos()
     }
}

class PorPopularidad inherits Celos   {
     method efectoDeCelos(unSim){
     	return unSim.eliminarAmigosMasPopulares()
	}
}

class PorAmigoDePareja inherits Celos {
     method efectoDeCelos(unSim){
		return unSim.eliminarAmigosQueSonAmigosDeMiPareja()
	}	
}
