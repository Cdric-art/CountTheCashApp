//
//  NeumorphicStyle.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 12/07/2023.
//

import SwiftUI

extension View {
    func neumorphicStyle() -> some View {
        self.frame(maxWidth: .infinity)
            .background(Color.offWhite)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}
