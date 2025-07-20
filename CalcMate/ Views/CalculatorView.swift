import SwiftUI

struct CalculatorView: View {
    @Binding var history: [(expression: String, result: String)]
    @State private var expression = ""
    @Environment(\.colorScheme) var colorScheme

    let buttons: [[String]] = [
        ["AC", "⌫", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "−"],
        ["1", "2", "3", "+"],
        ["0", ".", "=", ""]
    ]

    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            // Expression Display
            HStack {
                Spacer()
                Text(expression)
                    .font(.largeTitle)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding()
            }

            // Buttons Grid
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        if button != "" {
                            Button(action: {
                                self.handleButton(button)
                            }) {
                                Text(button)
                                    .font(.title)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                    .frame(width: self.buttonWidth(button), height: 60)
                                    .contentShape(Rectangle()) // makes the whole frame tappable
                            }
                        } else {
                            Spacer()
                        }
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Standard Calculator")
    }

    // MARK: - Handle Button Logic
    func handleButton(_ button: String) {
        switch button {
        case "AC":
            expression = ""
        case "⌫":
            if !expression.isEmpty {
                expression.removeLast()
            }
        case "=":
            let result = evaluate(expression)
            if result != "Error" {
                history.append((expression, result))
                if history.count > 10 {
                    history.removeFirst()
                }
            }
            expression = result
        default:
            expression.append(button)
        }
    }

    // MARK: - Evaluate Expression
    func evaluate(_ exp: String) -> String {
        let sanitized = exp
            .replacingOccurrences(of: "×", with: "*")
            .replacingOccurrences(of: "÷", with: "/")
            .replacingOccurrences(of: "−", with: "-")

        let expression = NSExpression(format: sanitized)
        if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            return String(format: "%g", result.doubleValue)
        } else {
            return "Error"
        }
    }

    // MARK: - Button Width Helper
    func buttonWidth(_ button: String) -> CGFloat {
        return button == "0" ? ((UIScreen.main.bounds.width - 5 * 12) / 2) : ((UIScreen.main.bounds.width - 5 * 12) / 4)
    }
}
