//
//  SettingsView.swift
//  CalcMate
//
//  Created by SAJAN  on 20/07/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")) {
                    Toggle(isOn: $isDarkMode) {
                        Label("Dark Mode", systemImage: "moon.fill")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}
