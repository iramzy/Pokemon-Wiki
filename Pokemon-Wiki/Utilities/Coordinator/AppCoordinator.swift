//
//  AppCoordinator.swift
//  Pokemon-Wiki
//
//  Created by Ramzy on 11/27/20.
//

import UIKit

class AppCoordinator: CoordinatorProtocols {
    let window: UIWindow

    var navigationController: UINavigationController?
    
    lazy var rootViewController = {
        return PokemonsViewController(coordinator: self, viewModel: PokemonsViewModel(pokemonsService: PokemonsService()))
    }()
    

    init(window: UIWindow = UIWindow()) {
        self.window = window
    }
    
    
    func start(){
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    
    func dismiss() {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
