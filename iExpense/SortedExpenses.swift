//
//  SortedExpenses.swift
//  iExpense
//
//  Created by Marat Fakhrizhanov on 16.10.2024.
//

import SwiftData
import SwiftUI

struct SortedExpenses: View {
    
    @Query var expenses: [Expense]
    
    let sortBy: String?
    
    var body: some View {
        Section ( sortBy == nil
                  ? "All expenses"
                  : "Sorted by \(sortBy ?? " ")" ) {
            ForEach(sortBy == nil ? expenses : expenses.filter{$0.type == sortBy} , id: \.self) { expense in
                HStack{
                    VStack(alignment: .leading) {
                        Text(expense.name)
                            .font(.headline)
                        
                        Text(expense.type)
                    }
                    .accessibilityElement(children: .ignore)
                    
                }
            }
        }
    }
}

#Preview {
    SortedExpenses( sortBy: "All")
}
