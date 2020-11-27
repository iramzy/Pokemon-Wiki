//
//  PokemonsViewController.swift
//  Pokemon-Wiki
//
//  Created by Ramzy on 11/27/20.
//

import UIKit
import RxCocoa
import RxSwift

class PokemonsViewController: UIViewController {
    @IBOutlet weak var pokemonsTableView: UITableView!
    
    var coordinator: CoordinatorProtocols
    var viewModel: PokemonsViewModel
    
    lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()
    
    init(coordinator: CoordinatorProtocols, viewModel: PokemonsViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: "PokemonsViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        viewModel.viewDidLoad()
    }
    
   private func bind(viewModel: PokemonsViewModel) {
        viewModel.pokemons.subscribe {[weak self] (_) in
            self?.pokemonsTableView.reloadData()
        }.disposed(by: disposeBag)
    }
    
    private func tableViewSetup(){
        pokemonsTableView.dataSource = self
        pokemonsTableView.delegate = self
        pokemonsTableView.registerCellNib(cellClass: PokemonTableViewCell.self)
    }
}

extension PokemonsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as PokemonTableViewCell
        cell.configure(viewModel.pokemonViewModelAtIndexPath(indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}
