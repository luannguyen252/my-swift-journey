//
//  Exercise_SlidingSheets.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise_SlidingSheets: View {
    @State private var expandMoreInfo = false
    @State private var showLogin = false
    
    @State private var userName = ""
    @State private var password = ""
    
    let xOffset: CGFloat = -200
    let showLoginDuration: Double = 0.7
    let delay = 0.5
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Exercise").foregroundColor(Color("Gold"))
                    .font(Font.custom("DIN Condensed Bold", size: 70))
                Text("Show Login").foregroundColor(.gray)
                
                Spacer()
                
                VStack(spacing: 30) {
                    Image(systemName: "lock.shield")
                        .font(.system(size: 70))
                        .padding()
                        .foregroundColor(Color("Gold"))
                        .scaleEffect(showLogin ? 1 : 3)
                        .animation(Animation.easeIn(duration: showLoginDuration/2).delay(delay))
                    TextField("Username", text: self.$userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(x: showLogin ? 0 : xOffset)
                        .opacity(showLogin ? 1 : 0)
                        .animation(Animation.easeOut(duration: showLoginDuration).delay(delay+0.2))
                    SecureField("Password", text: self.$password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(x: showLogin ? 0 : xOffset)
                        .opacity(showLogin ? 1 : 0)
                        .animation(Animation.easeOut(duration: showLoginDuration).delay(delay+0.4))
                    Button("Login", action: { }).foregroundColor(Color("Accent"))
                        .offset(x: showLogin ? 0 : xOffset)
                        .opacity(showLogin ? 1 : 0)
                        .animation(Animation.easeOut(duration: showLoginDuration).delay(delay+0.6))
                }
                .padding(.horizontal)
                .onAppear {
                    self.showLogin = true
                }
                
                GeometryReader { gp in
                    VStack(spacing: 15) {
                        HStack {
                            Image(systemName: "info.circle").padding(.horizontal)
                            Text("Login Help")
                            Spacer()
                        }.padding(.top)
                        
                        VStack(spacing: 10) {
                            Image(systemName: "lock.open.fill").font(.largeTitle)
                            Text("Lorem ipsum dolor amet mumblecore kinfolk gastropub, raclette thunder cats DIY photo booth.")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).opacity(0.1))
                        .padding(.horizontal)
                        
                        Button("Recover Password", action: { }).foregroundColor(Color("Accent"))
                        
                        Spacer()
                    }
                    .padding(.trailing)
                    .foregroundColor(Color("Dark"))
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("Gold")).shadow(radius: 8))
                    .offset(x: self.expandMoreInfo ? 15 : (gp.frame(in: .global).width - 65),
                            y: self.expandMoreInfo ? 15 : (gp.frame(in: .global).height - 65))
                        .animation(Animation.easeInOut)
                        .onTapGesture {
                            self.expandMoreInfo.toggle()
                    }
                }
            }
            .font(.title)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Exercise_SlidingSheets_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_SlidingSheets()
    }
}
