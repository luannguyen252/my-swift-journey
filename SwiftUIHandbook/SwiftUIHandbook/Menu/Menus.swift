//
//  Menus.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct Menus: View {
    // MARK: - BODY
    var body: some View {
        // MARK: - MENU DEFAULT
        Menu("Create") {
            // 1.
            Button(action: {
                print("Cancel")
            }) {
                Text("Cancel")
                    .foregroundColor(.pink)
                    .padding(16)
            }
            
            // 2.
            Button(action: {
                print("Search")
            }) {
                Text("Search")
                    .foregroundColor(.pink)
                    .padding(16)
            }
            
            // 3.
            Button(action: {
                print("Add")
            }) {
                Text("Add")
                    .foregroundColor(.pink)
                    .padding(16)
            }
            
            // 4. Sub-Menu
            Menu("More") {
                Button(action: {
                    print("Rename")
                }) {
                    Text("Rename")
                        .foregroundColor(.pink)
                        .padding(16)
                }
                
                Button(action: {
                    print("Developer Mode")
                }) {
                    Text("Developer Mode")
                        .foregroundColor(.pink)
                        .padding(16)
                }
            }
        }
        .font(.title2)
        .foregroundColor(.black)
        
        // MARK: - MENU WITH ICON
        Menu {
            Button(action: {}) {
                Label("Create a file", systemImage: "doc")
            }

            Button(action: {}) {
                Label("Create a folder", systemImage: "folder")
            }
        }
        label: {
            Label("Add", systemImage: "plus")
        }
        .font(.title2)
        .foregroundColor(.black)
    }
}

// MARK: - PREVIEW
struct Menus_Previews: PreviewProvider {
    static var previews: some View {
        Menus()
    }
}
