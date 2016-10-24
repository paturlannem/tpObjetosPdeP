import sims.*

object libro {
	var capitulos = []
	method obtenerInformacionDeFuente () {
		 return capitulos.anyone()
	}
}

object simChismoso {
	var listaDeAmigosDeSimChismoso = []
	method obtenerInformacionDeFuente () {
		return (listaDeAmigosDeSimChismoso.anyone()).conocimiento().anyone()  // Deberia devolver un conocimiento de un amigo del sim chismoso
	}
}

object mirarProgramaDeTinelli {
	method obtenerInformacionDeFuente(){
		return "Toto"
	}
}

object mirarProgramaDeRial {
	method obtenerInformacionDeFuente(){
		return "Escandalo"
	}
}