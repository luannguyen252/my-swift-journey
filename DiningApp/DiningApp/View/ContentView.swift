//
//  ContentView.swift
//  DiningApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu){ section in
                    Section(header:Text(section.name)) {
                      ForEach(section.items){ item in
                        MenuItemRow(item: item)
                      }
                    }
                }
            }
         .navigationBarTitle("Menu")
         .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
