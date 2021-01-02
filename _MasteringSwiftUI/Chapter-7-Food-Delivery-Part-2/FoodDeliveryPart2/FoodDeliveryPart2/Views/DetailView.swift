//
//  DetailView.swift
//  FoodDeliveryPart2
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    // Set Current Category
    let currentCategory: Categories
    
    // Show Order Sheet
    @State var showOrderSheet = false
    
    // MARK: - BODY
    var body: some View {
        List(filterData(foodDataSet: foodData, by: currentCategory)) { food in
            DetailRow(food: food, showOrderSheet: $showOrderSheet)
        }
        .navigationTitle(Text(categoryString(for: currentCategory)))
        .sheet(isPresented: $showOrderSheet, content: {
            OrderForm(showOrderSheet: $showOrderSheet)
        })
        .listStyle(SidebarListStyle())
    }
}

// MARK: - PREVIEW
#if DEBUG
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(currentCategory: .burger)
    }
}
#endif
