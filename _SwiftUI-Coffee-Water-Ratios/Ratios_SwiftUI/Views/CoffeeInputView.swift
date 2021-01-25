//
//  CoffeeInput.swift
//  Ratios_SwiftUI
//
//  Created by Tarokh on 7/23/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import SwiftUI

struct CoffeeInputView: View {
    
    @Binding var coffeeAmount: String
    
    var body: some View {
        VStack {
             Text("How much coffee?")
            .bold()
            .foregroundColor(Color("Text"))
            .fixedSize()
                .font(.system(size: 24))
            
            TextField("", text: $coffeeAmount)
                .frame(width: CGFloat(150), height: CGFloat(39))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Primary"), lineWidth: 3.0)
            )
                .multilineTextAlignment(.center)
            
            Text("grams")
            .fixedSize()
            .foregroundColor(Color("Text"))
                .font(.system(size: 14))
        }
    }
}

struct CoffeeInput_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeInputView(coffeeAmount: .constant(""))
    }
}
