//
//  Rings.swift
//  VPN (iOS)
//
//  Created by Balaji on 22/12/20.
//

import SwiftUI

// Rings....

struct Rings: View {
    
    var width: CGFloat
    @Binding var isServerOn : Bool
    
    var body: some View{
        
        ZStack{
            
            ForEach(1...60,id: \.self){index in
                
                Circle()
                    .fill(isServerOn ? Color.green : Color.white)
                    .frame(width: getSize(index: index), height: getSize(index: index))
                    .offset(x: -(width / 2))
                    .rotationEffect(.init(degrees: Double(index) * 6))
                    .opacity(getSize(index: index) == 3 ? 0.7 : (isServerOn ? 1 : 0.8))
            }
        }
        .frame(width: width)
        .rotationEffect(.init(degrees: 90))
    }
}

