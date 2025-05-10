object dominic {
    const autos = []

    method comprar(unAuto) {autos.add(unAuto)}
    method autosNoEnCondiciones() = autos.filter({auto => !auto.enCondiciones()})
    method autosEnCondiciones() = autos.filter({auto => auto.enCondiciones()})
    method mandarAutosAlTaller() {
        taller.recibirAutos(self.autosNoEnCondiciones())
    }
    method realizarPruebasDeVelocidad() {
        autos.forEach({auto => auto.hacerPrueba()})
    }
    method venderAutos() {
        autos.clear()
    }
    method promedioVelocidades() = autos.sum({auto => auto.velocidadMaxima()}) / autos.size()
    method masRapido() = autos.autosEnCondiciones().max({auto => auto.velocidadMaxima()})
    method hayUnAutoMuyRapido() = self.masRapido().velocidadMaxima() > 2 * self.promedioVelocidades()
}

object taller {
    const autosAReparar = []

    method recibirAutos(listaDeAutos) {
        autosAReparar.addAll(listaDeAutos)
    }
    method reparaAutos() {
        autosAReparar.forEach({auto => auto.reparar()})
        autosAReparar.clear()
    }
}

object ferrari {
    var motor = 87

    method enCondiciones() = motor >= 65
    method reparar() {motor = 100}
    method velocidadMaxima() = 100 + if(motor > 75) 15 else 0
    method hacerPrueba() {motor = (motor - 30).max(0)}
}

object flecha {
    var cantidadLitrosCombustible = 100
    var property combustible = gasolina
    var color = azul

    method enCondiciones() = 
        cantidadLitrosCombustible > combustible.nivelMinimo()
        &&
        color == rojo

    method hacerPrueba() {cantidadLitrosCombustible = (cantidadLitrosCombustible - 5).max(0)}
    method reparar() {cantidadLitrosCombustible * 2 color = color.cambiarDeColor()}
    method velocidadMaxima() {
        return cantidadLitrosCombustible * 2 + combustible.calculoAdicional(cantidadLitrosCombustible)
    }
}

object intocable {
    var property enCondiciones = true

    method hacerPrueba() {enCondiciones = false}
    method reparar() {enCondiciones = true}
    method velocidadMaxima() = 45
}


object gasolina {
    method nivelMinimo() = 85
    method calculoAdicional(litros) = 10
}

object nafta {
    method nivelMinimo() = 50
    method calculoAdicional() = 10
    method calculoAdicional(litros) = -1 * (litros * 2) * 0.10
}

object nitrogeno {
    method nivelMinimo() = 0
    method calculoAdicional(litros) = (litros * 2) * 10
}

object azul {
    method cambiarDeColor() = verde
}

object rojo {
    method cambiarDeColor() = azul
}

object verde {
      method cambiarDeColor() = rojo
}