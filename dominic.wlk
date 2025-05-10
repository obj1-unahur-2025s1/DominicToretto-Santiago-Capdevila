import autos.*
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