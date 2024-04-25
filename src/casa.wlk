import cosas.* //obviamente, vamos a usar los objetos del archivo cosas ;-)
import cuentasBancarias.*

object casaDePepeYJulian {
	const cosas = []
	var cuentaUtilizada
	
	method setCuentaAUtilizar(cuenta){
		cuentaUtilizada = cuenta
	}
	
	method gastar(importe){
		cuentaUtilizada.extraer(importe)
	}
	
	method dineroDisponible() = cuentaUtilizada.saldo()
	
	method comprar(cosa){
		cosas.add(cosa)
		self.gastar(cosa.precio())
	}
	
	method cantidadDeCosasCompradas() = cosas.size()
	
	method tieneComida() = cosas.any({cosa=>cosa.esComida()})
	
	method vieneDeEquiparse() = cosas.last().esElectrodomestico() or
	cosas.last().precio() > 50000
	
	method esDerrochona() = cosas.sum({cosa=>cosa.precio()})>=90000
	
	method compraMasCara() = cosas.max({cosa=>cosa.precio()})
	
	method electrodomesticosComprados() = cosas.filter({cosa=>cosa.esElectrodomestico()})
	
	method malaEpoca() = cosas.all({cosa=>cosa.esComida()})
	
	method queFaltaComprar(lista) = lista.asSet().difference(cosas)
	
	method faltaComida() = cosas.count({cosa=>cosa.esComida()})<2
}





