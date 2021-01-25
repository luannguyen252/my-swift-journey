//
//  ContentView.swift
//  Animation1
//
//  Created by Rohit Saini on 31/12/20.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount1 = 0.0
    @State private var animationAmount2 = 0.0
    @State private var animationAmount3 = 0.0
    var body: some View {
  
            
        VStack(alignment: .center, spacing: 50){
                Button(action: {
                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                        animationAmount1 += 360
                    }
                    
                }, label: {
                    Text("HAPPY NEW YEAR").font(.title).bold()
                        .padding(50)
                        .background(LinearGradient.init(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .trailing)).cornerRadius(20)
                        .foregroundColor(.white)
                        .shadow(radius: 100)
                        .rotation3DEffect(
                            .degrees(Double(animationAmount1)),
                            axis: (x: 0.2, y: 0.8, z: 0.3)
                        )
                })
                Button(action: {
                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                        animationAmount2 += 360
                    }
                    
                }, label: {
                    Text("2021").font(.custom("Helvetica Neue", size: 40)).bold()
                        .padding(50)
                        .background(LinearGradient.init(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .trailing)).cornerRadius(20)
                        .foregroundColor(.white)
                        .shadow(radius: 100)
                        .rotation3DEffect(
                            .degrees(Double(animationAmount2)),
                            axis: (x: 0.7, y: 1.0, z: 0.8)
                        )
                })
                Button(action: {
                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                        animationAmount3 += 360
                    }
                    
                }, label: {
                    Text("MAY THIS NEW YEAR BRINGS MORE HAPPINESS🤗👨🏻‍💻").font(.title2).bold()
                        .padding(50)
                        .background(LinearGradient.init(gradient: Gradient(colors: [Color("Color2"), Color("Color1")]), startPoint: .topLeading, endPoint: .trailing)).cornerRadius(20)
                        .foregroundColor(.white)
                        .shadow(radius: 100)
                        .rotation3DEffect(
                            .degrees(Double(animationAmount3)),
                            axis: (x: 0.3, y: 1.0, z: 0.6)
                        )
                })
            }
        }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
