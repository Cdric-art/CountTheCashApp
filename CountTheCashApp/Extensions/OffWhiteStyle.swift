//
//  OffWhiteStyle.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 12/07/2023.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255)
}

extension Shape {
    func offWhiteStyle() -> some View {
        self.fill(Color.offWhite)
            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}
