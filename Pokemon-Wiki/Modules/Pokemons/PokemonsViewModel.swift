//
//  PokemonsViewModel.swift
//  Pokemon-Wiki
//
//  Created by Ramzy on 11/27/20.
//

import Foundation
import RxSwift
import RxCocoa

protocol PokemonsViewModelOutput {
    func  pokemonViewModelAtIndexPath(_ indexPath: IndexPath) -> PokemonCellViewModel
}

protocol PokemonsViewModelInput { }

class PokemonsViewModel:PokemonsViewModelInput , PokemonsViewModelOutput {

    var pokemons: BehaviorRelay<[PokemonCellViewModel]> = .init(value: [])
    let disposeBag = DisposeBag()
    
    private let pokemonsService: PokemonsServiceProtocols
    
    init(pokemonsService:PokemonsServiceProtocols = PokemonsService()) {
        self.pokemonsService = pokemonsService
    }
    
    func viewDidLoad(){
        fetchPokemonsData()
    }
    
    private func fetchPokemonsData() {
        pokemonsService.fetchPokemons().subscribe { (pokemons) in
            self.pokemons.accept(pokemons.map(PokemonCellViewModel.init))
        }.disposed(by: disposeBag)

    }
    
    
    func pokemonViewModelAtIndexPath(_ indexPath: IndexPath) -> PokemonCellViewModel {
        return pokemons.value[indexPath.row]
    }
    
    func getNumberOfItems() -> Int {
        return pokemons.value.count
    }
}
