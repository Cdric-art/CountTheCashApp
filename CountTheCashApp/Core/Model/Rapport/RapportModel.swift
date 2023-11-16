//
//  RapportModel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 09/03/2023.
//

import Foundation

struct Rapport: Identifiable {
	var id = UUID().uuidString
	var date: Date
	var ca: Int
	var ca_brunch: Int
	var ca_night: Int
	var numberOfGuest: Int
	var tm: Double
	
//	var alcool_drink: String
//	var soft_drink: String
//	var hot_drink: String
//	var cocktail: String
//	var dessert: String
//	var tapas: String
//	var ca_tapas: String
//	
//	var responsible: String?
//	var barman: [String]?
//	var runner: [String]?
//	var cook: [String]?
//	
//	var offert: String?
//	var losses: String?
//	var number_hk: String?
//	var number_ipa: String?
//	
//	var generalities: String?
//	var customer_review: String?
//	var staff_review: String?
//	var material: String?
	
}
