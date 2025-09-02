object pepe {
	var property categoriaActual = desempleado
	var property bonoResultadosActual = bonoResultadosNulo
	var property bonoPresentismoActual = bonoPresentismoNulo
	var property faltas = 0

	method neto() = categoriaActual.neto()

	method sueldo() {
		const netoLocal = self.neto()
		const montoResultados = self.bonoResultadosActual().montoPara()
		const montoPresentismo = self.bonoPresentismoActual().montoPara()
		return netoLocal + montoResultados + montoPresentismo
	}
}

// Categorías
object cadete {
	const property neto = 20000 
}
object gerente {
	const property neto = 15000
}
object desempleado {
	const property neto = 0 
}

// Bonos por resultados
object bonoResultadosPorcentaje {
	method montoPara(persona) {
		return persona.neto() / 10
	}
}
object bonoResultadosMontoFijo {
	method montoPara(persona) {
		return 800
	}
}
object bonoResultadosNulo {
	method montoPara(persona) {
		return 0
	}
}


// Bonos por presentismo
object bonoPresentismoNormal {
	method montoPara(persona) {
		if (persona.faltas() == 0) {
			return 2000
		}
		if (persona.faltas() == 1) {
			return 1000
		}
		return 0
	}
}
object bonoPresentismoAjuste {
	method montoPara(persona) {
		if (pepe.faltas() == 0) {
			return 100
		}
		return 0
	}
}
object bonoPresentismoDemagogico {
	method montoPara(persona) {
		if (pepe.neto() < 18000) {
			return 500
		}
		return 300
	}
}
object bonoPresentismoNulo {
	method montoPara(persona) {
		return 0
	}
}