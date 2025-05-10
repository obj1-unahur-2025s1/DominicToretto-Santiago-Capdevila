object gasolina {
    method nivelMinimo() = 85
    method calculoAdicional(litros) = 10
}

object nafta {
    method nivelMinimo() = 50
    method calculoAdicional(litros) = -1 * (litros * 2) * 0.10
}

object nitrogeno {
    method nivelMinimo() = 0
    method calculoAdicional(litros) = (litros * 2) * 10
}