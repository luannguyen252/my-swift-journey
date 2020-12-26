//
//  CardView.swift
//  AnimatedSortBankCards
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct CardView: View {
    let title: String
    let color1: Color
    let color2: Color
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(16)
                .frame(width: 320, height: 200)
            
            HStack(alignment: .center, spacing: 8) {
                Image(systemName: "creditcard.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .opacity(0.5)
                
                Text(title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
        }
        .shadow(color: colorScheme == .dark ? color1.opacity(0.25) : Color.black.opacity(0.25), radius: 16, x: 1, y: 1)
    }
}

#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "MBBank", color1: Color("mbbank1"), color2: Color("mbbank2"))
    }
}
#endif
