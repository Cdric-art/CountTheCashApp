//
//  Wait.swift
//  CountTheCashApp
//
//  Created by Cédric Evrard on 23/10/2023.
//

import Foundation
import SwiftUI

/// Allows you to wait a while before a function is executed
/// - Parameters:
///   - time: waiting time
///   - fn: function to be performed
///   - animated: animates changes made by the function
/// - Returns: Void
func wait(time: Double, fn: @escaping () -> Void, animated: Bool = false) -> Void {
    DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: {
        if animated {
            withAnimation {
                fn()
            }
        } else {
            withAnimation {
                fn()
            }
        }
    })
}


