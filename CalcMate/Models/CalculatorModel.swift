//
//  CalculatorModel.swift
//  CalcMate
//
//  Created by SAJAN on 20/07/25.
//

struct CalculatorModel {
    var currentInput: String = "0"
    var previousInput: String = ""
    var operation: String = ""

    mutating func input(_ value: String) {
        if currentInput == "0" && value != "." {
            currentInput = value
        } else {
            currentInput += value
        }
    }

    mutating func setOperation(_ op: String) {
        previousInput = currentInput
        currentInput = ""
        operation = op
    }

    mutating func calculate() {
        guard let first = Double(previousInput), let second = Double(currentInput) else { return }

        let result: Double

        switch operation {
        case "+": result = first + second
        case "-": result = first - second
        case "×": result = first * second
        case "÷":
            if second != 0 {
                result = first / second
            } else {
                currentInput = "Error"
                return
            }
        default: return
        }

        currentInput = formatResult(result)
        previousInput = ""
        operation = ""
    }

    mutating func clear() {
        currentInput = "0"
        previousInput = ""
        operation = ""
    }

    private func formatResult(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value)) // e.g. 4
        } else {
            return String(value)      // e.g. 1.5 or 2.75
        }
    }
}
