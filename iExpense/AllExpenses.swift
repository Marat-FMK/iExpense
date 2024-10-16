//
//  AllExpenses.swift
//  iExpense
//
//  Created by Marat Fakhrizhanov on 16.10.2024.
//

import Foundation

import SwiftData
import SwiftUI

//struct AllExpenses: View {
//      
//    @Query var expenses: [Expense]
//    
//    let sortBy: String
//    
//    var body: some View {
//        Section ( sortBy == "All"
//                  ? "All expenses"
//                  : "Sorted by \(sortBy)" ) {
//            
//            ForEach(expenses , id: \.self) { expense in
//                HStack{
//                    VStack(alignment: .leading) {
//                        Text(expense.name)
//                            .font(.headline)
//                        
//                        Text(expense.type)
//                    }
//                }
//                
//            }
//        }
//    }
//}
//
//#Preview {
//    AllExpenses(sortBy: "All")
//}
