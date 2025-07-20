//
//  AgeCalculatorView.swift
//  CalcMate
//
//  Created by SAJAN  on 20/07/25.
//

import SwiftUI

struct AgeCalculatorView: View {
    @State private var birthDate = Date()
    @State private var ageText = ""

    var body: some View {
        NavigationView {
            Form {
                DatePicker("Select your birthdate", selection: $birthDate, displayedComponents: .date)

                Button("Calculate Age") {
                    calculateAge()
                }

                if !ageText.isEmpty {
                    Section(header: Text("Your Age")) {
                        Text(ageText)
                    }
                }
            }
            .navigationTitle("Age Calculator")
        }
    }

    func calculateAge() {
        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.year, .month, .day], from: birthDate, to: now)

        if let years = ageComponents.year, let months = ageComponents.month, let days = ageComponents.day {
            ageText = "\(years) years, \(months) months, \(days) days"
        } else {
            ageText = "Could not calculate age"
        }
    }
}

#Preview {
    AgeCalculatorView()
}
