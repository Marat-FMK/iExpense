//
//  addView.swift
//  iExpense
//
//  Created by Marat Fakhrizhanov on 27.09.2024.
//

import SwiftUI
import SwiftData

struct addView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @Query var expenses: [Expense]
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @State private var showAlert = false
    
    let types = ["Personal", "Busines"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code:Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }.navigationTitle("add new expense")
                .alert("Remove", isPresented: $showAlert, actions: {
                    Button("Remove", role: .destructive) {
                        name = ""
                        type = "Personal"
                        amount = 0.0
                    }
                    Button("Cancel", role:.cancel, action: {})
                })
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            showAlert = true
                        } label: {
                            Text("Remove fields")
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            saveExpense(newExpense: Expense(name: name, type: type, amount: amount))
                        } label: {
                            HStack {
                                Image(systemName: "square.and.arrow.down.fill")
                                Text("save")
                            }
                        }
                        
                    }
                }
        }
    }
    
    private func saveExpense(newExpense: Expense) {
        modelContext.insert(newExpense)
        dismiss()
    }
}

#Preview {
    addView()
}
