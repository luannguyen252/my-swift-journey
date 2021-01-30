//
//  AvacadoView.swift
//  Avacados
//
//  Created by Sandesh on 16/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct AvacadoView: View {
    
    //MARK:- Properties
    @State private var pulsate: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("avocado")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 240, height: 240)
                .shadow(color: Color("ColorBlackTransparantDark"), radius: 12, x: 0, y: 8)
                .scaleEffect(self.pulsate ? 1 : 0.9)
                .opacity(self.pulsate ? 1 : 0.9)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
            
            
            
            VStack {
                Text("Avocados".uppercased())
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundColor(Color.white)
                    .padding()
                    .shadow(color: Color("ColorBlackTransparantDark"), radius: 4, x: 0, y: 4)
                
                Text("""
Creamy, green, and full of nutrients!
 Avocado is a powerhouse ingredient at any meal.Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
""")
                .lineLimit(nil)
                    .font(.system(.headline, design: .serif))
                    .foregroundColor(Color("ColorGreenLight"))
                    .multilineTextAlignment(.center)
                .lineSpacing(8)
                    .frame(maxWidth: 640, minHeight: 120)
            }
            .padding()
            Spacer()
        }
            
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: { self.pulsate.toggle() })
    }
}

struct AvacadoView_Previews: PreviewProvider {
    static var previews: some View {
        AvacadoView()
        .previewDevice("iPhone 11 Pro")
            .environment(\.colorScheme, .dark)
    }
}



