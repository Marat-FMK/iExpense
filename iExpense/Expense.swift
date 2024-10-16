//
//  Expense.swift
//  iExpense
//
//  Created by Marat Fakhrizhanov on 16.10.2024.
//

import SwiftUI
import SwiftData

@Model
class Expense {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
    
}
