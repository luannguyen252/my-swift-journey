//
//  CircularProgressButtonBar.swift
//  PurchaseButton
//
//  Created by Pablo Blanco González on 08/10/2020.
//

import SwiftUI

struct CircularProgressButtonBar: View {
    
    var progress = 0.0
    let foregroundColor: Color

    var body: some View {
        ZStack {
            
            // Background circle
            Circle()
                .stroke(Color.gray.opacity(0.5), lineWidth: 5)
                .frame(width: 30, height: 30)
            
            // Download progress circle
            Circle()
                .trim(from: 0.0, to: CGFloat(progress))
                .stroke(foregroundColor, lineWidth: 5)
                .frame(width: 30, height: 30)
                .rotationEffect(Angle(degrees: -90))
            
            // Cancel Button
            Rectangle()
                .frame(width: 10, height: 10)
                .cornerRadius(2)
        }
    }
}

struct CircularProgressButtonBar_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressButtonBar(foregroundColor: .blue)
    }
}
