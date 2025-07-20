import SwiftUI

struct MainTabView: View {
    @Binding var history: [(expression: String, result: String)]

    var body: some View {
        TabView {
            CalculatorView(history: $history)
                .tabItem {
                    Label("Calculator", systemImage: "plus.forwardslash.minus")
                }

            CurrencyConverterView()
                .tabItem {
                    Label("Currency", systemImage: "dollarsign.circle")
                }

            AgeCalculatorView()
                .tabItem {
                    Label("Age", systemImage: "calendar")
                }

            BMICalculatorView()
                .tabItem {
                    Label("BMI", systemImage: "heart")
                }

            HistoryView(history: history) // Pass non-binding since it's read-only
                .tabItem {
                    Label("History", systemImage: "clock")
                }
        }
    }
}
