//
//  HeightCard.swift
//  Index
//
//  Created by Pao Yu on 2020-07-31.
//

import SwiftUI

struct HeightCard: View {
    
    @EnvironmentObject var model: IndexModel
    
    
    var body: some View {
        
        ZStack {
            
            CardBackground()
            
            if model.unit == .metric {
                
                VStack {
                    CardLabel(title: "Height", caption: "Enter Your Height (CM)")
                    
                    VStack {
                        SliderValue(value: model.metricHeightCM, withDecimal: false)
                            .padding(.bottom, 15)
                        Slider(value: $model.metricHeightCM, in: 1...250, step: 1.0)
                            .accentColor(Color(.systemGreen))
                    }   .frame(width: 150)
                }
                
            }
            
            if model.unit == .imperial {
                
                VStack {
                    CardLabel(title: "Height", caption: "Enter Your Height (Ft & In.)")
                    
                    HStack {
                        
                        VStack {
                            SliderValue(value: model.imperialHeightFT, withDecimal: false)
                            
                            Text("FEET")
                                .font(.caption2)
                                .foregroundColor(Color(.systemGray3))
                                .padding(.top, 10)
                            
                            Slider(value: $model.imperialHeightFT, in: 1...12, step: 1.0)
                                .accentColor(Color(.systemGreen))
                                .padding(.top, 15)
                        }   .frame(width: 100)
                        
                        VStack {
                            
                            SliderValue(value: model.imperialHeightIN, withDecimal: true)
                            
                            Text("INCHES")
                                .font(.caption2)
                                .foregroundColor(Color(.systemGray3))
                                .padding(.top, 10)
                            
                            Slider(value: $model.imperialHeightIN, in: 0...12, step: 0.5)
                                .accentColor(Color(.systemGreen))
                                .padding(.top, 15)
                        }   .frame(width: 100)
                    }
                }
            }
        }   .frame(width: 300, height: 500)
        // End of ZStack
    }
}
