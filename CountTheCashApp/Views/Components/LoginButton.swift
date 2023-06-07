//
//  LoginButton.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 06/03/2023.
//

import SwiftUI

struct LoginButton: View {
	@ObservedObject var authViewModel: AuthenticationViewModel
	
    var body: some View {
		Button(action: {
			authViewModel.signIn()
		}, label: {
			Text("Connexion")
				.padding()
				.foregroundColor(Color("primaryColor"))
		})
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
		LoginButton(authViewModel: AuthenticationViewModel())
    }
}
