import personalidades.*
import trabajos.*
import tiposDeTrabajo.*
import estadosDeAnimo.*

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
	var trabajo
	var estadoDeAnimo = normal
	var conocimiento = []

	
	//Para el sexo usamos true=hombre, false= mujer
	
	constructor(unSexo, unaEdad, unNivelDeFelicidad, listaDeAmigos, unaPersonalidad, cantDinero, unSexoDePreferencia, unTrabajo){
		sexo = unSexo
		edad = unaEdad
		nivelDeFelicidad = unNivelDeFelicidad
		amigos = listaDeAmigos
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
	
	method setAmigos(listaAmigos){
		amigos = listaAmigos
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
	
	method agregarAmigo(unAmigo){
		amigos.add(unAmigo)
		nivelDeFelicidad += personalidad.obtenerValoracionDeAlguien(unAmigo)
	}
	
	method amigoAQuienMasValora(){
		return amigos.max({unAmigo => personalidad.obtenerValoracionDeAlguien(unAmigo)})
	}
	
	method eliminarAmigo(unAmigo){
		amigos.remove(unAmigo)
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
		return self.esDelSexoDeSuPreferencia(unSim) && personalidad.leGusta(unSim, self)
	}
	
	method darAbrazoComunA(alguien){
		self.cambiarFelicidadEn(2)
		alguien.cambiarFelicidadEn(4)
	}
	
	method darAbrazoProlongadoA(alguien){
		if(alguien.leAtrae(self)){
			alguien.setEstadoDeAnimo(soniador)
			alguien.estadoDeAnimo().aplicarEstado(self)
		}
		else{
			alguien.setEstadoDeAnimo(incomodidad)
			alguien.estadoDeAnimo().aplicarEstado(self)
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
		amigos = amigosAntesDeTenerPareja
	}
	
	method unirAmigos(unSim){
		amigosAntesDeTenerPareja = amigos
		amigos = (amigos + unSim.listaDeAmigos()).asSet().asList() 
	}
	
	method unirAmigosDePareja(unSim){
		amigosAntesDeTenerPareja = amigos
		amigos = unSim.listaDeAmigos() 
	}
	
	method enRelacionCon(unSim){
		if (self.leAtrae(unSim) && unSim.leAtrae(self)){
			self.ponerEnPareja(unSim)
			unSim.ponerEnPareja(self)
			self.unirAmigos(unSim)
			unSim.unirAmigosDePareja(self)
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
		if (personalidad == buenazo && self.trabajaConTodosSusAmigos()){
			nivelDeFelicidad += nivelDeFelicidad * 0.1
		}
	}
	
	method aumentarDineroEn(cant){
		dinero += cant
	}
	
	method aumentarDineroDeMercenario(){
		dinero += 100 + ((2*dinero)/100)
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
	
	method ataqueDeCelosPorPlata(){
		self.cambiarFelicidadEn(-10)
		amigos = self.eliminarAmigosMasRicos()
	}
	
	method esMasPopular(unAmigo){
		return unAmigo.popularidad() > self.popularidad()
	}
	
	method eliminarAmigosMasPopulares(){
		return amigos.filter({unAmigo => !(self.esMasPopular(unAmigo))})
	}
	
	method ataqueDeCelosPorPopularidad(){
		self.cambiarFelicidadEn(-10)
		amigos = self.eliminarAmigosMasPopulares()
	}
	
	method esAmigoDeMiPareja(unAmigo){
		return suPareja.amigos().contains(unAmigo)
	}
	
	method eliminarAmigosQueSonAmigosDeMiPareja(){
		return amigos.filter({unAmigo => !(self.esAmigoDeMiPareja(unAmigo))})
	}
	
	method ataqueDeCelosPorPareja(){
		self.cambiarFelicidadEn(-10)
		amigos = self.eliminarAmigosQueSonAmigosDeMiPareja()
	}	
}