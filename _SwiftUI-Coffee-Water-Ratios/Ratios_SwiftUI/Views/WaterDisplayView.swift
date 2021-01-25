//
//  WaterDisplayView.swift
//  Ratios_SwiftUI
//
//  Created by Tarokh on 7/23/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import SwiftUI

struct WaterDisplayView: View {
    
    // define some variables
    @Binding var coffeeAmount: String
    @Binding var waterAmount: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text("You need")
            .bold()
            .fixedSize()
            .foregroundColor(Color("Text"))
                .font(.system(size: 24))
            
            Text(
                String(
                    CoffeeModel.calculateRatio(grams: grams(coffeeAmount) ?? 0.0, ratio: grams(waterAmount) ?? 0.0)
                )
            )
            .fixedSize()
                .font(.system(size: 72))
            
            Text("grams of water")
            .fixedSize()
                .font(.system(size: 24))
        }
    }
}

struct WaterDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        WaterDisplayView(coffeeAmount: .constant(""), waterAmount: .constant(""))
    }
}
