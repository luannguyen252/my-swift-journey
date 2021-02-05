//
//  Effects.swift
//  Drawing
//
//  Created by Sandesh on 03/06/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI
/*
 Blending mode : - defines how one pixel is drawn over another pixel when view are place over one another. There are many option availabel for blending mode
 
 .multiple is most common option so it can used using a shortcut .colorMultiply. Thats remoives burdon of adding rectancle
 
 .screen effect inverts the colors, apply multiply and inverts the again
 
     VStack {
         ZStack {
             Circle()
                 .fill(Color(red: 1, green: 0, blue: 0))
                 .frame(width: 200*amount)
                 .offset(x: -50, y: -80)
                 .blendMode(.difference)
             
             Circle()
                 .fill(Color(red: 0, green: 1, blue: 0))
                 .frame(width: 200*amount)
                 .offset(x: 50, y: -80)
                 .blendMode(.screen)
             
             Circle()
                 .fill(Color(red: 0, green: 0, blue: 1))
                 .frame(width: 200*amount)
                 .blendMode(.screen)
         }
         .frame(width: 300, height: 300)
         
         Slider(value: $amount)
             .padding()
     }
     .frame(maxWidth: .infinity, maxHeight: .infinity)
     .background(Color.black)
     .edgesIgnoringSafeArea(.all)
 */

struct Effects: View {
    
    @State private var amount: CGFloat = 0.0
    var body: some View {
        VStack {
            Image("sandesh")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
    }
}

struct Effects_Previews: PreviewProvider {
    static var previews: some View {
        Effects()
    }
}
