//
//  CurrencyConverterView.swift
//  CalcMate
//
//  Created by SAJAN  on 20/07/25.
import SwiftUI

struct CurrencyConverterView: View {
    @State private var inrAmount: String = ""
    @State private var convertedUSD: String = ""
    @State private var convertedEUR: String = ""
    @State private var convertedJPY: String = ""
    @State private var isConverting = false

    // Sample rates (can later replace with API fetch)
    private let usdRate: Double = 0.012
    private let eurRate: Double = 0.011
    private let jpyRate: Double = 1.76

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Currency Converter")
                    .font(.largeTitle)
                    .bold()

                TextField("Enter amount in INR", text: $inrAmount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                Button(action: convertCurrency) {
                    if isConverting {
                        ProgressView()
                    } else {
                        Text("Convert")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                if !convertedUSD.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("USD: \(convertedUSD)")
                        Text("EUR: \(convertedEUR)")
                        Text("JPY: \(convertedJPY)")
                    }
                    .font(.title3)
                    .padding()
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Currency Converter")
        }
    }

    func convertCurrency() {
        guard let amount = Double(inrAmount) else {
            convertedUSD = "Invalid input"
            convertedEUR = ""
            convertedJPY = ""
            return
        }

        isConverting = true

        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            let usd = amount * usdRate
            let eur = amount * eurRate
            let jpy = amount * jpyRate

            DispatchQueue.main.async {
                self.convertedUSD = String(format: "%.2f", usd)
                self.convertedEUR = String(format: "%.2f", eur)
                self.convertedJPY = String(format: "%.2f", jpy)
                self.isConverting = false
            }
        }
    }
}

#Preview {
    CurrencyConverterView()
}
