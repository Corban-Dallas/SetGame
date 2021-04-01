//
//  SetGameApp.swift
//  SetGame
//
//  Created by Григорий Кривякин on 23.03.2021.
//

import SwiftUI

@main
struct SetGameApp: App {
    var body: some Scene {
        WindowGroup {
            let setGame = SetGame()
            ContentView(game: setGame)
        }
    }
}
