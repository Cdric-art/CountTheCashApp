	//
	//  LoginViewModel.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 06/03/2023.
	//

import Foundation
import Firebase
import FirebaseFirestore

class AuthenticationViewModel: ObservableObject {
	@Published var user = User(id: "", firstname: "", lastname: "", email: "", password: "", job: "", workplace: "", isValidated: 0)
	@Published var errorAuthUser: String?
	@Published var errorCreatedUser: String?
	@Published var openUserRegisterView: Bool = false
	
	func getUser() {
		let currentUser = Auth.auth().currentUser
		if let currentUser = currentUser {
			user.id = currentUser.uid
			UserDefaults().set(currentUser.uid, forKey: "uid")
		}
	}
	
	func getUserAllInfo() {
		let db = Firestore.firestore()
		guard let uid = UserDefaults().string(forKey: "uid") else { return }
		let docRef = db.collection("users").document(uid)
		
		docRef.getDocument { (document, error) in
			guard error == nil else {
				print("error", error ?? "")
				return
			}
			
			if let document = document, document.exists {
				let data = document.data()
				if let data = data {
					self.user.firstname = data["firstname"] as? String ?? ""
					self.user.lastname = data["lastname"] as? String ?? ""
					self.user.email = data["email"] as? String ?? ""
					self.user.job = data["job"] as? String ?? ""
					self.user.workplace = data["workplace"] as? String ?? ""
					self.user.isValidated = data["isValidated"] as? Int ?? 0
				}
			}
			
		}
	}
	
	func signIn() {
		Auth.auth().signIn(withEmail: user.email, password: user.password) { (result, error) in
			if error != nil {
				self.errorAuthUser = error?.localizedDescription
			} else {
				self.getUser()
				self.getUserAllInfo()
			}
		}
	}
	
	func createdUser() {
		Auth.auth().createUser(withEmail: user.email, password: user.password) { (result, error) in
			if error != nil {
				self.errorCreatedUser = error?.localizedDescription
			} else {
				self.getUser()
				self.createUserRegister()
			}
		}
	}
	
	func createUserRegister() {
		let db = Firestore.firestore()
		guard let uid = UserDefaults().string(forKey: "uid") else { return }
		let docRef = db.collection("users").document(uid)
		
		let user: [String: Any] = [
			"firstname": user.firstname,
			"lastname": user.lastname,
			"email": user.email,
			"job": user.job,
			"workplace": user.workplace,
			"isValidated": user.isValidated
		]
		
		docRef.setData(user) { error in
			if let error = error {
				self.errorCreatedUser = error.localizedDescription
			} else {
				self.openUserRegisterView.toggle()
			}
		}
	}
	
	func logout() {
		let firebaseAuth = Auth.auth()
		do {
			try firebaseAuth.signOut()
			UserDefaults().removeObject(forKey: "uid")
			self.user = User(id: "", firstname: "", lastname: "", email: "", password: "", job: "", workplace: "", isValidated: 0)
		} catch let signOutError as NSError {
			print("Error signing out: %@", signOutError)
		}
	}
	
}
