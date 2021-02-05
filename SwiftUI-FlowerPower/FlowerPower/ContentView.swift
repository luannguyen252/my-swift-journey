//
//  ContentView.swift
//  FlowerPower
//
//  Created by Daniel Bolella on 7/12/19.
//  Copyright © 2019 Daniel Bolella. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var flowers : [Flower] = testFlowerData
    var body: some View {
        NavigationView {
            List(flowers) { flower in
                FlowerCell(flower: flower)
            }
            .navigationBarTitle("Test Flowers")
        }
    }
}

struct FlowerCell : View {
    var flower : Flower
    var body: some View {
        return NavigationLink(destination: FlowerDetail(flower: flower)){
            HStack{
                Image(flower.imageName)
                    .resizable()
                    .frame(width: 100, height: 60)
                
                Text(flower.name)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
