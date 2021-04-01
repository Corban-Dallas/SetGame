//
//  SetGameModel.swift
//  SetGame
//
//  Created by Григорий Кривякин on 23.03.2021.
//

import Foundation
import SwiftUI

class SetGame: ObservableObject {
    @Published private var model: SetGameCore
    
    init() {
        model = SetGameCore(cardsFeaturesFactory: SetGame.cardsFeaturesFactory)
    }

    static func cardsFeaturesFactory() -> Array<Array<Int>> {
        var features = [Array<Int>]()

        enum Shapes: Int, CaseIterable {
            case rectangle = 1, circle, capsule
        }
        enum Shadings: Int, CaseIterable {
            case shading_1 = 1, shading_2, shading_3
        }
        enum Colors: Int, CaseIterable {
            case red = 1, green, blue
        }
        let maxNumberOfShapes = 4
        
        for shape in Shapes.allCases {
            for shading in Shadings.allCases {
                for color in Colors.allCases {
                    for count in 1..<maxNumberOfShapes {
                        features.append([shape.rawValue, shading.rawValue,
                                         color.rawValue, count])
                    }
                }
            }
        }
        return features
    }
    
    public var shownCards: Array<Card> {
        model.shownCards
    }
    
    public func chose(_ card: Card) {
        model.chose(card)
    }
}
