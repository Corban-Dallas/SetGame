//
//  SetGameModel.swift
//  SetGame
//
//  Created by Григорий Кривякин on 23.03.2021.
//

import Foundation

struct SetGameCore<CardContent> where CardContent: Collection {
    var cards: Array<Card>
    let numberOfFeatures: Int
    
    init(cardsContentFactory: () -> Array<CardContent> ) {
        cards = [Card]()
        let content = cardsContentFactory()
        for index in content.indices {
            cards.append( Card(content: content[index]) )
        }
        numberOfFeatures = content[content.startIndex].count
    }

    struct Card {
        let content: CardContent
        var isChosen = false
    }
}


