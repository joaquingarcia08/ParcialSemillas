import parcelas.*

class Plantas {
	var property anioDeObtencion
	var property altura
	
	method horasAlSolTolera()
	method esFuerte() {
		return self.horasAlSolTolera() > 10
	}
	method daSemillas() {
		return self.esFuerte()
	}
	method espacio()
	method esIdeal(parcela)
	method seAsociaBien(parcela) {
		return parcela.seAsociaBien(self)
	}
}

class Menta inherits Plantas {
	override method horasAlSolTolera() {
		return 6
	}
	override method daSemillas() {
		return super() || altura > 0.4
	}
	override method espacio() {
		return altura * 3
	}
	override method esIdeal(parcela) {
		return parcela.superficie() > 6
	}
}

class Soja inherits Plantas {
	override method horasAlSolTolera() {
		if (altura < 0.5) {
			return 6
		}
		else if (altura.between(0.5,1)) {
			return 7
		}
		else {
			return 9
		}
	}
	override method daSemillas() {
		return super() || (anioDeObtencion > 2007 && altura > 1) 
	}
	override method espacio() {
		return altura / 2
	}
	override method esIdeal(parcela) {
		return parcela.horasAlSol() == self.horasAlSolTolera()
	}
}

class Quinoa inherits Plantas {
	var horasAlSol
	override method horasAlSolTolera() {
		return horasAlSol
	}
	override method daSemillas() {
		return super() || anioDeObtencion < 2005
	}
	override method espacio() {
		return 0.5
	}
	override method esIdeal(parcela) {
		return parcela.plantas().all({p => p.altura() <= 1.5})
	}
}

class SojaTransgenica inherits Soja {
	override method daSemillas() {
		return false
	}
	override method esIdeal(parcela) {
		return parcela.cantidadMaximaDePlantas() == 1
	}
}

class HierbaBuena inherits Menta {
	override method espacio() {
		return super() * 2
	}
}