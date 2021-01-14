//
//  SwiftUIView.swift
//  SwiftUI_Templates
//
//  Created by Hui, Malachi | DCMS on 2020/07/04.
//  Copyright © 2020 Hui, Malachi | DCMS. All rights reserved.
//

import SwiftUI

struct SharingLove: View {
    var body: some View {
        VStack {
            Image("showlove")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(x: 0, y: 50)
            
            Spacer()
            
            Image("undraw_pride")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(y:-50)
            
            LoveButton()
        }

    }
}

struct LoveButton: View {
    @GestureState var tap = false
    @State var press = false
    
    var body: some View {
        ZStack {
            Image("thinkingFace")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .opacity(press ? 0 : 1)
                .scaleEffect(press ? 0 : 1)
            
            Image("heartIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                .opacity(press ? 1 : 0)
                .scaleEffect(press ? 1 : 0)
        }
        .frame(width: 120, height: 120)
        .overlay(
            Circle()
                .trim(from: tap ? 0.001 : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .frame(width: 88, height: 88)
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 5, x: 3, y: 3)
                .animation(.easeInOut)
        )
            .scaleEffect(tap ? 1.2 : 1)
            .gesture(
                LongPressGesture().updating($tap) { currentState, gestureState, transaction in
                    gestureState = currentState
                }
                .onEnded { value in
                    self.press.toggle()
                }
        )
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SharingLove()
    }
}
