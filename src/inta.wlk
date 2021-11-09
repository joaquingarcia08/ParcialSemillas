import plantas.*
import parcelas.*

object inta {
	var property parcelas = #{}
	
	method promedioDePlantas() {
		return parcelas.sum({p => p.plantas().size()}) / parcelas.size()
	}
	method parcelasConMasDeCuatro() {
		return parcelas.filter({p => p.plantas().size() > 4})
	}
	method masAutosustentable() {
		return self.parcelasConMasDeCuatro().max{p => p.cantidadAsociadas()}
	}
}