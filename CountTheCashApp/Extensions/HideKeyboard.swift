//
//  HideKeyboard.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 09/07/2023.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
