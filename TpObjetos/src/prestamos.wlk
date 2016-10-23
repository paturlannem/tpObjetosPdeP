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
		valoracionPrestamo = (interesado.obtenerValoracionDeAlguien(unAmigo) * 10)
		return self.prestamoBase(unSim, unAmigo, cantidad)
		}
	
	method prestamo(unSim, unAmigo, cantidad){
		monto = cantidad
		if (unSim.unaPersonalidad() == superficial){
			valoracionPrestamo = superficial.obtenerValoracionDeAlguien(unAmigo) * 10
			return self.prestamoBase(unSim, unAmigo, cantidad)
		}
		else { 
			if (unSim.unaPersonalidad() == buenazo){
			valoracionPrestamo = buenazo.obtenerValoracionDeAlguien(unAmigo) * 10	
			return self.prestamoBase(unSim, unAmigo, cantidad)
		}
			else{ 
				if(unSim.Personalidad() == peleadoConLaVida){
				valoracionPrestamo = peleadoConLaVida.obtenerValoracionDeAlguien(unAmigo) * 10
				return self.prestamoBase (unSim, unAmigo, cantidad)
				}
				else return "no le presta dinero"
			}
		}
	}
}
