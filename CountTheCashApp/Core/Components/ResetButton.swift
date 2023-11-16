//
//  ResetButton.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 23/10/2023.
//

import SwiftUI

struct ResetButton: View {
    @Binding var isTapGesture: Bool
    @State private var effectBounce = 0
    
    var dataReset: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                withAnimation {
                    isTapGesture.toggle()
                    effectBounce += 1
                }
                
                dataReset()
                
                wait(time: 0.3, fn: { isTapGesture.toggle() }, animated: true)
                
            }, label: {
                HStack(spacing: 16) {
                    Text("Tout effacer")
                        .font(.system(size: 14))
                        .padding(.vertical, 10)
                    Image(systemName: "trash.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18)
                        .opacity(0.8)
                }
            })
            .neumorphicStyle()
            .frame(width: 180)
            .scaleEffect(isTapGesture ? CGSize(width: 1.06, height: 1.05) : CGSize(width: 1.0, height: 1.0))
            .blur(radius: isTapGesture ? 1.0 : 0)
            .symbolEffect(.bounce.up.byLayer, value: effectBounce)
            
            Spacer()
        }
        .listRowBackground(Color.clear)
    }
}
