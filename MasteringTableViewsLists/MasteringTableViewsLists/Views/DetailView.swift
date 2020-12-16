//
//  DetailView.swift
//  MasteringTableViewsLists
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    var currentCategory: Categories
    
    // MARK: - BODY
    var body: some View {
        // MARK: - FOOD LIST
        List(filterData(by: currentCategory)) { food in
            DetailRow(food: food)
        }
        .navigationBarTitle(Text(categoryString(for: currentCategory)), displayMode: .inline)
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
