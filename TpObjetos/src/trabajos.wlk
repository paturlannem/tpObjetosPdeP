class Trabajos {
	var empleados = []
	var remuneracion
	var felicidadQueGenera
	
	constructor(listaDeEmpleados, unaRemuneracion, unaFelicidadQueGenera){
		empleados = listaDeEmpleados
		remuneracion = unaRemuneracion
		felicidadQueGenera = unaFelicidadQueGenera
	}
	
	method empleados(){
		return empleados
	}
	
	method remuneracion(){
		return remuneracion
	}
	
	method felicidadQueGenera(){
		return felicidadQueGenera
	}
	
	method setEmpleados(listaDeEmpleados){
		 empleados = listaDeEmpleados
	}
	
	method setRemuneracion(unaRemuneracion){
		 remuneracion = unaRemuneracion
	}
	
	method setFelicidadQueGenera(unaFelicidadQueGenera){
		 felicidadQueGenera = unaFelicidadQueGenera
	}
	
}

object contador inherits Trabajos([], 2000, 5){}
object medico inherits Trabajos([], 2500, 5){}
object vago inherits Trabajos([], 0, 0){}