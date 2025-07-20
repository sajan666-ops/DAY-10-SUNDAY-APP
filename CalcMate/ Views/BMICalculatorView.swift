//
//  BMICalculatorView.swift
//  CalcMate
//
//  Created by SAJAN  on 20/07/25.
//

import SwiftUI

struct BMICalculatorView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var bmi: Double?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter your details")) {
                    TextField("Weight (kg)", text: $weight)
                        .keyboardType(.decimalPad)
                    TextField("Height (m)", text: $height)
                        .keyboardType(.decimalPad)
                }

                Section {
                    Button("Calculate BMI") {
                        calculateBMI()
                    }

                    if let bmi = bmi {
                        Text("Your BMI is \(String(format: "%.2f", bmi))")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("BMI Calculator")
        }
    }

    private func calculateBMI() {
        guard let weight = Double(weight),
              let height = Double(height),
              height > 0 else {
            bmi = nil
            return
        }
        bmi = weight / (height * height)
    }
}

#Preview {
    BMICalculatorView()
}
