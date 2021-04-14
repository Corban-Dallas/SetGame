//
//  Dimond.swift
//  SetGame
//
//  Created by Григорий Кривякин on 14.04.2021.
//

import SwiftUI

struct Dimond: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.move(to: CGPoint(x: rect.midX, y: rect.minY))
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        p.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        p.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        p.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return p
    }
}

struct Dimond_Previews: PreviewProvider {
    static var previews: some View {
        Dimond()
    }
}
