//
//  CalculatorViewModel.swift
//  CalcMate
//
//  Created by SAJAN  on 20/07/25.
//import Foundation
import Combine
import Foundation


class CalculatorViewModel: ObservableObject {
    @Published var input: String = ""
    @Published var result: String = ""

    func calculate() {
        let expression = NSExpression(format: input)
        if let value = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            result = "\(value)"
        } else {
            result = "Error"
        }
    }
}

