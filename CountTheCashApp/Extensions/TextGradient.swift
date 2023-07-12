//
//  TextGradient.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 12/07/2023.
//

import SwiftUI

extension View {
    func textGradientStyle(value: String, color: Color = .black, size: CGFloat = 50) -> some View {
        self.font(.system(size: size, weight: .semibold, design: .rounded))
            .padding(16)
            .overlay {
                LinearGradient(
                    colors: [color, .white],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .mask(
                    Text(value)
                        .font(.system(size: size, weight: .semibold, design: .rounded))
                )
            }
    }
}
