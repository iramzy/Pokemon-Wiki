//
//  NavigatorProtocols.swift
//  Pokemon-Wiki
//
//  Created by Ramzy on 11/27/20.
//

import UIKit

enum NavigatorTypes {
    case push
    case root
}

protocol NavigatorProtocols {
    associatedtype Destination
    func viewController(for destination: Destination, coordinator: CoordinatorProtocols) -> UIViewController
    init(coordinator: CoordinatorProtocols)
    var coordinator: CoordinatorProtocols { get }
    func navigate(to destination: Destination, with navigationType: NavigatorTypes)
}

extension NavigatorProtocols {
    func navigate(to destination: Destination,
                  with navigationType: NavigatorTypes = .push) {
        let viewController = self.viewController(for: destination, coordinator: coordinator)
        switch navigationType {
        case .push:
            coordinator.navigationController?.pushViewController(viewController, animated: true)
      
        case .root:
            coordinator.navigationController?.setViewControllers([viewController], animated: true)
        }
    }
}
