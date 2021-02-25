//
//  WeightCard.swift
//  Index
//
//  Created by Pao Yu on 2020-07-31.
//

import SwiftUI

struct WeightCard: View {
    
    @EnvironmentObject var model: IndexModel
    
    var body: some View {
        
        ZStack {
            
            CardBackground()
            
            
            VStack {
                
                if model.unit == .metric {
                    
                    CardLabel(title: "Weight", caption: "Enter Your Weight (KG)")
                    
                    VStack {
                        SliderValue(value: model.metricWeightKG, withDecimal: false)
                            .padding(.bottom, 15)
                        Slider(value: $model.metricWeightKG, in: 1...250, step: 1.0)
                            .accentColor(Color(.systemGreen))
                    }   .frame(width: 150)
                    
                }
                
                if model.unit == .imperial {
                    
                    CardLabel(title: "Weight", caption: "Enter Your Weight (LBS)")
                    
                    VStack {
                        SliderValue(value: model.imperialWeightLB, withDecimal: false)
                            .padding(.bottom, 15)
                        Slider(value: $model.imperialWeightLB, in: 1...350, step: 1.0)
                            .accentColor(Color(.systemGreen))
                    }   .frame(width: 150)
                }
                
                
            }
        } .frame(width: 300, height: 500)
        // End of ZStack
    }
}
