class Grupo{
    const nombre
    var cantidadPeleas = 0
    const miembros = #{}
    
    method nombre() = nombre 
    method agregarMiembro(unGladiador) {miembros.add(unGladiador)}
    method eliminarMiembro(unGladiador) {miembros.remove(unGladiador)}
    method getMiembros() = miembros 
    method elegirCampeon(){
        return miembros.filter({e => e.getPuntosDeVida() > 0}).max({e => e.poderDeAtaque()})
    }
    method combatir(otroGrupo) {
      3.times({self.elegirCampeon().pelear(otroGrupo.elegirCampeon())})
      cantidadPeleas +=1
    }


}