//
//  LightCalculatorView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 12/07/2023.
//

import SwiftUI

struct LightCalculatorView: View {
    @StateObject var viewModel = LightCalculatorViewModel()
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                Text("\(viewModel.result.formatted())")
                    .textGradientStyle(value: "\(viewModel.result.formatted())", size: 80)
                    .neumorphicStyle()
            }
            
            VStack {
                Text(viewModel.placeHolder)
                    .font(.system(size: 32, weight: .semibold, design: .rounded))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, minHeight: 80, alignment: .trailing)
            
            Divider()
            
            VStack {
                HStack {
                    Button(action: {
                        viewModel.placeHolder.append("7")
                        viewModel.saveNumber(value: "7")
                    }, label: {
                        rowLabel(text: "7")
                    })
                    
                    Button(action: {
                        viewModel.placeHolder.append("8")
                        viewModel.saveNumber(value: "8")
                    }, label: {
                        rowLabel(text: "8")
                    })
                    
                    Button(action: {
                        viewModel.placeHolder.append("9")
                        viewModel.saveNumber(value: "9")
                    }, label: {
                        rowLabel(text: "9")
                    })
                    
                    Button(action: {
                        viewModel.reset()
                    }, label: {
                        rowLabel(text: "C", color: .orange)
                    })
                }
                .font(.system(size: 50, design: .rounded))
                .foregroundColor(.white)
            }
            
            VStack {
                HStack {
                    Button(action: {
                        viewModel.placeHolder.append("4")
                        viewModel.saveNumber(value: "4")
                    }, label: {
                        rowLabel(text: "4")
                    })
                    
                    Button(action: {
                        viewModel.placeHolder.append("5")
                        viewModel.saveNumber(value: "5")
                    }, label: {
                        rowLabel(text: "5")
                    })
                    
                    Button(action: {
                        viewModel.placeHolder.append("6")
                        viewModel.saveNumber(value: "6")
                    }, label: {
                        rowLabel(text: "6")
                    })
                    
                    Button(action: {
                        if !viewModel.placeHolder.contains("-") && !viewModel.placeHolder.contains("+") {
                            viewModel.placeHolder.append("-")
                        }
                        viewModel.selectedOperator = .subtraction
                        if !viewModel.isOperatorSelected {
                            viewModel.isOperatorSelected = true
                        }
                    }, label: {
                        rowLabel(text: "-", color: .orange)
                    })
                }
                .font(.system(size: 50, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
            }
            
            VStack {
                HStack {
                    Button(action: {
                        viewModel.placeHolder.append("1")
                        viewModel.saveNumber(value: "1")
                    }, label: {
                        rowLabel(text: "1")
                    })
                    
                    Button(action: {
                        viewModel.placeHolder.append("2")
                        viewModel.saveNumber(value: "2")
                    }, label: {
                        rowLabel(text: "2")
                    })
                    
                    Button(action: {
                        viewModel.placeHolder.append("3")
                        viewModel.saveNumber(value: "3")
                    }, label: {
                        rowLabel(text: "3")
                    })
                    
                    Button(action: {
                        if !viewModel.placeHolder.contains("+") && !viewModel.placeHolder.contains("-") {
                            viewModel.placeHolder.append("+")
                        }
                        viewModel.selectedOperator = .addition
                        if !viewModel.isOperatorSelected {
                            viewModel.isOperatorSelected = true
                        }
                    }, label: {
                        rowLabel(text: "+", color: .orange)
                    })
                }
                .font(.system(size: 50, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
            }
            
            VStack {
                HStack {
                    Button(action: {
                        viewModel.placeHolder.append("0")
                        viewModel.saveNumber(value: "0")
                    }, label: {
                        rowLabel(text: "0")
                    })
                    
                    Button(action: {
                        viewModel.placeHolder.append(".")
                        viewModel.saveNumber(value: ".")
                    }, label: {
                        rowLabel(text: ".")
                    })
                    
                    Button(action: {
                        viewModel.calcul()
                    }, label: {
                        rowLabel(text: "=", color: .orange)
                    })
                }
                .font(.system(size: 50, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
            }
            
        }
        .padding()
        .background(Color.offWhite)
    }
    
    @ViewBuilder
    func rowLabel(text: String, color: Color = .black) -> some View {
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
        LightCalculatorView()
    }
}
