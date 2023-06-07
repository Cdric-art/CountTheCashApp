//
//  UsersModel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 06/03/2023.
//

import Foundation

struct UserAskRegister: Decodable, Identifiable {
	var id: String
	var firstname: String
	var lastname: String
	var email: String
	var password: String
	var job: String
	var workplace: String
	var isValidated: Int
}

