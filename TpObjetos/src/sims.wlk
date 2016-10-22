import personalidades.*
import tiposDeTrabajo.*
import estadosDeAnimo.*
import celos.*
import estadoCivil.*
import fuentesDeInformacion.*
	
object hombre {}
object mujer {}


class Sim{
	var sexo
	var edad
	var nivelDeFelicidad
	var amigos = []
	var personalidad
	var dinero
	var sexoDePreferencia
	var estadoCivil = soltero
	var tipoDeTrabajo = new Desocupado()
	var estadoDeAnimo = normal
	var conocimiento = []
	
	constructor(unSexo, unaEdad, unNivelDeFelicidad, amigosDelSim, unaPersonalidad, cantDinero, unSexoDePreferencia){
		sexo = unSexo
		edad = unaEdad
		nivelDeFelicidad = unNivelDeFelicidad
		amigos = amigosDelSim
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
	
	method amigos(){
		return amigos
	}
	
	method dinero(){
		return dinero
	}
	
	method estadoCivil(){
		return estadoCivil
	}
	
	method tipoDeTrabajo(){
		return tipoDeTrabajo
	}
	
	method conocimiento(){
		return conocimiento
	}
	
	method estadoDeAnimo(){
		return estadoDeAnimo
	}
	//SETTERS
	method dinero(cantDinero){
		dinero = cantDinero
	}
	
	method nivelDeFelicidad(unNivelDeFelicidad){
		nivelDeFelicidad = unNivelDeFelicidad
	}
	
	method estadoDeAnimo(unEstadoDeAnimo){
		estadoDeAnimo = unEstadoDeAnimo 
	}
	
	method conocimiento(conocimientos){
		conocimiento = conocimientos
	}
	
	method estadoCivil(unEstadoCivil){
		estadoCivil = unEstadoCivil
	}
	
	method personalidad(){
		return personalidad
	}
	
	// FIN SETTERS
	
	method dineroDeAmigos(){
		return amigos.sum({unAmigo => unAmigo.dinero()})
	}
	
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
	
	method esMasPopularQue(unAmigo){
		return unAmigo.popularidad() < self.popularidad()
	}
	
	method esElMasPopularDeSusAmigos(){
		return amigos.all({unAmigo => !unAmigo.esMasPopularQue(self)})
	}
	
	method esDelSexoDeSuPreferencia(unSim){
		return unSim.sexo() == sexoDePreferencia
	}

	method leAtrae(unSim){
		return self.esDelSexoDeSuPreferencia(unSim) && personalidad.leAtraeA(unSim, self)
	}
	
	method darAbrazoComunA(alguien){
		self.cambiarFelicidadEn(2)
		alguien.cambiarFelicidadEn(4)
	}
	
	method darAbrazoProlongadoA(alguien){
		if(alguien.leAtrae(self)){
			alguien.estadoDeAnimo(soniador)
			soniador.aplicarEstado(alguien)
		}
		else{
			alguien.estadoDeAnimo(incomodidad)
			incomodidad.aplicarEstado(alguien)
		}
	}
	
	method volverALaNormalidad(){
		self.estadoDeAnimo(normal)
	}
	
	method unirAmigos(unSim){
		amigos = (amigos + unSim.amigos()).asSet().asList()
		self.eliminarAmigo(estadoCivil.pareja())
		self.eliminarAmigo(self) 
	}
	
	method meAtraeYLeAtraigo(unSim){
		return self.leAtrae(unSim) && unSim.leAtrae(self)
	}
	
	method ponerEnRelacion(alguien){
		estadoCivil = new Relacion(alguien, amigos)
		alguien.estadoCivil(new Relacion(self, alguien.amigos()))
	}
	
	method iniciarRelacionCon(unSim){
		if (self.meAtraeYLeAtraigo(unSim)){
			self.ponerEnRelacion(unSim)
			self.unirAmigos(unSim)
			unSim.unirAmigos(self)
		}	
	}
	
	method leAtraeUnAmigo(){
		return amigos.any({unAmigo => self.leAtrae(unAmigo)})
	} 
	
	method volverALosAmigosDeSiempre(){
		amigos = estadoCivil.amigosDeSiempre()
	}
	
	method noEstaFuncionandoLaRelacion(){
		if (self.leAtraeUnAmigo() || estadoCivil.pareja().leAtraeUnAmigo()){
			self.volverALosAmigosDeSiempre()
			estadoCivil.pareja().volverALosAmigosDeSiempre()
			estadoCivil.pareja().estadoCivil(soltero)
			estadoCivil = soltero
		}
	}
	
	method consigueTrabajoCopado(){
		tipoDeTrabajo = new Copado(300, 100)
	}
	
	method consigueTrabajoAburrido(){
		tipoDeTrabajo = new Aburrido(600, 200)
	}
	
	method consigueTrabajoMercenario(){
		tipoDeTrabajo = new Mercenario()
	}
	
	method trabajaConTodosSusAmigos(){
		return amigos.all({unAmigo => unAmigo.trabajo() == tipoDeTrabajo})
	}
	
	method irATrabajar(){
		tipoDeTrabajo.pasarUnDiaDeTrabajo(self)
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
		self.conocimiento([])
	}
	
	method esMasRicoQue(unAmigo){
		return unAmigo.dinero() < dinero
	}
	
	method eliminarAmigosMasRicos(){
		amigos = amigos.filter({unAmigo => self.esMasRicoQue(unAmigo)})
	}	
	
	method esAmigoDeMiPareja(unAmigo){		
		var amigosDeSiempreDeLaPareja
		amigosDeSiempreDeLaPareja = estadoCivil.pareja().estadoCivil().amigosDeSiempre()
		return amigosDeSiempreDeLaPareja.contains(unAmigo)
	}
	
	method eliminarAmigosQueSonAmigosDeMiPareja(){
		amigos = amigos.filter({unAmigo => !(self.esAmigoDeMiPareja(unAmigo))})
	}
	
	method eliminarAmigosMasPopulares(){
		amigos = amigos.filter({unAmigo => self.esMasPopularQue(unAmigo)})
	}
	
	method sePoneCelosoPorPlata(){
		var celos
		celos = new CelosPorPlata()
		celos.efectosDeCelos(self)
	}
	
	method sePoneCelosoPorPopularidad(){
		var celos
		celos = new CelosPorPopularidad()
		celos.efectosDeCelos(self)
	}
	
	method sePoneCelosoPorAmigosDeSuPareja(){
		var celos
		celos = new CelosPorAmigoDePareja()
		celos.efectosDeCelos(self)
	}
	
	method obtenerConocimientoDeFuenteDeInformacion(unaFuente, unSim){
		unaFuente.obtenerInformacionDeFuente()
		unSim.agregarConocimiento(self)
	}
}