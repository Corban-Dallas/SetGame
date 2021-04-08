//
//  ContentView.swift
//  SetGame
//
//  Created by Григорий Кривякин on 23.03.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: SetGame
    @State private var isApeared: Bool = false
    
    func randomPositionOffScreen() -> CGSize {
        let angle: Double = Double.random(in: 0.0...360.0)
        let x: Double = cos(angle)
        let y: Double = sin(angle)
        return CGSize(width: 1000 * x, height: 1000 * y)
    }

    
    var body: some View {
        VStack {
            Grid(game.shownCards) { card in
                Group {
                    if isApeared {
                        CardView(card: card)
                            .onTapGesture() {
                                game.chose(card)
                            }
                            .transition(.offset( randomPositionOffScreen() ))
                            .animation(.easeInOut(duration: 1))
                    }
                }
            }
            .onAppear() { isApeared.toggle() }
            
            Text("Scores: \(game.scores)")
                .padding(5.0)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGame()
        ContentView(game: game)
    }
}
