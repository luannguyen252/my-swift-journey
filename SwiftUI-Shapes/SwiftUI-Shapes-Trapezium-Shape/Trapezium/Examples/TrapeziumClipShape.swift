//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TrapeziumClipShape: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color.themeBackground
            
            VStack(spacing: 0) {
                Image("jordan-steranka")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300.0)
                    .clipShape(TrapeziumShape(offset: 0.65))
                    .shadow(radius: 16)
                    .overlay(Text("M A S K").font(Font.system(size: 80)).fontWeight(.black).foregroundColor(.white).opacity(0.7))
                
                VStack(spacing: 20.0) {
                    Text("Masking")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.top, -5)
                    
                    Text("Because the our custom trapezium is of type Shape, it can be used with the clipShape modifier as a mask.")
                    
                    Spacer()
                    
                    Text("More Options!")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Choose Your Corner")
                    
                    HStack {
                        TrapeziumShape(corner: .topLeft)
                            .fill(Color.themeAccent)
                            .frame(width: 100, height: 100)
                            .shadow(radius: 10, y: 10)
                            .frame(maxWidth: .infinity)
                        
                        TrapeziumShape(corner: .topRight)
                            .fill(Color.themeAccent)
                            .frame(width: 100, height: 100)
                            .shadow(radius: 10, y: 10)
                            .frame(maxWidth: .infinity)
                        
                        TrapeziumShape(offset: 0.25, corner: .bottomRight)
                            .fill(Color.themeAccent)
                            .frame(width: 100, height: 100)
                            .shadow(radius: 10, y: 10)
                            .frame(maxWidth: .infinity)
                    }
                    
                    HStack {
                        Text("Top Left").frame(maxWidth: .infinity)
                        Text("Top Right").frame(maxWidth: .infinity)
                        Text("Bottom Right").frame(maxWidth: .infinity)
                    }
                    
                    Spacer()
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .foregroundColor(.themeForeground)
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                TrapeziumShape(offset: 0.5, corner: .bottomRight)
                    .fill(Color.themeAccent)
                    .rotationEffect(.degrees(90))
                    .frame(width: 22, height: 44)
                    .shadow(radius: 2, y: 2)
                    .opacity(show ? 1 : 0)
                    .animation(.default)
            }
            .onAppear(perform: { self.show.toggle() }))
    }
}

struct TrapeziumClipShape_Previews: PreviewProvider {
    static var previews: some View {
        TrapeziumClipShape()
    }
}
