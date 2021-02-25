//
//  LoadingView.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 16/12/2020.
//

import SwiftUI

struct LoadingView: View {
  @State private var show = false
  
    var body: some View {
      VStack {
        Text("Almost there...")
          .font(.title)
          .bold()
          .padding()
          .opacity(show ? 1 : 0)
          .animation(Animation.linear(duration: 1).delay(0.2))
        LottieView(animationName: "success")
          .frame(width: 260, height: 200)
          .opacity(show ? 1 : 0)
          .animation(Animation.linear(duration: 1).delay(0.3))
      }
      .onAppear {
        show.toggle()
      }
      .background(Color.main
                    .opacity(0.8)
                    .cornerRadius(30)
                    .shadow(color: Color.black.opacity(0.5), radius: 30, x: 0, y: 30))
      .offset(x: 0, y: -50)
      .scaleEffect(show ? 1 : 0.5)
      .animation(.spring(response: 0.5, dampingFraction: 0.6))
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.black.opacity(0.5)
                  .ignoresSafeArea(.all))

    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
      LoadingView()
        
    }
}
