//
//  CalculationHistory.swift
//  CalcMate
//
//  Created by SAJAN  on 20/07/25.
//

//
//  CalculationHistory.swift
//  CalcMate
//
//  Created by SAJAN on 20/07/25.
//

import Foundation

class CalculationHistory: ObservableObject {
    @Published var history: [String] = []
    
    func add(_ entry: String) {
        history.insert(entry, at: 0)
        if history.count > 10 {
            history.removeLast()
        }
    }
}
