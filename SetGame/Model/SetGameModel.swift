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
    private var chosenCards: Array<Card> {
        shownCards.filter { $0.isChosen }
    }

    init(cardsFeaturesFactory: () -> Array<Array<Int>> ) {
        let features = cardsFeaturesFactory()
        for index in features.indices {
            cardsInDeck.append( Card(id: index, features: features[index]) )
        }
        //cardsInDeck.shuffle()
        dealCards(number: 12)
    }
    
    mutating func chose(_ card: Card) {
        print(card)
        //
        if chosenCards.count == 3 && !chosenCards.containsSet() {
            shownCards.indices.forEach {
                if shownCards[$0].isChosen {
                    shownCards[$0].isChosen = false
                    shownCards[$0].inSet = nil
                }
            }
        }
        
        // Check if the player tries to choose an unplayable card
        let chosenIndex = shownCards.firstIndex(matching: card)!
        if shownCards[chosenIndex].inSet != nil {
            return
        }

        // Choose or unchoose the card by setting right value of card property
        shownCards[chosenIndex].isChosen = !shownCards[chosenIndex].isChosen
        
        // Properly set the value of "inSet" of chosen cards if 3 cards are chosen
        if chosenCards.count == 3 {
            if chosenCards.containsSet() {
                for index in shownCards.indices {
                    if shownCards[index].isChosen {
                        shownCards[index].inSet = true
                        shownCards[index].isChosen = false
                    }
                }
            } else {
                for index in shownCards.indices {
                    if shownCards[index].isChosen {
                        shownCards[index].inSet = false
                    }
                }
            }
            
        }
    }
    
    // Add cards on table while there are atleast 12 card and one set.
    mutating func dealCards(number: Int) {
        for _ in 0..<number {
            if cardsInDeck.isEmpty { return }
            shownCards.append(cardsInDeck.removeLast())
        }
    }
    // Remove founded sets from table
    mutating func removeFoundedSets() {
        shownCards.removeAll(where: { card in
            if let inSet = card.inSet {
                return inSet
            } else { return false }
        })
    }
}
