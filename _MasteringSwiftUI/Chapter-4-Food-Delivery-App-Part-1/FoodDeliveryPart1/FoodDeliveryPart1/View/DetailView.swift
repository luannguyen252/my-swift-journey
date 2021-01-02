//
//  DetailView.swift
//  FoodDeliveryPart1
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    let currentCategory: Categories
    
    // MARK: - BODY
    var body: some View {
        List(filterData(foodDataSet: foodData, by: currentCategory)) { food in
            DetailRow(food: food)
        }
        .navigationTitle(Text(categoryString(for: currentCategory)))
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
