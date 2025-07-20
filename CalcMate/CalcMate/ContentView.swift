//
//  ContentView.swift
//  CalcMate
//
//  Created by SAJAN on 20/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var history: [(expression: String, result: String)] = []

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Standard Calculator", destination: CalculatorView(history: $history))
                NavigationLink("BMI Calculator", destination: BMICalculatorView())
                NavigationLink("Age Calculator", destination: AgeCalculatorView())
                NavigationLink("Currency Converter", destination: CurrencyConverterView())
                NavigationLink("History", destination: HistoryView(history: history))
            }
            .navigationTitle("CalcMate")
        }
    }
}
