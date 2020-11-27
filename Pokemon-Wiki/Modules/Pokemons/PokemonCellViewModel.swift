//
//  PokemonCellViewModel.swift
//  Pokemon-Wiki
//
//  Created by Ramzy on 11/27/20.
//

import Foundation

class PokemonCellViewModel  {
    var name: String
    var image: String
    var height: String
    var weight: String
    
    init(_ pokemon: Pokemon) {
        self.name = pokemon.name ?? ""
        self.image = pokemon.img ?? ""
        self.height = pokemon.height ?? ""
        self.weight = pokemon.weight ?? ""
    }
}
