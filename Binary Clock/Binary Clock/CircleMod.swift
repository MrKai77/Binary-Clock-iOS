//
//  CircleMods.swift
//  Binary Clock
//
//  Created by Kai Azim on 2021-10-09.
//
// Custom-made modifier so that if there needs to be a change with
// how the circles change color (or something else), it only needs
// to be changed once

import SwiftUI

extension View {
    func circleMod(state isOn:Bool) -> some View {
        self
            .foregroundColor(Color(isOn ? "ON" : "OFF"))
            .animation(.easeOut)
            .frame(width: 30, height: 30)
            .padding()
    }
}
