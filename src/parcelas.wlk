import plantas.*

class Parcelas {
	var property ancho
	var property largo
	var property horasAlSol
	var property plantas
	
	method superficie() {
		return ancho * largo
	}
	method cantidadMaximaDePlantas() {
		if (ancho > largo) {
			return self.superficie() / 5
		}
		else {
			return self.superficie() / 3 + largo
		}
	}
	method tieneComplicaciones() {
		return plantas.any({p => p.horasAlSolTolera() < horasAlSol})
	}
	method hayLugar() {
		return self.cantidadMaximaDePlantas() > self.plantas().size()
	}
	method recibeMasSolQue(planta) {
		return (planta.horasAlSolTolera() - horasAlSol).abs() >= 2
	}
	method plantar(planta) {
		if (!self.hayLugar() && self.recibeMasSolQue(planta)) {
			self.error("No se puede plantar")
		}
		else {
			plantas.add(planta)
		}
	}
	method seAsociaBien(planta)
	method cantidadAsociadas() {
		return plantas.map{p => p.seAsociaBien(self)}.size()
	}		 	
}

class Ecologica inherits Parcelas {
	override method seAsociaBien(planta) {
		return !self.tieneComplicaciones() && planta.esIdeal(self)
	}
}

class Industrial inherits Parcelas {
	override method seAsociaBien(planta) {
		return self.cantidadMaximaDePlantas() == 2 && planta.esFuerte()
	}
}