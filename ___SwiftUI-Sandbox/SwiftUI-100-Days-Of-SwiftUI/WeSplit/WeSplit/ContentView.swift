//
//  ContentView.swift
//  WeSplit
//
//  Created by Nicholas Fox on 11/26/19.
//  Copyright © 2019 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct ContentView: View {

  @State private var checkAmount = ""
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 2
  private let tipPercentages = [10, 15, 20, 25, 0]
  private var orderAmount: Double {
    return Double(checkAmount) ?? 0
  }
  private var tipAmount: Double {
    let tipSelection = Double(tipPercentages[tipPercentage])
    return orderAmount * (tipSelection / 100)
  }
  private var grandTotal: Double {
    return orderAmount + tipAmount
  }
  private var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let totalPerPerson = grandTotal / peopleCount
    return totalPerPerson
  }



  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad)

          Picker("Number of People", selection: $numberOfPeople) {
            ForEach(2..<100) {
              Text("\($0) people")
            }
          }
        }

        Section(header: Text("How much tip do you want to leave?")) {
          Picker("Tip Percentage", selection: $tipPercentage) {
            ForEach(0..<tipPercentages.count) {
              Text("\(self.tipPercentages[$0])%")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }

        Section(header: Text("Check Details")) {
          Text("Tip Amount: \(tipAmount, specifier: "%0.2f")")
          Text("Grand Total: \(grandTotal, specifier: "%0.2f")")
        }

        Section(header: Text("Amount per person")) {
          Text("$\(totalPerPerson, specifier: "%0.2f")")
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
