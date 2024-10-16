//
//  ContentView.swift
//  iExpense
//
//  Created by Marat Fakhrizhanov on 27.09.2024.
//

import SwiftUI
import SwiftData

//struct StyleOfAmount: ViewModifier {
//    var amount: Double
//    func body(content: Content) -> some View {
//        var font = Font.system(size: 22, weight: .heavy, design: .default)
//        var foregroundColor = Color.black
//        if amount < 10 {
//            foregroundColor = Color.blue
//            
//        } else if amount == 10 || amount < 100 {
//            
//            foregroundColor = Color.purple
//            font = Font.system(size: 25, weight: .medium, design: .monospaced)
//        } else {
//            foregroundColor = Color.red
//            font = Font.system(size: 30, weight: .bold, design: .rounded)
//            
//        }
//        return content
//            .foregroundColor(foregroundColor)
//            .font(font)
//            .background(Color.yellow)
//            .clipShape(Capsule())
//            .padding(2)
//            .overlay {
//                Capsule().stroke(lineWidth: 3)
//            }
//            
//    }
//}
//
//extension View {
//    func castomModifier(amount: Double) -> some View {
//        modifier(StyleOfAmount(amount: amount))
//    }
//}

//@Observable
//class Expenses {
//    var items = [ExpenseItem]() {
//        didSet {
//            if let encoded = try? JSONEncoder().encode(items) {
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//    init() {
//        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
//                items = decodedItems
//                return
//            }
//        }
//        items = []
//    }
//}




struct ContentView: View {
   
    @State private var showingAddExpense = false
    @State private var selectorValue = 0
    
    let sortTeg = ["All", "Persona",  "Busines"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Choose sort") {
                    Picker("Sort", selection: $selectorValue) {
                        ForEach(0..<3){ number in
                            Text(sortTeg[number])
                        }
                    }
                    .pickerStyle(.segmented)
                    .colorMultiply(.purple)
                }
                
                if selectorValue == 0 {
                    SortedExpenses( sortBy: nil)
                }
                if selectorValue == 1 {
                    SortedExpenses(sortBy: sortTeg[selectorValue])
                }
                if selectorValue == 2 {
                    SortedExpenses(sortBy: sortTeg[selectorValue])
                }
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                addView()
        }
        }
    }
    
    func removeExpense(at offsets: IndexSet) {
       
    }
    
    func costLevel(cost: Double) -> String {
        if cost < 10 {
            return "unimportant"
        } else if cost < 100 {
            return "average"
        }else {
            return "large"
        }
    }
    
}

#Preview {
    ContentView()
}
