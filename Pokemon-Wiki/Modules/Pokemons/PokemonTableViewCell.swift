//
//  PokemonTableViewCell.swift
//  Pokemon-Wiki
//
//  Created by Ramzy on 11/27/20.
//

import UIKit
import SDWebImage

class PokemonTableViewCell: UITableViewCell {
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ viewModel: PokemonCellViewModel) {
        guard let imageURL = URL(string: viewModel.image) else {return}
        self.pokemonImage.sd_setImage(with: imageURL)
        self.pokemonName.text = viewModel.name
        self.pokemonHeight.text = viewModel.height
        self.pokemonWeight.text = viewModel.weight
    }
}
