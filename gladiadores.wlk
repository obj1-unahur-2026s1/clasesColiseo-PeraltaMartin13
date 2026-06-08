import coliseo.*
import armas.*
import armaduras.*
import grupos.*



class Gladiador {
    var puntosDeVida = 100

    method getPuntosDeVida() = puntosDeVida
    method curar() {puntosDeVida = 100} //Esto me suena raro no deberia hacerlo coliseo. pero como?
    method recibirDamage(unValor) {
        puntosDeVida = (puntosDeVida - unValor).max(0)
    }

    method atacar(unGladiador){
        unGladiador.recibirDamage(self.poderDeAtaque() - unGladiador.defensa())
    }

    method pelear(unGladiador) {
      self.atacar(unGladiador)
      unGladiador.atacar(self)

    }
    method fuerza()
    method defensa() = 0
    method getPuntosDestreza() 
    method poderDeAtaque()
    method crearGrupoCon(unGladiador)
    
}

class Mirmillone inherits Gladiador {
    var armaActual
    var armaduraActual
    const fuerza
    
    override method fuerza() = fuerza
    override method defensa() = armaduraActual.getPuntosArmadura(self) + self.getPuntosDestreza()
    override method getPuntosDestreza() = 15
    override method poderDeAtaque() = fuerza + armaActual.getValorDeAtaque()
    method cambiarArmadura(unaArmadura) {
      armaduraActual = unaArmadura
    }
    method cambiarArma(unArma) {
      armaActual = unArma
    }
    override method crearGrupoCon(unGladiador){
        const grupo = new Grupo(nombre = "mirmillolandia")
        grupo.agregarMiembro(unGladiador)
        grupo.agregarMiembro(self)
        return grupo
    }  
    
    
}

class Dimachaeru inherits Gladiador{
    var destreza
    const armas = []

    method poderDeTodasSusArmas() {
      return  armas.sum({e => e.getValorDeAtaque()})
    }

    method agregarArma(unArma) {
      armas.add(unArma)
    }
    method removerArma(unArma) {
      armas.remove(unArma)
    }

    override method fuerza() = 10
    override method defensa() = destreza / 2 
    override method getPuntosDestreza() = destreza
    override method poderDeAtaque() = self.fuerza() + self.poderDeTodasSusArmas()
    override method atacar(unGladiador) {
      super(unGladiador);
      destreza += 1
    }
    override method crearGrupoCon(unGladiador){
        const grupo = new Grupo(nombre = "D-{self.poderDeAtaque() + unGladiador.poderDeAtaque()}") //PREGUNTAR POR CREAR GRUPOS
        grupo.agregarMiembro(unGladiador)
        grupo.agregarMiembro(self)
        return grupo
    }  

}