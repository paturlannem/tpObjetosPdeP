import personalidades.*
import tiposDeTrabajo.*
import estadosDeAnimo.*
import celos.*
import estadoCivil.*
	
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
	
	method personalidad(){
		return personalidad
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
	
	method setDinero(unaCantidadDeDinero){
		dinero = unaCantidadDeDinero
	}
		
	method setPersonalidad(unaPersonalidad){
		personalidad = unaPersonalidad
	}
	
	method setTipoDeTrabajo(unTipoDeTrabajo) {
		tipoDeTrabajo = unTipoDeTrabajo
	}
	
	method setEstadoDeAnimo(unEstadoDeAnimo){
		estadoDeAnimo = unEstadoDeAnimo 
	}
	
	method setConocimiento(conocimientos){
		conocimiento = conocimientos
	}
	
	method setEstadoCivil(unEstadoCivil){
		estadoCivil = unEstadoCivil
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
			alguien.setEstadoDeAnimo(soniador)
			soniador.aplicarEstado(alguien)
		}
		else{
			alguien.setEstadoDeAnimo(incomodidad)
			incomodidad.aplicarEstado(alguien)
		}
	}
	
	method volverALaNormalidad(){
		self.setEstadoDeAnimo(normal)
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
		alguien.setEstadoCivil(new Relacion(self, alguien.amigos()))
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
			estadoCivil.pareja().setEstadoCivil(soltero)
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
		self.setConocimiento([])
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
}

object martin inherits Sim(hombre, 25, 100, [lu, colo, ber,valen,fran,iris], buenazo, 2000, mujer){}
object lu inherits Sim(mujer, 26, 100, [gise, colo,iris,martin], interesado, 100, hombre){}
object gise inherits Sim(mujer, 26, 80, [lu, colo,iris], peleadoConLaVida, 80, hombre){}
object colo inherits Sim(hombre, 27, 20, [martin, ber,fran, valen, lu,gise,iris], interesado, 0, mujer){}
object ber inherits Sim(hombre, 26, 30, [martin,colo,fran,valen], superficial, 50, mujer){}
object fran inherits Sim(hombre, 26, 10, [martin,colo,valen,ber,gise], peleadoConLaVida, 10, mujer){}
object valen inherits Sim(hombre, 24, 50, [martin,colo,fran,ber], interesado, 30, mujer){}
object iris inherits Sim(mujer, 27, 80, [lu,gise,colo,martin], buenazo, 40, hombre){}