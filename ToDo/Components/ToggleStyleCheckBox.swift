//
//  Task.swift
//  ToDo
//
//  Created by Miguel Alejandro Correa Avila on 17/5/23.
//

import SwiftUI

struct ToggleStyleCheckBox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        })
    }
}
