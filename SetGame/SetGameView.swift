//
//  ContentView.swift
//  SetGame
//
//  Created by Григорий Кривякин on 23.03.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game: SetGame
    @State private var isApeared: Bool = false
    
    var body: some View {
        VStack {
            Grid(game.shownCards) { card in
                CardView(card: card)
                    .transition(.offset( randomPositionOffScreen() ))
                    .animation(.easeInOut(duration: 1))
                    .onTapGesture() {
                        game.chose(card)
                    }
            }
            .onAppear { game.startNewGame() }
            
            Button("Deal cards") {
                game.dealCards()
            }
            .disabled(game.deck.isEmpty)
            .padding()
            Button("New Game") {
                game.startNewGame()
            }
            
        }
    }
    
    // TODO: - Need rewrite
    func randomPositionOffScreen() -> CGSize {
        let angle: Double = Double.random(in: 0.0...360.0)
        let x: Double = cos(angle)
        let y: Double = sin(angle)
        return CGSize(width: 1000 * x, height: 1000 * y)
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGame()
        ContentView(game: game)
    }
}
