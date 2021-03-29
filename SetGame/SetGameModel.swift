//
//  SetGameModel.swift
//  SetGame
//
//  Created by Григорий Кривякин on 23.03.2021.
//

import Foundation

struct SetGameCore {
    var cardsInDeck = [Card]()
    var shownCards = [Card]()
    var chosenCards = [Card]()
    
    let numberOfFeatures = 4
    let setSize = 3
    
    init(cardsFeaturesFactory: () -> Array<Array<Int>> ) {
        for features in cardsFeaturesFactory() {
            cardsInDeck.append( Card(features: features) )
        }
        cardsInDeck.shuffle()
    }
    
    mutating func chose(_ card: Card) {
        let chosenIndex = shownCards.firstIndex(of: card)!
        if shownCards[chosenIndex].isChosen {
            shownCards[chosenIndex].isChosen = false
            return
        }
        
        shownCards[chosenIndex].isChosen = true
        chosenCards.append(card)
            
        if chosenCards.count == setSize {
            if chosenCards.containsSet() {
                shownCards.removeAll(where: { $0.isChosen })
                placeCardsOnTable()
            } else {
                for index in shownCards.indices {
                    shownCards[index].isChosen = false
                }
            }
            chosenCards.removeAll()
        }
    }
    
    // Add cards on table while there are atleast 12 card and one set.
    mutating func placeCardsOnTable() {
        repeat {
            shownCards.append(cardsInDeck.removeLast())
        } while shownCards.count < 12 && shownCards.containsSet() && !cardsInDeck.isEmpty
    }
}
