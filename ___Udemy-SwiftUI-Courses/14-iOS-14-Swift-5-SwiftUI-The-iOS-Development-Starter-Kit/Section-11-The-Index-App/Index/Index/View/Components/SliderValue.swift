//
//  SliderValue.swift
//  Index
//
//  Created by Pao Yu on 2020-07-31.
//

import SwiftUI

struct SliderValue: View {
    
    @EnvironmentObject var model: IndexModel
    
    let value: Double
    let withDecimal: Bool
    
    var body: some View {
        
        if withDecimal == true {
            
            Text(String(format: "%0.1f", value))
                    .font(.title)
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(.white))
                    .background(Color(.systemGreen))
                    .clipShape(Circle())
            
        } else {
            
            Text(String(format: "%0.0f", value))
                    .font(.title)
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(.white))
                    .background(Color(.systemGreen))
                    .clipShape(Circle())
        }
        
    }
}
