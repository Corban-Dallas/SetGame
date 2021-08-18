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
        let roundedRectangle = RoundedRectangle(cornerRadius: cardCornerRadius)
        let shadowColor = card.inSet == nil ? Color.black : card.inSet! ? Color.green : Color.red

        ZStack {
            // Shadow
            roundedRectangle
                .stroke(shadowColor, lineWidth: showdowIntensity)
                .blur(radius: shadowRaduis)
                .opacity(card.isChosen ? 1 : 0)
            // Card
            roundedRectangle
                .foregroundColor(.white)
            roundedRectangle
                .strokeBorder(Color.black, lineWidth: cardLineWidth )
            CardContent(with: card.features)
        }
        .padding(3)
        .aspectRatio(aspectRatio, contentMode: .fit)
    }
    
    // MARK: - Magical constants
    let cardLineWidth: CGFloat = 1
    let cardCornerRadius: CGFloat = 25
    let shadowRaduis: CGFloat = 4
    let showdowIntensity: CGFloat = 5
    let aspectRatio: CGFloat = 2/3
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let game: SetGame = SetGame()
        CardView(card: game.shownCards[0])
    }
}
