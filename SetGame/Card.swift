//
//  File.swift
//  SetGame
//
//  Created by Григорий Кривякин on 28.03.2021.
//

import Foundation

struct Card : Equatable {
    let features: Dictionary<String, Int>
    var isChosen = false
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.features == rhs.features
    }
    
    
}
