//
//  CardView.swift
//  SetGame
//
//  Created by Григорий Кривякин on 08.04.2021.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        ZStack {
            // Shadow
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color.gray, lineWidth: 5.0)
                .blur(radius: 4.0)
                .opacity(card.isChosen ? 1 : 0)
            if let inSet = card.inSet {
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(inSet ? Color.green : Color.red, lineWidth: 5.0)
                    .blur(radius: 4.0)
            }
            // Card
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 25.0)
                .strokeBorder(Color.black, lineWidth: 1.0 )
            CardContent(with: card.features)
        }
        .padding(3)
        .aspectRatio(2/3, contentMode: .fit)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let game: SetGame = SetGame()
        CardView(card: game.shownCards[0])
    }
}
