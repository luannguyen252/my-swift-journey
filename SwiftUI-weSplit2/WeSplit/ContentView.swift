//
//  ContentView.swift
//  WeSplit
//
//  Created by Pushpinder Pal Singh on 11/02/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
   
    let tipPercentages = [10,15,20,25,0]
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0.0
        
        let tipvalue = orderAmount/100 * tipSelection
        let grandTotal = orderAmount + tipvalue
        let amount = grandTotal/peopleCount
        return amount
    }
    var body: some View {
        NavigationView{
        Form{
            Section{
                TextField("Amount",text: $checkAmount)
                    .keyboardType(.decimalPad)
                Picker("Number of people",selection: $numberOfPeople){
                    ForEach(2..<100){
                        Text("\($0) people")
                    }
                }
                
            }
            Section(header: Text("How much tip you want to leave?")){
                Picker("Tip Percentage", selection: $tipPercentage){
                    ForEach(0..<tipPercentages.count){
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
            .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Amount per person")){
                Text("$\(totalPerPerson,specifier: "%.2f")")
                }
            }
            }
        .navigationBarTitle("weSplit")
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
