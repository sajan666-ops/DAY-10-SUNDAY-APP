//
//  CalculationEntry.swift
//  CalcMate
//
//  Created by SAJAN  on 20/07/25.
//

import Foundation

struct CalculationEntry: Identifiable {
    let id = UUID()
    let expression: String
    let result: String
}
