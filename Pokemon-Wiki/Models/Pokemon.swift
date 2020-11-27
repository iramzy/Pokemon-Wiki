//
//  Pokemon.swift
//  Pokemon-Wiki
//
//  Created by Ramzy on 11/27/20.
//

import Foundation

struct Pokemon: Decodable {
    let name: String?
    let img: String?
    let height: String?
    let weight: String?
    let type: [String]?
    let weaknesses: [String]?
}
