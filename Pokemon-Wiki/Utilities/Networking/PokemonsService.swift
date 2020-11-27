//
//  PokemonsService.swift
//  Pokemon-Wiki
//
//  Created by Ramzy on 11/27/20.
//

import Foundation
import RxSwift

enum PokemonError: String, Error {
    case fileError = "File cannot be found"
    case decodingError = "The data  can not be decoded"
}

protocol PokemonsServiceProtocols {
    func fetchPokemons() -> Observable<[Pokemon]>
}

class PokemonsService:PokemonsServiceProtocols {

    func fetchPokemons() -> Observable<[Pokemon]> {
        
        return Observable.create { (observer) -> Disposable in
            guard let url = Bundle.main.url(forResource: "PokemonsData", withExtension: "json") else {
                observer.onError(PokemonError.fileError)
                return Disposables.create()
            }
            
            do {
                let data = try Data(contentsOf: url)
                let pokemons = try JSONDecoder().decode([Pokemon].self, from: data)
                observer.onNext(pokemons)
            } catch {
                observer.onError(PokemonError.decodingError)
            }
            return Disposables.create()
        }
    }
}
