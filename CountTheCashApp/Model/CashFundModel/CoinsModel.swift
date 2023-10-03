//
//  CoinsModel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 22/02/2023.
//

import Foundation

struct Coins {
	var ten: Int?
	var twenty: Int?
	var fifty: Int?
	var one: Int?
	var two: Int?
    
    init(ten: Int? = nil, twenty: Int? = nil, fifty: Int? = nil, one: Int? = nil, two: Int? = nil) {
        self.ten = ten
        self.twenty = twenty
        self.fifty = fifty
        self.one = one
        self.two = two
    }
	
}
