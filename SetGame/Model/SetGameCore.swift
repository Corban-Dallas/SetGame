//
//  SetGameMCore.swift
//  SetGame
//
//  Created by Григорий Кривякин on 23.03.2021.
//

import Foundation

struct SetGameCore {
    private(set) var deck = [Card]()
    private(set) var shownCards = [Card]()
    private var chosenCards: Array<Card> {
        shownCards.filter { $0.isChosen }
    }
    private var features: [[Int]]

    init(cardsFeaturesFactory: () -> Array<Array<Int>> ) {
        features = cardsFeaturesFactory()
    }
    
    mutating func chose(_ card: Card) {
        print(card)
        // Remove or unselect 3 chosen cards
        if chosenCards.count == 3 {
            if chosenCards.containsSet() {
                shownCards.removeAll(where: { $0.inSet ?? false })
            } else {
                chosenCards.forEach { card in
                    if let index = shownCards.firstIndex(matching: card) {
                        shownCards[index].inSet = nil
                        shownCards[index].isChosen = false
                    }
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
            chosenCards.forEach { card in
                if let index = shownCards.firstIndex(matching: card) {
                    shownCards[index].inSet = chosenCards.containsSet() ? true : false
                }
            }
        }
    }
    
    // Add cards on table while there are atleast 12 card and one set.
    mutating func dealCards(number: Int) {
        for _ in 0..<number {
            if deck.isEmpty { return }
            shownCards.append(deck.removeLast())
        }
    }
    
    mutating func startNewGame() {
        deck.removeAll()
        shownCards.removeAll()
        for index in features.indices {
            deck.append( Card(id: index, features: features[index]) )
        }
        deck.shuffle()
        dealCards(number: 12)
    }
}
