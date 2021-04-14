//
//  CardContent.swift
//  SetGame
//
//  Created by Григорий Кривякин on 08.04.2021.
//

import SwiftUI

struct CardContent: View {
    let shape, count: Int
    let opacity: Double
    let color: Color

    init(with features: Array<Int>) {
        shape = features[0]
        switch features[1] {
        case 1:
            opacity = 0.0
        case 2:
            opacity = 0.5
        case 3:
            opacity = 1.0
        default:
            opacity = 1.0
        }
        switch features[2] {
        case 1:
            color = Color.red
        case 2:
            color = Color.green
        case 3:
            color = Color.blue
        default:
            color = Color.black
        }
        count = features[3]
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack() {
                Spacer(minLength: 0)
                ForEach(0..<count) { _ in
                    switch shape {
                    case 1:
                        Dimond()
                            .fill(color)
                            .opacity(opacity)
                            .background(Dimond().stroke(color))
                            .aspectRatio(1, contentMode: .fit)
                            
                    case 2:
                        Circle()
                            .fill(color)
                            .opacity(opacity)
                            .background(Circle().strokeBorder(color))
                    case 3:
                        Capsule()
                            .fill(color)
                            .opacity(opacity)
                            .background(Capsule().strokeBorder(color))
                    default:
                        EmptyView()
                    }
                }
                .frame(width: geometry.size.height / 2.5,
                       height: geometry.size.height / 4.0)
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct CardContent_Previews: PreviewProvider {
    static var previews: some View {
        let game: SetGame = SetGame()
        CardContent(with: game.shownCards[0].features)
    }
}
