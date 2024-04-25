object cuentaCorriente{
	var saldoDisponible=0
	method depositar(importe){
		saldoDisponible = saldoDisponible + importe
	}
	
	method extraer(importe){
		saldoDisponible = saldoDisponible - importe
	} 
	
	method saldo() = saldoDisponible
}

object cuentaConGastos{
	var saldoDisponible=0
	method depositar(importe){
		saldoDisponible = (saldoDisponible + importe) - 200
	}
	
	method extraer(importe){
		saldoDisponible=if(importe<=10000)saldoDisponible - importe - 200 
		else saldoDisponible - importe - (importe*0.02)	
	} 
	
	method saldo() = saldoDisponible
}

object cuentaCombinada{
	var cuentaPrimaria
	var cuentaSecundaria
	
	method setCuentaPrimaria(cuenta){
		cuentaPrimaria=cuenta
	}
	
	method setCuentaSecundaria(cuenta){
		cuentaSecundaria=cuenta
	}
	
	method depositar(importe){
		cuentaPrimaria.depositar(importe)
	}
	
	method extraer(importe){
		if(cuentaPrimaria.saldo()>=importe){
			cuentaPrimaria.extraer(importe)
		}else{	
		 	cuentaSecundaria.extraer(importe)	 
		}
	} 
	
	method saldo() = cuentaPrimaria.saldo() + cuentaSecundaria.saldo()
}

