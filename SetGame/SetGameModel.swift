//
//  SetGameModel.swift
//  SetGame
//
//  Created by Григорий Кривякин on 23.03.2021.
//

import Foundation

struct SetGameCore<CardContent> where CardContent: Collection & Equatable {
    var cards: Array<Card>
    var chosenCards = [Card]()
    let numberOfFeatures = 4
    let setSize = 3
    
    init(cardsContentFactory: () -> Array<CardContent> ) {
        cards = [Card]()
        let content = cardsContentFactory()
        for index in content.indices {
            cards.append( Card(content: content[index]) )
        }
        //numberOfFeatures = content[content.startIndex].count
    }
    
    mutating func chose(_ card: Card) {
        let chosenIndex = cards.firstIndex(of: card)!
        cards[chosenIndex].isChosen = true
        if !chosenCards.contains(card) {
            chosenCards.append(card)
        }
        if chosenCards.count == setSize {
            if isSet(cardsToCheck: chosenCards) {
                
            }
        }
    

        
        
        
    }
    
    func isSet(cardsToCheck: Array<Card>) -> Bool {
        var features = [Any]()
        var index: CardContent.Index
        
        for featureIndex in 0..<numberOfFeatures {
            for card in cardsToCheck {
                index = card.content.index(card.content.startIndex, offsetBy: featureIndex)
                features.append(card.content[index])
            }
        }
        return true
    }

    struct Card: Equatable {
        let content: CardContent
        var isChosen = false

        static func == (a: Card, b: Card) -> Bool {
            return a.content == b.content
        }
    }
}
