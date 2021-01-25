//
//  ContentView.swift
//  Ratios_SwiftUI
//
//  Created by Tarokh on 7/23/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    // define some variables
    @State var coffeeAmount: String
    @State var waterAmount: String
    
    var body: some View {
        VStack {
            CoffeeInputView(coffeeAmount: $coffeeAmount)
                .padding(.top)
            VStack {
                Spacer()
                    .frame(height: 20)
                Divider()
                    .frame(width: 267)
                Spacer()
                    .frame(height: 20)
            }
            
            RatioInputView(waterAmount: $waterAmount)
            VStack {
                Spacer()
                    .frame(height: 20)
                Divider()
                    .frame(width: 267)
                Spacer()
                    .frame(height: 20)
            }
            
            WaterDisplayView(coffeeAmount: $coffeeAmount, waterAmount: $waterAmount)
            
            Spacer()
                .frame(height: 60)
            TimerView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(coffeeAmount: "", waterAmount: "")
    }
}
