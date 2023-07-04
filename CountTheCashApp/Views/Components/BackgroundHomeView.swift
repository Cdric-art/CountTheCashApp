//
//  BackgroundHomeView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 02/07/2023.
//

import SwiftUI

struct BackgroundHomeView: View {
    var body: some View {
        VStack {
            VStack(spacing: 22) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.purple)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.cyan)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.brown)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.orange)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.mint)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.red)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.green)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.indigo)
                    .aspectRatio(contentMode: .fill)
            }
            .rotationEffect(Angle(degrees: -32))
            .padding(.top, 32)
            
            Spacer()
        }
    }
}

struct BackgroundHomeView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundHomeView()
    }
}
