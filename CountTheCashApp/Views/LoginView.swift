	//
	//  LoginView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 06/03/2023.
	//

import SwiftUI

struct LoginView: View {
	@ObservedObject var authViewModel: AuthenticationViewModel
	
	@Environment(\.presentationMode) var presentationMode
	
	var body: some View {
		ZStack(alignment: .top) {
			
			CircleBackground()
			
			VStack {
				
				VStack {
					VStack {
						Text("Espace")
						Text("membre")
					}
					.font(.system(size: 38))
					.fontWeight(.black)
					.foregroundColor(.white)
					
					Image("cashIcon")
						.resizable()
						.scaledToFit()
						.cornerRadius(110)
						.frame(maxWidth: 110)
						.shadow(color: Color(.sRGBLinear, white: 0.2, opacity: 0.2) ,radius: 1)				}
				
				Spacer()
				
				if (UserDefaults().string(forKey: "uid") == nil) {
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

						if ((authViewModel.errorAuthUser) != nil) {
							HStack {
								Text(authViewModel.errorAuthUser ?? "Une erreur inconnue s'est produite.")
									.multilineTextAlignment(.center)
									.font(.caption2)
									.foregroundColor(.red)
							}
						}

						Button(action: {
							authViewModel.signIn()
						}, label: {
							Text("Connexion")
								.padding()
								.foregroundColor(Color("primaryColor"))
						})
						
					}
					.accentColor(.black)
					.frame(width: 260)

					Spacer()
					
					VStack {
						Button(action: {
							authViewModel.openUserRegisterView.toggle()
						}, label: {
							Text("Vous n'êtes pas membre ? Faites une demande à l'administrateur.")
								.foregroundColor(Color("primaryColor"))
						})
					}
				}
				
				if (UserDefaults().string(forKey: "uid") != nil) {
					
					Spacer()
					
					Button(action: {
						authViewModel.logout()
						presentationMode.wrappedValue.dismiss()
					}, label: {
						Text("Déconnexion")
							.foregroundColor(.red)
					})
				}
			}
			.popover(isPresented: $authViewModel.openUserRegisterView, content: {
				UserRegisterView(authViewModel: authViewModel)
			})
			
		}
		
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView(authViewModel: AuthenticationViewModel())
	}
}

