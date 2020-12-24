//
//  PickersInNavigationView.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct PickersInNavigationView: View {
    // MARK: - PROPERTIES
    var fruits = ["Apple", "Banana", "Berry", "Orange"]
    @State private var selectedFruitIndex = 0
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedFruitIndex, label: Text("Favorite Fruit")) {
                        ForEach(0 ..< fruits.count) {
                            Text(self.fruits[$0])
                        }
                    }
                }
            }
            .navigationBarTitle("Fruits")
        }
    }
}

// MARK: - PREVIEW
struct PickersInNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        PickersInNavigationView()
    }
}
