//
//  WeightCard.swift
//  Calorie
//
//  Created by Pao Yu on 2020-07-30.
//

import SwiftUI

struct WeightCard: View {
    
    @EnvironmentObject var model: CalorieModel
    
    var body: some View {
        
        ZStack {
            
            CardBackground()
            
            VStack {
                
                CardLabel(title: "Weight", caption: "Enter Your Weight (KG)")
                
                VStack {
                    SliderValue(value: model.weight)
                        .padding(.bottom, 15)
                    Slider(value: $model.weight, in: 1...250, step: 1.0)
                }   .frame(width: 150)
                
            }
        } .frame(width: 300, height: 500)
    }
}
