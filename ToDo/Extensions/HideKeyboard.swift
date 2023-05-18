//
//  HideKeyboard.swift
//  ToDo
//
//  Created by Miguel Alejandro Correa Avila on 18/5/23.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
