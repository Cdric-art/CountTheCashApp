//
//  OffWhiteStyle.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 12/07/2023.
//

import SwiftUI

extension Shape {
    func offWhiteStyle() -> some View {
        self.fill(Color("OffWhiteTheme"))
            .shadow(color: Color.black.opacity(0.05), radius: 6, x: 8, y: 8)
            .shadow(color: Color.white.opacity(0.7), radius: 6, x: -3, y: -3)
    }
}
