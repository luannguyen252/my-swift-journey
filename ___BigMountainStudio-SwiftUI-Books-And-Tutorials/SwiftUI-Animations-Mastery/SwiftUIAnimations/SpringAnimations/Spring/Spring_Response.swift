//
//  Spring_Response.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/1/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Spring_Response: View {
    @State private var show = false
    @State private var response = 0.55 // This is the default response value
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                TitleText("Spring").foregroundColor(Color("Gold"))
                SubtitleText("Response")
                BannerText("Using the response parameter you can adjust the spring's response to being activated. Will it respond quickly or slowly?", backColor: Color("Gold"))
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color("Gold"))
                    .overlay(Image("Phone"))
                    .padding()
                    .scaleEffect(show ? 1 : 0.01, anchor: .bottom)
                    .opacity(show ? 1 : 0)
                    .animation(.spring(response: response, dampingFraction: 0.5)) // Adjust the response
                
                Button(action: {
                    self.show.toggle()
                }, label: {
                    Image(systemName: show ? "person.2.fill" : "person.2")
                        .foregroundColor(Color("Gold"))
                        .font(.largeTitle)
                }).accentColor(Color("Accent"))
                
                HStack {
                    Image(systemName: "0.circle.fill")
                    Slider(value: $response, in: 0...4) // 0 to 4 seconds
                    Image(systemName: "4.circle.fill")
                }.foregroundColor(Color("Gold")).padding()
            }.font(.title)
        }
    }
}

struct Spring_Response_Previews: PreviewProvider {
    static var previews: some View {
        Spring_Response()
    }
}
