//
//  UserRegisterViewModel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 06/03/2023.
//

import Foundation
import Firebase
import FirebaseFirestore

class UserRegisterViewModel: ObservableObject {
//	@Published var UserRegister = UserAskRegister(firstname: "", lastname: "", email: "", password: "", job: "", workplace: "Autre", isValidated: false)
//	@Published var user = User(id: "", firstname: "", lastname: "", email: "", password: "", job: "", workplace: "", isValidated: 0)
//	@Published var errorCreatedUser: String?
//	@Published var openUserRegisterView: Bool = false
//
//	func createUserRegister() {
//		let db = Firestore.firestore()
//		let docRef = db.collection("users").document(UserRegister.id)
//
//		let user: [String: Any] = [
//			"uid": UserRegister.id,
//			"firstname": UserRegister.firstname,
//			"lastname": UserRegister.lastname,
//			"email": UserRegister.email,
//			"job": UserRegister.job,
//			"workplace": UserRegister.workplace,
//			"isValidated": UserRegister.isValidated
//		]
//
//		docRef.setData(user) { error in
//			if let error = error {
//				print("Error writing document: \(error)")
//				self.errorCreatedUser = error.localizedDescription
//			} else {
//				print("Document successfully written!")
//				self.openUserRegisterView.toggle()
//			}
//		}
//	}
//
//	func createdUser() {
//		Auth.auth().createUser(withEmail: user.email, password: user.password) { (result, error) in
//			if error != nil {
//				print("Error created user: \(error?.localizedDescription ?? "oups")")
//				self.errorCreatedUser = error?.localizedDescription
//			} else {
//				print("Success : \(String(describing: result))")
//				self.createUserRegister()
//			}
//		}
//	}
}
