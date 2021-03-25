//
//  SetGameModel.swift
//  SetGame
//
//  Created by Григорий Кривякин on 23.03.2021.
//

import Foundation
import SwiftUI

class SetGame {
    var core: SetGameCore<Array<Any>>
    
    init() {
        core = SetGameCore() {
            return SetGame.cardsContentFactory()
        }

    }

    static func cardsContentFactory() -> Array<Array<Any>> {
        var content = [Array<Any>]()

        enum Shapes: Equatable, CaseIterable {
            case rectangle
            case circle
            case capsule
        }
        enum Shadings: Equatable, CaseIterable {
            case shade_1
            case shade_2
        }
        let colors = [Color.red, Color.red, Color.green]
        let maxNumberOfShapes = 3

        for shape in Shapes.allCases {
            for color in colors {
                for shading in Shadings.allCases {
                    for count in 1...maxNumberOfShapes {
                        content.append([shape, color, shading, count])
                    }
                }
            }
        }
        return content

    }




}
