//
//  ToolbarsInNavigationView.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct ToolbarsInNavigationView: View {
    // MARK: - BODY
    var body: some View {
        // 1.
        NavigationView {
            Text("Hello, SwiftUI!")
                .padding()
                .navigationTitle("Navigation Title")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Press Me") {
                            print("Pressed")
                        }
                    }
                }
        }
        
        // 2.
        NavigationView {
            Text("Hello, SwiftUI!")
                .padding()
                .navigationTitle("Navigation Title")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Button("First") {
                                print("Pressed")
                            }

                            Button("Second") {
                                print("Pressed")
                            }
                        }
                    }
                }
        }
        
        // 3.
        NavigationView {
            VStack() {
                Text("Lorem ipsum dolor sit amet, ad usu justo novum voluptatibus, suas inermis voluptaria an has, vix hinc aliquid te.")
                
                Spacer()
            }
            .padding(.all, 16)
            .navigationTitle("SwiftUI Toolbar")
            
            // 1.
            .toolbar {
                // 2.
                ToolbarItem(placement: .bottomBar) {
                    // 3.
                    HStack(alignment: .center, spacing: 32) {
                        Image(systemName: "trash")
                        Image(systemName: "info")
                        Image(systemName: "paperclip")
                        
                        Text("Share")
                        // 4.
                        HStack {
                            Image(systemName: "photo")
                            Text("Photo")
                        }
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct ToolbarsInNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarsInNavigationView()
    }
}
