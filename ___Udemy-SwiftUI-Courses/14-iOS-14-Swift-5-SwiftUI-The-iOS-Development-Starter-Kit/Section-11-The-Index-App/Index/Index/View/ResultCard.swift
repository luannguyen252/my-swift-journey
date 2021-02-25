//
//  ResultCard.swift
//  Index
//
//  Created by Pao Yu on 2020-07-31.
//

import SwiftUI

struct ResultCard: View {
    
    @EnvironmentObject var model: IndexModel
    
    var body: some View {
        
        ZStack {
            
            CardBackground()
            
            VStack {
                
                CardLabel(title: "Result", caption: "Your Body Mass Index is")
                
                VStack {
                    Text(String(format: "%0.1f", model.resultBMI))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemGreen))
                    
                    Text("kg / m^2")
                        .font(.caption)
                        .padding(.top, 20)
                        .foregroundColor(Color(.systemGray))
                    
                    Text("\(model.message)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                        .foregroundColor(Color(.systemGray))
                    
                    
                }
            }
        }   .frame(width: 300, height: 500)
        // End of ZStack
    }
}

