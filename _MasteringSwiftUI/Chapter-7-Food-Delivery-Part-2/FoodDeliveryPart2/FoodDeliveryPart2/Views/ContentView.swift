//
//  ContentView.swift
//  FoodDeliveryPart2
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
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
                NavigationLink(destination: DetailView(currentCategory: .desserts)) {
                    CategoryView(imageName: "desserts", categoryName: "DESSERTS")
                }
            }
            .navigationTitle(Text("Food Delivery"))
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
#endif
