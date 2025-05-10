import combustibles.*
import colores.*

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

object torrente {
    var motor = 75
    var property combustible = gasolina
    var cantidadLitrosCombustible = 80
    var color = azul
    var estaActivadoTurbo = false

    method enCondiciones() = 
        cantidadLitrosCombustible >= combustible.nivelMinimo()
        &&
        estaActivadoTurbo
    method reparar() {
        cantidadLitrosCombustible = (cantidadLitrosCombustible + 50).min(100)
        color = color.cambiarDeColor()
        estaActivadoTurbo = true
    }
    method hacerPrueba() {cantidadLitrosCombustible = (cantidadLitrosCombustible - 15).max(0) motor = (motor - (motor * 0.10)).max(0)}
    method velocidadMaxima() = 90 + combustible.calculoAdicional() + if (estaActivadoTurbo) 20 else 0
}


