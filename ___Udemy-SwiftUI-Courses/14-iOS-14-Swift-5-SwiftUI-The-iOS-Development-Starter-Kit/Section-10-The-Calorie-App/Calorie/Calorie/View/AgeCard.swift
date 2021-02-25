//
//  AgeCard.swift
//  Calorie
//
//  Created by Pao Yu on 2020-07-30.
//

import SwiftUI

struct AgeCard: View {
    
    @EnvironmentObject var model: CalorieModel
    
    var body: some View {
        
        ZStack {
            
            CardBackground()
            
            VStack {
                
                CardLabel(title: "Age", caption: "Enter Your Age")
                
                VStack {
                    SliderValue(value: model.age)
                        .padding(.bottom, 15)
                    Slider(value: $model.age, in: 15...80, step: 1.0)
                }   .frame(width: 150)
                
            }
        }   .frame(width: 300, height: 500)
    }
}
