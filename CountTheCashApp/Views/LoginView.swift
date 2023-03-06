	//
	//  LoginView.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 06/03/2023.
	//

import SwiftUI

struct LoginView: View {
	@ObservedObject var login: LoginViewModel
	@State var openUserRegisterView: Bool = false
	@State var userId: String = ""
	
	var body: some View {
		ZStack {
			
			CircleBackground()
			
			VStack {
				TitleView(title: "Espace membre", icon: "cashIcon", color: .white)
				
				Spacer()
					.frame(height: 150)
				
				VStack {
					SecureField("ID Utilisateur", text: $userId)
						.multilineTextAlignment(.center)
						.padding(10)
						.background(Color.gray.opacity(0.1))
						.cornerRadius(8)
					Button(action: login.handleLogin, label: {
						Text("Connexion")
							.padding()
							.foregroundColor(Color("primaryColor"))
					})
				}
				.padding(.horizontal, 50)
				
				Spacer()
				
				VStack {
					Button(action: {
						openUserRegisterView.toggle()
					}, label: {
						Text("Vous n'êtes pas membre ? Faites une demande à l'administrateur.")
							.foregroundColor(Color("primaryColor"))
					})
				}
				.padding(.horizontal, 30)
			}
			.popover(isPresented: $openUserRegisterView, content: {
				
			})
		}
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView(login: LoginViewModel())
	}
}
