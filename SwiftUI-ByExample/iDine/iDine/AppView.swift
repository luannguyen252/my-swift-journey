//
//  AppView.swift
//  iDine
//
//  Created by Luan Nguyen on 01/01/2021.
//

import SwiftUI

struct AppView: View {
    // MARK: - BODY
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct AppView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        AppView()
            .environmentObject(order)
    }
}
#endif
