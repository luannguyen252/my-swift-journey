//
//  SuccessView.swift
//  DesignCode.v3
//
//  Created by Tee Becker on 11/6/20.
//

import SwiftUI

struct SuccessView: View {
    @State var show = false
    
    var body: some View {
        
        VStack {
            Text("Logging in...")
                .font(.largeTitle)
                .bold()
                .opacity(show ? 1 : 0)
                .animation(Animation.linear(duration: 1)
                            .delay(0.3))
            
            LottieView(filename: "5184-success")
                .frame(width: 300 , height: 300)
                .opacity(show ? 1 : 0)
                .scaleEffect(0.65)
                .animation(Animation.linear(duration: 1)
                            .delay(0.5))
                
        }
        .padding(.top, 30)
        .background(BlurView(style: .systemMaterial))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.2),
                radius: 30, x: 0, y: 30)
        .scaleEffect(show ? 1 : 0.5)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .onAppear{
            show = true
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(show ? 0.5 : 0))
        .animation(.linear(duration: 0.5))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
