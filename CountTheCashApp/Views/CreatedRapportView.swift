//
//  CreatedRapportView.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 09/03/2023.
//

import SwiftUI

struct CreatedRapportView: View {
	@ObservedObject var rapportViewModel: RapportViewModel
	@ObservedObject var authViewModel: AuthenticationViewModel
	@FocusState private var isInputActive: Bool
	
    var body: some View {
		VStack {
			Spacer()
				.frame(height: 20)
			
			TitleSecondaryView(title: "Créer un rapport", color: .black)
			
			List {
				Section {
					DatePicker("Date :",
							   selection: $rapportViewModel.rapport.date,
							   displayedComponents: [.date]
					)
					.datePickerStyle(.graphical)
				}
				
				Section(content: {
					TextField("CA Total", value: $rapportViewModel.rapport.ca, format: .currency(code: "EUR"))
						.keyboardType(.decimalPad)
						.focused($isInputActive)
						.toolbar {
							ToolbarItemGroup(placement: .keyboard) {
								Spacer()
								Button(action: {
									isInputActive.toggle()
								}) {
									Image(systemName: "chevron.down")
										.foregroundColor(Color("primaryColor"))
								}
							}
						}
				}, header: {
					Label("CA Total :", systemImage: "dollarsign.circle")
				})
				
				Section(content: {
					TextField("CA Jour", value: $rapportViewModel.rapport.ca_brunch, format: .currency(code: "EUR"))
						.keyboardType(.decimalPad)
						.focused($isInputActive)
						.toolbar {
							ToolbarItemGroup(placement: .keyboard) {
								Spacer()
								Button(action: {
									isInputActive.toggle()
								}) {
									Image(systemName: "chevron.down")
										.foregroundColor(Color("primaryColor"))
								}
							}
						}
				}, header: {
					Label("CA Jour :", systemImage: "dollarsign.circle")
				})
				
				Section(content: {
					TextField("CA Soir", value: $rapportViewModel.rapport.ca_night, format: .currency(code: "EUR"))
						.keyboardType(.decimalPad)
						.focused($isInputActive)
						.toolbar {
							ToolbarItemGroup(placement: .keyboard) {
								Spacer()
								Button(action: {
									isInputActive.toggle()
								}) {
									Image(systemName: "chevron.down")
										.foregroundColor(Color("primaryColor"))
								}
							}
						}
				}, header: {
					Label("CA Soir :", systemImage: "dollarsign.circle")
				})
				
				Section(content: {
					TextField("Clic", value: $rapportViewModel.rapport.numberOfGuest, format: .number)
						.keyboardType(.decimalPad)
						.focused($isInputActive)
						.toolbar {
							ToolbarItemGroup(placement: .keyboard) {
								Spacer()
								Button(action: {
									isInputActive.toggle()
								}) {
									Image(systemName: "chevron.down")
										.foregroundColor(Color("primaryColor"))
								}
							}
						}
				}, header: {
					Label("Clic :", systemImage: "number")
				})
				
				Section(content: {
					TextField("Ticket moyen", value: $rapportViewModel.rapport.tm, format: .currency(code: "EUR"))
						.keyboardType(.decimalPad)
						.focused($isInputActive)
						.toolbar {
							ToolbarItemGroup(placement: .keyboard) {
								Spacer()
								Button(action: {
									isInputActive.toggle()
								}) {
									Image(systemName: "chevron.down")
										.foregroundColor(Color("primaryColor"))
								}
							}
						}
				}, header: {
					Label("Ticket moyen :", systemImage: "dollarsign.circle")
				})
			}
			
			if (rapportViewModel.error != nil) {
				Text(rapportViewModel.error ?? "Une erreur inconnue s'est produite.")
					.multilineTextAlignment(.center)
					.font(.caption2)
					.foregroundColor(.red)
			}
			
			HStack {
				Button(action: {rapportViewModel.isOpen.toggle()}, label: {
					Text("Retour")
						.foregroundColor(.orange)
				})
				Spacer()
					.frame(width: 50)
				Button(action: {
					rapportViewModel.createdRapport(workplace: authViewModel.user.workplace)
					rapportViewModel.isOpen.toggle()
				}, label: {
					Text("Envoyer")
				})
			}
			.padding()
		}
    }
}

struct CreatedRapportView_Previews: PreviewProvider {
    static var previews: some View {
		CreatedRapportView(rapportViewModel: RapportViewModel(), authViewModel: AuthenticationViewModel())
    }
}
