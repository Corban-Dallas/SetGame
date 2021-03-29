//
//  File.swift
//  SetGame
//
//  Created by Григорий Кривякин on 28.03.2021.
//

import Foundation

struct Card : Equatable & Hashable {
    let features: Array<Int>
    var isChosen = false
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.features == rhs.features
    }
}

extension Array where Element == Card {
    func containsSet() -> Bool {
        if self.isEmpty { return false }
        
        var uniqueFeatures = Set<Int>()
        
        for index in first!.features.indices {
            self.forEach { uniqueFeatures.insert($0.features[index]) }
            if uniqueFeatures.count == 1 || uniqueFeatures.count == 3 {
                return true
            }
            uniqueFeatures.removeAll()
        }
        return false
    }
}
