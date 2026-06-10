class Criatura {
    var poderMagico
    const astucia
    var rol

    method astucia() = astucia
    method poderMagico() = poderMagico

    method poderOfensivo() {
        return poderMagico * 10 + rol.bonusOfensivo()
    }

    method esFormidable() {
        return self.esAstuto() || self.esExtraordinario()
    }

    method esAstuto()
    method esExtraordinario() {
        return rol.exExtraordinario(self)
    }

    method cambiarRol() {
        rol = rol.cambiarRol()
    }

    method perderPoderMagico() {
        poderMagico = poderMagico * 0.85
    }
}

class Hada inherits Criatura {
    var kilometrosQuePuedeVolar = 2

    method kilometrosPuedeVolar() {
        return kilometrosQuePuedeVolar
    }
    method aumentarKilometrosQuePuedeVolar(cantidad) {
        kilometrosQuePuedeVolar = (kilometrosQuePuedeVolar + cantidad).min(25)
    }

    override method esAstuto() {
        return astucia>50 
    }

    override method esExtraordinario() {
        return super() && self.kilometrosPuedeVolar()>10
    }
}

class Duende inherits Criatura {
    override method poderOfensivo() {
        return super() * 1.1
    }
    override method esAstuto() {return false}
}

/// Roles
object guardian {
    method bonusOfensivo() {
        return 100
    }
    method esExtraordinario(unaCriatura) {
        return unaCriatura.poderMagico()>50
    }
    method cambiarRol() {
        return new Domador(mascotas=[new Mascota(edad=1,tieneCuernos=false)])
    }
}
object hechicero {
    method bonusOfensivo() {
        return 0
    }
    method esExtraordinario(unaCriatura) {
        return true
    }
    method cambiarRol() {
        return guardian
    }
}
class Domador {
    const mascotas = []

    method bonusOfensivo() {
        return self.cantidadDeMascotasConCuernos() * 150
    }

    method añadirMascota(unaMascotaMitologica) {
        mascotas.add(unaMascotaMitologica)
    }

    method cantidadDeMascotasConCuernos() {
        return mascotas.count({ m => m.tieneCuernos() })
    }  
    method esExtraordinario(unaCriatura) {
        return unaCriatura.poderMagico()>=15 && self.todasLasMascotasSonVeteranas()
    }
    method todasLasMascotasSonVeteranas() {
      return mascotas.all({ m => m.edad()>=10 })
    }
    method cambiarRol() {
        if (self.cantidadDeMascotasConCuernos() >0) {
            return guardian
        }
        else {
            self.error("Error en el Ritual")
        }
    }
}

class Mascota {
    const property edad  
    const property tieneCuernos = false

}
