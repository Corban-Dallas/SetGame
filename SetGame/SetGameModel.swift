//
//  SetGameModel.swift
//  SetGame
//
//  Created by Григорий Кривякин on 23.03.2021.
//

import Foundation

struct SetGameCore {
    private(set) var cardsInDeck = [Card]()
    private(set) var shownCards = [Card]()
    private(set) var chosenCards = [Card]()
    
    let numberOfFeatures = 4
    let setSize = 3
    var scores = 0
    
    init(cardsFeaturesFactory: () -> Array<Array<Int>> ) {
        let features = cardsFeaturesFactory()
        for index in features.indices {
            cardsInDeck.append( Card(features: features[index], id: index) )
        }
        cardsInDeck.shuffle()
        placeCardsOnTable()
    }
    
    mutating func chose(_ card: Card) {
        let chosenIndex = shownCards.firstIndex(matching: card)!
        print("\(card), index: \(chosenIndex)")
        
        if !shownCards[chosenIndex].isChosen {
            shownCards[chosenIndex].isChosen = true
            chosenCards.append(card)
        }
        else {
            shownCards[chosenIndex].isChosen = false
            chosenCards.removeAll(where: { $0.id == card.id} )
        }
        
        if chosenCards.count == setSize {
            if chosenCards.containsSet() {
                shownCards.removeAll(where: { $0.isChosen })
                placeCardsOnTable()
                scores += 1
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
            if cardsInDeck.isEmpty {
                break
            }
            shownCards.append(cardsInDeck.removeLast())
        } while !(shownCards.count > 11 && shownCards.containsSet() && !cardsInDeck.isEmpty)
        print("\(shownCards.count) cards on table now.")
    }
}
