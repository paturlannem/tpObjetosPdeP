import personalidades.*
import sims.*
	
class Prestamos {

		var valoracionPrestamo		
		var monto

	method prestamoBase (unSim, unAmigo, cantidad){
		if (((unAmigo.cantDinero()) > monto) && (monto < valoracionPrestamo) && (unSim.cantDinero() > monto)) {
			unSim.cantDinero(unAmigo.cantDinero() - monto)
			unAmigo.cantDinero(unAmigo.cantDinero() + monto)
			}
		return unAmigo.cantDinero()
		}
		
	method prestamoInteresado(unSim, unAmigo, cantidad){
		monto = cantidad
		valoracionPrestamo = (interesado.obtenerValoracionDeAlquilar(unAmigo) * 10)
		prestamoBase (unSim, unAmigo, cantidad)
		}
	
	method prestamo(unSim, unAmigo, cantidad){
		monto = cantidad
		if (unSim.unaPersonalidad() = superficial){
			valoracionPrestamo = superficial.obtenerValoracionDeAlguien(unAmigo) * 10
			prestamoBase(unSim, unAmigo, cantidad)
		}
		else { 
			if (unSim.unaPersonalidad() = buenazo){
			valoracionPrestamo = buenazo.obtenerValoracionDeAlguien(unAmigo) * 10	
			prestamoBase(unSim, unAmigo, cantidad)
		}
			else (unSim.unaPersonalidad() = peleadoConLaVida){
				valoracionPrestamo = peleadoConLaVida.obtenerValoracionDeAlguien(unAmigo) * 10
				prestamoBase (unSim, unAmigo, cantidad)
			}
		}
	}
}