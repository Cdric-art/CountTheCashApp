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
	
    init(five: Int? = nil, ten: Int? = nil, twenty: Int? = nil) {
        self.five = five
        self.ten = ten
        self.twenty = twenty
    }
    
}
