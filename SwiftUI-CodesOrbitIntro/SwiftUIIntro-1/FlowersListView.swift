//
//  ContentView.swift
//  SwiftUIIntro-1
//
//  Created by Umer Khan on 19/10/2020.
//

import SwiftUI

struct FlowersListView: View {
    let flowers: [Flowers] = allFlowers
    
    var body: some View {
        
        NavigationView {
            List(flowers, id: \.self) { flower in
                FlowerView(flower: flower)
            }
            .navigationTitle("Flowers")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FlowersListView()
                .previewDevice("iPhone 11")
//            FlowersListView()
//                .previewDevice("iPhone SE (1st generation)")
//                .preferredColorScheme(.dark)
        }
    }
}
