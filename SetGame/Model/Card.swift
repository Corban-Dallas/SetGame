//
//  File.swift
//  SetGame
//
//  Created by Григорий Кривякин on 28.03.2021.
//

import Foundation

struct Card: Identifiable {
    let id: Int
    let features: Array<Int>
    var isChosen: Bool = false
    // This property says does this card make up a set with two other chosen cards.
    // If chosen less than three cards or the card is not among chosen the value is nil.
    var inSet: Bool?
}

// Check if there is a set in the given array of cards
extension Array where Element == Card {
    func containsSet() -> Bool {
        if self.count < 3 { return false }
        
        var isSet: Bool
        var uniqueFeatures = Set<Int>()
        
        for i in 0..<count-2 {
            for j in i+1..<count-1 {
                for k in j+1..<count {
                    isSet = true
                    for l in 0..<4 {
                        uniqueFeatures.insert(self[i].features[l])
                        uniqueFeatures.insert(self[j].features[l])
                        uniqueFeatures.insert(self[k].features[l])
                        if uniqueFeatures.count == 2 { isSet = false }
                        uniqueFeatures.removeAll()
                    }
                    if isSet { return true }
                }
            }
        }
        return false
    }
}

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
