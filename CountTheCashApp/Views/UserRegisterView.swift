	//
	//  UserRegisterView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 06/03/2023.
	//

import SwiftUI

struct UserRegisterView: View {
	@ObservedObject var authViewModel: AuthenticationViewModel
	
	let workplaces = [
		"Bar à Bulles - Machine",
		"Le Pavillon des Canaux",
		"La Recyclerie",
		"La Cité Fertile"
	]
	
	var body: some View {
		ZStack {
			
			CircleBackground()
			
			VStack {
				TitleView(title: "Inscription", icon: "cashIcon", color: .white)
				
				Spacer()
					.frame(height: 150)
				
				VStack {
					HStack {
						TextField("Prénom", text: $authViewModel.user.firstname)
							.autocorrectionDisabled()
							.multilineTextAlignment(.center)
							.padding(10)
							.background(Color.gray.opacity(0.1))
							.cornerRadius(8)
						TextField("Nom", text: $authViewModel.user.lastname)
							.multilineTextAlignment(.center)
							.padding(10)
							.background(Color.gray.opacity(0.1))
							.cornerRadius(8)
					}
					VStack {
						TextField("Poste", text: $authViewModel.user.job)
							.multilineTextAlignment(.center)
							.padding(10)
							.background(Color.gray.opacity(0.1))
							.cornerRadius(8)
						Picker("Lieux", selection: $authViewModel.user.workplace, content: {
							Text("Lieux :")
							ForEach(workplaces, id: \.self) {
								Text($0)
							}
						})
						.frame(width: 295)
						.padding(2)
						.background(Color.gray.opacity(0.1))
						.cornerRadius(8)
					}
					VStack {
						TextField("Email", text: $authViewModel.user.email)
							.keyboardType(.emailAddress)
							.autocorrectionDisabled()
							.multilineTextAlignment(.center)
							.padding(10)
							.background(Color.gray.opacity(0.1))
							.cornerRadius(8)
						SecureField("Mot de passe", text: $authViewModel.user.password)
							.multilineTextAlignment(.center)
							.padding(10)
							.background(Color.gray.opacity(0.1))
							.cornerRadius(8)
					}
				}
				.accentColor(.black)
				.frame(maxWidth: 300)
				
				if ((authViewModel.errorCreatedUser) != nil) {
					HStack {
						Text(authViewModel.errorCreatedUser ?? "Une erreur inconnue s'est produite.")
							.multilineTextAlignment(.center)
							.font(.caption2)
							.foregroundColor(.red)
					}
				}
				
				HStack {
					Button(action: {
						authViewModel.openUserRegisterView.toggle()
					}, label: {
						Text("Annuler")
							.padding()
							.foregroundColor(.black.opacity(0.7))
					})
					Button(action: {
						authViewModel.createdUser()
					}, label: {
						Text("S'inscrire")
							.padding()
							.foregroundColor(Color("primaryColor"))
					})
				}
			}
		}
	}
}

struct UserRegisterView_Previews: PreviewProvider {
	static var previews: some View {
		UserRegisterView(authViewModel: AuthenticationViewModel())
	}
}
