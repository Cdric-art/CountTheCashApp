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
                    .foregroundStyle(.purple)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.cyan)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.brown)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.orange)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.mint)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.red)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.green)
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.indigo)
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
