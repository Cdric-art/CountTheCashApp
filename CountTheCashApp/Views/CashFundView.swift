	//
	//  CashFundView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 14/01/2023.
	//

import SwiftUI

struct CashFundView: View {
	
	@State private var cashFund: Float?
	
	@State private var fiftyBill: Int = 0
	@State private var twentyBill: Int = 0
	@State private var tenBill: Int = 0
	@State private var fiveBill: Int = 0
	@State private var twoCoin: Int = 0
	@State private var oneCoin: Int = 0
	@State private var fiftyCentCoin: Int = 0
	@State private var twentyCentCoin: Int = 0
	@State private var tenCentCoin: Int = 0
	
	@State private var resultFiftyBill: Float = 0
	@State private var resultTwentyBill: Float = 0
	@State private var resultTenBill: Float = 0
	@State private var resultFiveBill: Float = 0
	@State private var resultTwoCoin: Float = 0
	@State private var resultOneCoin: Float = 0
	@State private var resultFiftyCentCoin: Float = 0
	@State private var resultTwentyCentCoin: Float = 0
	@State private var resultTenCentCoin: Float = 0
	
	@State private var total: Float = 0
	@State private var difference: Float = 0

	private func totalAddition() {
		self.total = resultFiftyBill + resultTwentyBill + resultTenBill + resultFiveBill + resultTwoCoin + resultOneCoin + resultFiftyCentCoin + resultTwentyCentCoin + resultTenCentCoin
	}
	private func differenceCalcul() -> Float {
		if cashFund != nil {
			return total - cashFund!
		}
		return 0
	}
	
	var body: some View {
		VStack {
			VStack {
				Text("Cash Fund")
					.font(.largeTitle)
					.padding(.bottom, -10)
				TextField("Amount", value: $cashFund, format: .number)
					.textFieldStyle(.roundedBorder)
					.multilineTextAlignment(.center)
					.frame(maxWidth: 100)
					.padding()
			}
			
			List {
				HStack {
					TextField("0", value: $fiftyBill, format: .number)
						.onChange(of: fiftyBill)  { _ in
							if fiftyBill == 0 {
								resultFiftyBill = 0
								totalAddition()
							} else {
								resultFiftyBill = Float(fiftyBill) * 50.0
								totalAddition()
							}
						}
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("50")
					Spacer()
					Text("=")
					Spacer()
					Text(resultFiftyBill.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $twentyBill, format: .number)
						.onChange(of: twentyBill)  { _ in
							if twentyBill == 0 {
								resultTwentyBill = 0
								totalAddition()
							} else {
								resultTwentyBill = Float(twentyBill) * 20.0
								totalAddition()
							}
						}
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("20")
					Spacer()
					Text("=")
					Spacer()
					Text(resultTwentyBill.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $tenBill, format: .number)
						.onChange(of: tenBill)  { _ in
							if tenBill == 0 {
								resultTenBill = 0
								totalAddition()
							} else {
								resultTenBill = Float(tenBill) * 10.0
								totalAddition()
							}
						}
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("10")
					Spacer()
					Text("=")
					Spacer()
					Text(resultTenBill.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $fiveBill, format: .number)
						.onChange(of: fiveBill)  { _ in
							if fiveBill == 0 {
								resultFiveBill = 0
								totalAddition()
							} else {
								resultFiveBill = Float(fiveBill) * 5.0
								totalAddition()
							}
						}
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text(" 5")
					Spacer()
					Text("=")
					Spacer()
					Text(resultFiveBill.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $twoCoin, format: .number)
						.onChange(of: twoCoin)  { _ in
							if twoCoin == 0 {
								resultTwoCoin = 0
								totalAddition()
							} else {
								resultTwoCoin = Float(twoCoin) * 2.0
								totalAddition()
							}
						}
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text(" 2")
					Spacer()
					Text("=")
					Spacer()
					Text(resultTwoCoin.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $oneCoin, format: .number)
						.onChange(of: oneCoin)  { _ in
							if oneCoin == 0 {
								resultOneCoin = 0
								totalAddition()
							} else {
								resultOneCoin = Float(oneCoin) * 1.0
								totalAddition()
							}
						}
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text(" 1")
					Spacer()
					Text("=")
					Spacer()
					Text(resultOneCoin.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $fiftyCentCoin, format: .number)
						.onChange(of: fiftyCentCoin)  { _ in
							if fiftyCentCoin == 0 {
								resultFiftyCentCoin = 0
								totalAddition()
							} else {
								resultFiftyCentCoin = Float(fiftyCentCoin) * 0.5
								totalAddition()
							}
						}
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("0.50")
						.padding(.trailing, 30)
					Text("=")
					Spacer()
					Text(resultFiftyCentCoin.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $twentyCentCoin, format: .number)
						.onChange(of: twentyCentCoin)  { _ in
							if twentyCentCoin == 0 {
								resultTwentyCentCoin = 0
								totalAddition()
							} else {
								resultTwentyCentCoin = Float(twentyCentCoin) * 0.2
								totalAddition()
							}
						}
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("0.20")
						.padding(.trailing, 30)
					Text("=")
					Spacer()
					Text(resultTwentyCentCoin.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
				HStack {
					TextField("0", value: $tenCentCoin, format: .number)
						.onChange(of: tenCentCoin)  { _ in
							if tenCentCoin == 0 {
								resultTenCentCoin = 0
								totalAddition()
							} else {
								resultTenCentCoin = Float(tenCentCoin) * 0.1
								totalAddition()
							}
						}
						.textFieldStyle(.roundedBorder)
						.multilineTextAlignment(.center)
						.frame(maxWidth: 50)
					Text("x")
					Text("0.10")
						.padding(.trailing, 30)
					Text("=")
					Spacer()
					Text(resultTenCentCoin.formatted())
						.frame(width: 50, alignment: .trailing)
				}
				.padding(2)
			}
			.padding(.top, -20)
			.cornerRadius(10)
			
			Spacer()
			
			VStack(spacing: 4) {
				HStack {
					Text("Total :")
					Text(total.formatted())
					Spacer()
				}
				.font(.headline)
				
				HStack {
					Text("Difference :")
						.font(.callout)
					Text(differenceCalcul().formatted())
					Spacer()
				}
			}
			
		}
		.padding(16)
	}
}

struct CashFundView_Previews: PreviewProvider {
	static var previews: some View {
		CashFundView()
	}
}
