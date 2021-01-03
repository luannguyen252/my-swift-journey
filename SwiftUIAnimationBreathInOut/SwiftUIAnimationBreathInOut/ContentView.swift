//
//  ContentView.swift
//  SwiftUIAnimationBreathInOut
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black, Color.black]), center: .center, startRadius: 5, endRadius: 500)
                .scaleEffect(1.2)
            
            VStack {
                ZStack {
                    VStack(spacing: 16) {
                        Image(uiImage: #imageLiteral(resourceName: "profile"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                            .cornerRadius(16)
                        
                        Text("SwiftUI Animation")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 16)
                
                Spacer()
                
                BreathInOut1()
                
                Spacer(minLength: 0)
                
                BreathInOut2()
                
                Spacer(minLength: 0)
                
                BreathInOut3()
                
                Spacer()
            }
        }
        .statusBar(hidden: true)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
