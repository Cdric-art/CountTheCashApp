//
//  UserLoginModel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 06/03/2023.
//

import Foundation

struct UserLogin: Identifiable {
	var id = UUID()
	var userId: String
	var firstname: String
}
