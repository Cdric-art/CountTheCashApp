//
//  BillsModel.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 22/02/2023.
//

import Foundation

struct Bills {
	var five: Int?
	var ten: Int?
	var twenty: Int?
    var fifty: Int?
    var hundred: Int?
	
    init(five: Int? = nil, ten: Int? = nil, twenty: Int? = nil, fifty: Int? = nil, hundred: Int? = nil) {
        self.five = five
        self.ten = ten
        self.twenty = twenty
        self.fifty = fifty
        self.hundred = hundred
    }
    
}
