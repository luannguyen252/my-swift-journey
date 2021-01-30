//
//  HeaderView.swift
//  Avacados
//
//  Created by Sandesh on 19/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    
    //MARK:- PROPERTIES
    
    var header: Header
    
    @State private var showHeadLine: Bool = false
    
    var slideinAnimation: Animation {
        Animation.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
            .speed(1)
            .delay(0.25)
    }
    var body: some View {
        ZStack {
            Image(header.image)
                .resizable()
                .scaledToFill()
            
            
            HStack(alignment: .top, spacing: 0) {
                
                Rectangle()
                    .fill(Color("ColorGreenLight"))
                    .frame(width: 4)
                VStack(alignment: .leading, spacing: 6) {
                    Text(header.headline)
                        .font(.system(.title, design: .serif))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                    
                    
                    Text(header.subheadline)
                        .font(.system(.footnote))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .shadow(radius: 3)
                }
                .padding(.vertical , 0)
                .padding(.horizontal, 20)
                .frame(width: 282, height: 105)
                .background(Color("ColorBlackTransparantLight"))
            }
            .frame(width: 285, height: 105, alignment: .center)
            .offset(x: -66, y: showHeadLine ? 75 : 220)
            .animation(slideinAnimation)
            .onAppear(perform: { self.showHeadLine.toggle() })
            
        }
        .frame(width: 480, height: 320, alignment: .center)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(header: headerData.last!)
            .previewLayout(.sizeThatFits)
            .environment(\.colorScheme, .dark)
    }
}
