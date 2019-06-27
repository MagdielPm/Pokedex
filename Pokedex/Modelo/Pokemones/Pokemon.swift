//
//  Pokemon.swift
//  Pokedex
//
//  Created by InternGuest on 6/26/19.
//  Copyright © 2019 InternGuest. All rights reserved.
//

import UIKit

enum PokemonType {
    case fire
    case grass
    case water
    case flying
    case poison
    
    internal var title: String {
        switch self {
        case .fire: return "FIRE"
        case .grass: return "GRASS"
        case .water: return "WATER"
        case .flying: return "FLYING"
        case .poison: return "POISON"
        }
    }
    internal var color: UIColor {
        switch self {
        case .grass: return UIColor.init(displayP3Red: 129/255, green: 190/255, blue: 88/255, alpha: 1.0)
        case .fire: return UIColor.init(displayP3Red: 223/255, green: 122/255, blue: 63/255, alpha: 1.0)
        case .water: return UIColor.init(displayP3Red: 100/255, green: 134/255, blue: 231/255, alpha: 1.0)
        case .flying: return UIColor.init(displayP3Red: 186/255, green: 164/255, blue: 188/255, alpha: 1.0)
        case .poison: return UIColor.init(displayP3Red: 139/255, green: 65/255, blue: 146/255, alpha: 1.0)
        }
    }
    
}

public class Pokemon {
    var number: Int
    var name: String
    var type: [PokemonType]
    var img: UIImage
    
    init (number: Int, name: String, type: [PokemonType], img: UIImage) {
        self.number = number
        self.name = name
        self.type = type
        self.img = img
    }
}
