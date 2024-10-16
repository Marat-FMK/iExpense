//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Marat Fakhrizhanov on 27.09.2024.
//

import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expense.self)
    }
}
