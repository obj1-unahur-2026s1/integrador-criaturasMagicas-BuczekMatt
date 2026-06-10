import colonias.*

class Area {
    var colonia = new Colonia(criaturas=[])
    method poderDefensivo()

    method esUsurpada(unaColonia) {
        colonia = unaColonia
    }
}

class Castillo inherits Area {
    override method poderDefensivo() {
        return 200 * colonia.cantidadDeCriaturasFormidables()
    }
}

class Claro inherits Area {
    override method poderDefensivo() {
        return 100 + colonia.poderOfensivo()
    }
}