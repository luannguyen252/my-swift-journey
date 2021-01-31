//
//  Pickers.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct Pickers: View {
    // MARK: - PROPERTIES
    var fruits = ["Apple", "Banana", "Berry", "Orange"]
    @State private var selectedFruitIndex = 0
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Picker(selection: $selectedFruitIndex, label: Text("")) {
                ForEach(0 ..< fruits.count) {
                   Text(self.fruits[$0])
                }
             }
             Text("Your fruit is: \(fruits[selectedFruitIndex])")
          }
        .padding()
    }
}

// MARK: - PREVIEW
struct Pickers_Previews: PreviewProvider {
    static var previews: some View {
        Pickers()
    }
}
