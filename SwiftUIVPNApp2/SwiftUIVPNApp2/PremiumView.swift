//
//  PremiumView.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct PremiumView: View {
    var fillRect = true
    
    var body: some View {
        Button {
            print("Button Pressed!")
        } label: {
            ZStack {
                if fillRect {
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.crownBackground)
                        .frame(width: 135, height: 40)
                } else {
                    RoundedRectangle(cornerRadius: 20.0)
                        .stroke(Color.crownBackground)
                        .frame(width: 135, height: 40)
                }
                
                HStack {
                    Image(systemName: "crown.fill")
                    Text("Premium")
                        .font(.system(size: 12, weight: .regular))
                        .textCase(.uppercase)
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct PremiumView_Previews: PreviewProvider {
    static var previews: some View {
        PremiumView()
    }
}
