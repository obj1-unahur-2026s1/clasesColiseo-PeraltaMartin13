class Arma {
    method getValorDeAtaque()
}

class ArmaDeFilo inherits Arma {
  const longitud
  const filo
  
  override method getValorDeAtaque()  = filo * longitud
}

class ArmaContundente inherits Arma{
    const peso
    
    override method getValorDeAtaque()  = peso
}