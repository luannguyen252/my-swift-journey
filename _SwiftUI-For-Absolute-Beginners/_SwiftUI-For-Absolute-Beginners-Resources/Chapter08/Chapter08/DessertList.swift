//
//  DessertListView.swift
//  Chapter08
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct DessertList: View {
    let desserts: [DessertViewModel]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(desserts) { dessert in
                    DessertView(model: dessert)
                }
            }
            .navigationBarTitle("Just Desserts")
        }
    }
}

struct DessertList_Previews: PreviewProvider {
    static var previews: some View {
        //DessertList(desserts: [.icecream, .icecream, .icecream])
        DessertList(desserts: sampleDesserts)
    }
}


extension DessertList_Previews {
    static var sampleDesserts:[DessertViewModel] {
        guard let url = Bundle.main.url(forResource: "SampleDesserts", withExtension: "json"),
        let data = try? Data(contentsOf: url)
            else { return [] }
        let decoder = JSONDecoder()
        let array = try? decoder.decode([DessertViewModel].self, from: data)
        return array ?? [.icecream]
    }
}
