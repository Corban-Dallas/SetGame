//
//  ContentView.swift
//  SetGame
//
//  Created by Григорий Кривякин on 23.03.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: SetGame
    
    var body: some View {
        VStack {
            Grid(game.shownCards) { card in CardView(card: card) }
                .padding(5.0)
        }
    }
}

struct CardView: View {
    var card: Card
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                .stroke(Color.blue, lineWidth: 1.0)
            cardContent(with: card.features)
        }
        .padding(5)
    }
    
    struct cardContent: View {
        let shape, shading, count: Int
        let color: Color

        init(with features: Array<Int>) {
            shape = features[0]
            shading = features[1]
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
                                    .aspectRatio(1, contentMode: .fit)
                            case 2:
                                Circle()
                                    .fill(color)
                            case 3:
                                Capsule()
                                    .fill(color)
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
