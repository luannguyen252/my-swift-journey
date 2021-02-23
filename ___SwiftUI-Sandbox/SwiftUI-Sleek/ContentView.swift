//
//  LandingPage.swift
//  Swiftlycode
//
//  Created by Navdeep Singh on 5/19/20.
//  Copyright © 2020 Navdeep Singh. All rights reserved.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
        ZStack {
            Image("photo").resizable().aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all)
            
            Rectangle()                         // Shapes are resizable by default
            .foregroundColor(.clear)        // Making rectangle transparent
                .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .bottom, endPoint: .top)).edgesIgnoringSafeArea(.all)
            VStack (spacing: 20) {
                Text("SLEEK").font(.title).fontWeight(.heavy)
                Spacer()
                VStack {
                    Text("Be Classy.").font(.system(size: 40, design: .monospaced)).fontWeight(.heavy)
                    Text("Be Stylish.").font(.system(size: 40, design: .monospaced)).fontWeight(.heavy)
                    Text("Be Exclusive.").font(.system(size: 40, design: .monospaced)).fontWeight(.heavy)
                }.padding(.vertical, 20)
                    Text("Check out the trendy apparel and put together the perfect outfit. ").lineLimit(2).multilineTextAlignment(.center)
                Button(action: {}){
                    Text("Join the Cult").padding()
                }.frame(width: 300).background(Color.black)
            }.frame(width: UIScreen.main.bounds.width - 40).foregroundColor(.white)
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
