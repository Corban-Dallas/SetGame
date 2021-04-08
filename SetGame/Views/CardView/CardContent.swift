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
                Spacer()
                ForEach(0..<count) { _ in
                    switch shape {
                    case 1:
                        Rectangle()
                            .fill(color)
                            .opacity(opacity)
                            .border(color)
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
                .padding(5)
                .frame(width: geometry.size.width / 2.0,
                       height: geometry.size.height / 5)
                .rotationEffect(Angle(degrees: 45))
                .offset(x: geometry.size.width/4.0)
                Spacer()
            }
        }
    }
}

struct CardContent_Previews: PreviewProvider {
    static var previews: some View {
        let game: SetGame = SetGame()
        CardContent(with: game.shownCards[0].features)
    }
}
