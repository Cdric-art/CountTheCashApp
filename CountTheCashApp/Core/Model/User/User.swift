//
//  User.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 09/03/2023.
//

import Foundation

struct User: Identifiable {
	var id: String
	var firstname: String
	var lastname: String
	var email: String
	var password: String
	var job: String
	var workplace: String
	var isValidated: Int
}
