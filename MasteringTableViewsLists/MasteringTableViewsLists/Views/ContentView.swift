//
//  ContentView.swift
//  MasteringTableViewsLists
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        // MARK: - NAVIGATION VIEW
        NavigationView {
            // MARK: - LIST
            List {
                NavigationLink(destination: DetailView(currentCategory: .burger)) {
                    CategoryView(imageName: "burger", categoryName: "BURGER")
                }
                NavigationLink(destination: DetailView(currentCategory: .pizza)) {
                    CategoryView(imageName: "pizza", categoryName: "PIZZA")
                }
                NavigationLink(destination: DetailView(currentCategory: .pasta)) {
                    CategoryView(imageName: "pasta", categoryName: "PASTA")
                }
                NavigationLink(destination: DetailView(currentCategory: .dessert)) {
                    CategoryView(imageName: "cake", categoryName: "DESSERTS")
                }
            }
            .navigationBarTitle(Text("Food Delivery"))
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
