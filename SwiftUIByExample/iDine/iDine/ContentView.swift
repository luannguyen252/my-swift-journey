//
//  ContentView.swift
//  iDine
//
//  Created by Luan Nguyen on 31/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            ItemRow(item: item)
                        }
                    }
                }
            } //: LIST
            .navigationBarTitle("Menu")
        } //: NAVIGATION VIEW
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
