import criaturas.*
class Colonia {
    const criaturas = []

    method poderOfensivo() = criaturas.sum({c=>c.poderOfensivo()})   

    method cantidadDeCriaturasFormidables() {
        return criaturas.count({ c => c.esFormidable() })
    }

    method atacarA(unArea) {
        if (self.poderOfensivo() > unArea.poderDefensivo()) {
            unArea.esUsurpada(self)
        }
        else {
            criaturas.forEach({ c => c.perderPoderMagico() })
        }
    }
}