//
//  SetGameModel.swift
//  SetGame
//
//  Created by Григорий Кривякин on 23.03.2021.
//

import Foundation

struct SetGameCore {
    var cards: Array<Card>
    var cardsOnTable = [Card]()
    var chosenCards = [Card]()
    
    let numberOfFeatures = 4
    let setSize = 3
    
    init(cardsFeaturesFactory: () -> Array<Dictionary<String, Int>> ) {
        cards = [Card]()
        
        let features = cardsFeaturesFactory()
        for index in features.indices {
            cards.append( Card(features: features[index]) )
        }
        cards.shuffle()
        //numberOfFeatures = content[content.startIndex].count
    }
    
    mutating func chose(_ card: Card) {
        let chosenIndex = cardsOnTable.firstIndex(of: card)!
        
        if cardsOnTable[chosenIndex].isChosen {
            return
        } else {
            cardsOnTable[chosenIndex].isChosen = true
        }
        
        chosenCards.append(card)
        if chosenCards.count == setSize {
            if isSet(cardsToCheck: chosenCards) {
                
            } else {
                chosenCards.removeAll()
            }
        }
    }
    
    // Place 12 cards on table. If there is 12 cards already, add one card.
    mutating func placeCardsOnTable() {
        repeat {
            cardsOnTable.append(cards.removeLast())
        } while cardsOnTable.count < 12
    }
    
    func isSet(cardsToCheck: Array<Card>) -> Bool {
        return true
    }
}
