import gladiadores.*


class Armadura {
  method getPuntosArmadura(unLuchador)
}

class Casco inherits Armadura {
  override method getPuntosArmadura(unLuchador) = 10
}

class Escudo inherits Armadura {
  override method getPuntosArmadura(unLuchador) = 5 + (unLuchador.getPuntosDestreza() * 0.10)
}