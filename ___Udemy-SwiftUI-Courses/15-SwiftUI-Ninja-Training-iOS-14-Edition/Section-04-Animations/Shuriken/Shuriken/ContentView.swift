//
//  ContentView.swift
//  Shuriken
//
//  Created by Kristijan Kralj on 07/12/2020.
//

import SwiftUI

struct ContentView: View {
  @State private var rotate = false
  @State private var move1 = false
  @State private var move2 = false
  @State private var move3 = false
  @State private var move4 = false
  
  let size: CGFloat = 150
  
    var body: some View {
      GeometryReader { gr in
        VStack(alignment: .leading) {
          Text("linear")
            .font(.largeTitle)
            .padding(.leading, 20)
          Image("shuriken")
            .resizable()
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: rotate ? 360 : 0))
            .offset(x: move1 ? gr.size.width - size : 0)
          
          Text("easeIn")
            .font(.largeTitle)
            .padding(.leading, 20)
          Image("shuriken")
            .resizable()
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: rotate ? 360 : 0))
            .offset(x: move2 ? gr.size.width - size : 0)
            .animation(.easeIn(duration: 3))
          
          Text("easeOut")
            .font(.largeTitle)
            .padding(.leading, 20)
          Image("shuriken")
            .resizable()
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: rotate ? 360 : 0))
            .offset(x: move3 ? gr.size.width - size : 0)
            .animation(.easeOut(duration: 3))
          
          Text("easeInOut")
            .font(.largeTitle)
            .padding(.leading, 20)
          Image("shuriken")
            .resizable()
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: rotate ? 360 : 0))
            .offset(x: move4 ? gr.size.width - size : 0)
            .animation(.easeInOut(duration: 3))
          
        }.onAppear {
          withAnimation(Animation.linear(duration: 3).delay(1).repeatCount(2, autoreverses: false)) {
            rotate.toggle()
          }
          withAnimation(.linear(duration: 3)) {
            move1.toggle()
          }
          move2.toggle()
          move3.toggle()
          move4.toggle()
      }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
