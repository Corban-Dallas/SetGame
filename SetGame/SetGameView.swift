//
//  ContentView.swift
//  SetGame
//
//  Created by Григорий Кривякин on 23.03.2021.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @ObservedObject var game: SetGame
    
    var body: some View {
        VStack {
            Grid(game.shownCards) { card in
                CardView(card: card).onTapGesture() {
                    game.chose(card)
                }
            }
            Text("Scores: \(game.scores)")
                .padding(5.0)
        }
    }
}

struct CardView: View {
    var card: Card
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
            RoundedRectangle(cornerRadius: 25.0)
                .strokeBorder(Color.black, lineWidth: card.isChosen ? 5.0 : 1.0 )
            
            cardContent(with: card.features)
        }
        .padding(5)
        //Text("\(card.isChosen)")

    }
    
    struct cardContent: View {
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
                HStack {
                    Spacer()
                    VStack {
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
                        .rotationEffect(Angle(degrees: 45))
                        
                        .frame(width: symbolWidth*min(geometry.size.height, geometry.size.width),
                               height: symbolHeigh*min(geometry.size.height, geometry.size.width),
                               alignment: .center)
                        Spacer()
                        
                    }
                    Spacer()
                }
                
            }
        }
        // MARK: - Adjust UI constants
        let symbolWidth = CGFloat(0.2)
        let symbolHeigh = CGFloat(0.4)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGame()
        ContentView(game: game)
    }
}
