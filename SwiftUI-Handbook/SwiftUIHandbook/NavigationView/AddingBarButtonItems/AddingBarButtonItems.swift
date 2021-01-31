//
//  AddingBarButtonItems.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct AddingBarButtonItems: View {
    // MARK: - PROPERTIES
    @State private var score = 0
    
    // MARK: - BODY
    var body: some View {
        // 1.
        NavigationView {
            Text("Score: \(score)")
                .navigationBarTitle("Navigation")
                .navigationBarItems(
                    trailing:
                        Button("Add 1") {
                            self.score += 1
                        }
                )
        }
        
        // 2.
        NavigationView {
            Text("Score: \(score)")
                .navigationBarTitle("Navigation")
                .navigationBarItems(
                    leading:
                        Button("Subtract 1") {
                            self.score -= 1
                        },
                    trailing:
                        Button("Add 1") {
                            self.score += 1
                        }
                )
        }
        
        // 3.
        NavigationView {
            Text("Score: \(score)")
                .navigationBarTitle("Navigation")
                .navigationBarItems(
                    trailing:
                        HStack {
                            Button("Subtract 1") {
                                self.score -= 1
                            }
                            Button("Add 1") {
                                self.score += 1
                            }
                        }
                )
        }
    }
}

// MARK: - PREVIEW
struct AddingBarButtonItems_Previews: PreviewProvider {
    static var previews: some View {
        AddingBarButtonItems()
    }
}
