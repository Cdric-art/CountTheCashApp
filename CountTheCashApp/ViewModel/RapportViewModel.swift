	//
	//  RapportViewModel.swift
	//  CountTheCashApp
	//
	//  Created by Cédric Evrard on 09/03/2023.
	//

import Foundation
import FirebaseFirestore

class RapportViewModel: ObservableObject {
	
	@Published var rapport = Rapport(date: Date(), ca: 0, ca_brunch: 0, ca_night: 0, numberOfGuest: 0, tm: 0)
	@Published var isOpen: Bool = false
	@Published var error: String?
	
	func createdRapport(workplace: String) {
		let db = Firestore.firestore()
		let collectionName = "\(workplace.trimmingCharacters(in: .whitespaces))_rapports"
		let docRef = db.collection(collectionName).document(rapport.date.description)
		
		let rapport: [String: Any] = [
			"date": rapport.date,
			"ca": rapport.ca,
			"ca_brunch": rapport.ca_brunch,
			"ca_night": rapport.ca_night,
			"numberOfGuest": rapport.numberOfGuest,
			"tm": rapport.tm
		]
		
		docRef.setData(rapport) { error in
			if let error = error {
				self.error = error.localizedDescription
				print("Error writing document: \(error)")
			} else {
				print("Document successfully written!")
			}
		}
	}
	
	func getRapportByWorkplace(workplace: String) {
		let db = Firestore.firestore()
		
		db.collection("\(workplace.trimmingCharacters(in: .whitespacesAndNewlines))_rapports").getDocuments() { (querySnapshot, error) in
			if let error = error {
				print("Error getting documents: \(error)")
			} else {
				for document in querySnapshot!.documents {
					print("\(document.documentID): \(document.data())")
				}
			}
		}
	}
}
