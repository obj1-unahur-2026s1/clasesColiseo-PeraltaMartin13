object coliseo {
    const grupos = #{}

    method curarGrupo(unGrupo) {
        unGrupo.getMiembros().forEach({e => e.curar()})
    }
    method getGrupos() = grupos 

    method curarGladiador(unGladiador) {
      unGladiador.curar()
    }

    method combatirEntreGrupos(grupo1, grupo2) {
      grupo1.combatir(grupo2)
    }

    method combatirGrupoContraGladiador(unGrupo, unGladiador) {
      unGrupo.elegirCampeon().pelear(unGladiador)
    }
}