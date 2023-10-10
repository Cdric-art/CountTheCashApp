//
//  LightCalculatorView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 12/07/2023.
//

import SwiftUI

struct LightCalculatorView: View {
    @Bindable var lightCalculator: LightCalculator
    
    @State private var isCopied: Bool = false
    private let clipboard = UIPasteboard.general
    private let offSetX = UIDevice.current.userInterfaceIdiom == .phone ? -10.0 : -220.0
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                ZStack {
                    Text("\(lightCalculator.result.formatted())")
                        .font(.system(size: 70).bold())
                        .padding()
                        .neumorphicStyle()
                    Image(systemName: "doc.on.doc")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(isCopied ? .green : .gray)
                        .frame(width: isCopied ? 18 : 16)
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                        .offset(x: offSetX, y: -30)
                        .onTapGesture {
                            clipboard.string = lightCalculator.result.formatted()
                            withAnimation {
                                isCopied = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                withAnimation {
                                    isCopied = false
                                }
                            })
                        }
                }
                
                VStack {
                    Text(lightCalculator.placeHolder)
                        .font(.system(size: 32, weight: .semibold, design: .rounded))
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, minHeight: 80, alignment: .trailing)
                .padding(.top)
                
                Divider()
                    .frame(maxWidth: 400)
                
                VStack {
                    HStack {
                        Button(action: {
                            lightCalculator.placeHolder.append("7")
                            lightCalculator.saveNumber(value: "7")
                        }, label: {
                            rowLabel(text: "7")
                        })
                        
                        Button(action: {
                            lightCalculator.placeHolder.append("8")
                            lightCalculator.saveNumber(value: "8")
                        }, label: {
                            rowLabel(text: "8")
                        })
                        
                        Button(action: {
                            lightCalculator.placeHolder.append("9")
                            lightCalculator.saveNumber(value: "9")
                        }, label: {
                            rowLabel(text: "9")
                        })
                        
                        Button(action: {
                            lightCalculator.reset()
                        }, label: {
                            rowLabel(text: "C", color: .red)
                        })
                    }
                    .font(.system(size: 50, design: .rounded))
                    .foregroundStyle(.white)
                }
                
                VStack {
                    HStack {
                        Button(action: {
                            lightCalculator.placeHolder.append("4")
                            lightCalculator.saveNumber(value: "4")
                        }, label: {
                            rowLabel(text: "4")
                        })
                        
                        Button(action: {
                            lightCalculator.placeHolder.append("5")
                            lightCalculator.saveNumber(value: "5")
                        }, label: {
                            rowLabel(text: "5")
                        })
                        
                        Button(action: {
                            lightCalculator.placeHolder.append("6")
                            lightCalculator.saveNumber(value: "6")
                        }, label: {
                            rowLabel(text: "6")
                        })
                        
                        Button(action: {
                            if !lightCalculator.placeHolder.contains("-") && !lightCalculator.placeHolder.contains("+") {
                                lightCalculator.placeHolder.append("-")
                            }
                            lightCalculator.selectedOperator = .subtraction
                            if !lightCalculator.isOperatorSelected {
                                lightCalculator.isOperatorSelected = true
                            }
                        }, label: {
                            rowLabel(text: "-", color: .cyan)
                        })
                    }
                    .font(.system(size: 50, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                }
                
                VStack {
                    HStack {
                        Button(action: {
                            lightCalculator.placeHolder.append("1")
                            lightCalculator.saveNumber(value: "1")
                        }, label: {
                            rowLabel(text: "1")
                        })
                        
                        Button(action: {
                            lightCalculator.placeHolder.append("2")
                            lightCalculator.saveNumber(value: "2")
                        }, label: {
                            rowLabel(text: "2")
                        })
                        
                        Button(action: {
                            lightCalculator.placeHolder.append("3")
                            lightCalculator.saveNumber(value: "3")
                        }, label: {
                            rowLabel(text: "3")
                        })
                        
                        Button(action: {
                            if !lightCalculator.placeHolder.contains("+") && !lightCalculator.placeHolder.contains("-") {
                                lightCalculator.placeHolder.append("+")
                            }
                            lightCalculator.selectedOperator = .addition
                            if !lightCalculator.isOperatorSelected {
                                lightCalculator.isOperatorSelected = true
                            }
                        }, label: {
                            rowLabel(text: "+", color: .green)
                        })
                    }
                    .font(.system(size: 50, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                }
                
                VStack {
                    HStack {
                        Button(action: {
                            lightCalculator.placeHolder.append("0")
                            lightCalculator.saveNumber(value: "0")
                        }, label: {
                            rowLabel(text: "0")
                        })
                        
                        Button(action: {
                            lightCalculator.placeHolder.append(".")
                            lightCalculator.saveNumber(value: ".")
                        }, label: {
                            rowLabel(text: ".")
                        })
                        
                        Button(action: {
                            lightCalculator.calcul()
                        }, label: {
                            rowLabel(text: "=", color: .yellow)
                        })
                    }
                    .font(.system(size: 50, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                }
                .padding(.bottom)
                
                if UIDevice.current.userInterfaceIdiom == .pad {
                    Spacer()
                }
                
            }
            .padding()
            .background(Color("OffWhiteTheme"))
            .navigationTitle("Calculette")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    func rowLabel(text: String, color: Color = .accentColor) -> some View {
        if text == "0" {
            ZStack {
                RoundedRectangle(cornerRadius: 43)
                    .offWhiteStyle()
                Text("0")
                    .textGradientStyle(value: "0")
            }
            .frame(width: 172, height: 86)
        } else {
            ZStack {
                Circle()
                    .offWhiteStyle()
                Text(text)
                    .textGradientStyle(value: text, color: color)
            }
            .frame(maxWidth: 86)
        }
    }
}

struct LightCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        LightCalculatorView(lightCalculator: LightCalculator())
    }
}
