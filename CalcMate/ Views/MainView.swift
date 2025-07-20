import SwiftUI

struct MainTabView: View {
    @State private var history: [String] = []

    var body: some View {
        TabView {
            CalculatorView(history: $history)
                .tabItem {
                    Label("Calculator", systemImage: "plus.slash.minus")
                }

            BMICalculatorView()
                .tabItem {
                    Label("BMI", systemImage: "heart")
                }

            AgeCalculatorView()
                .tabItem {
                    Label("Age", systemImage: "calendar")
                }

            CurrencyConverterView()
                .tabItem {
                    Label("Currency", systemImage: "dollarsign.circle")
                }

            HistoryView(history: $history)
                .tabItem {
                    Label("History", systemImage: "clock.arrow.circlepath")
                }
        }
    }
}
