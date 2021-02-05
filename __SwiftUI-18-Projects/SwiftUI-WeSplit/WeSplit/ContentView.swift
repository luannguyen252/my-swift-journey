//
//  ContentView.swift
//  WeSplit
//
//  Created by Sandesh on 04/03/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var checkAmout       = ""
    @State private var numberOfPeople   = ""
    @State private var tipPercentage    = 2
    
    let tipPercentages = [10, 5, 20, 25, 0]
    
    var totalPerson : (Double, Double) {
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmout) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return (amountPerPerson, grandTotal)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmout)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of People", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How much tip you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach( 0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Grand Total")) {
                    Text("$\(totalPerson.1, specifier: "%.2f")")
                        .foregroundColor( tipPercentage == 4 ? .red : .green)
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerson.0, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
