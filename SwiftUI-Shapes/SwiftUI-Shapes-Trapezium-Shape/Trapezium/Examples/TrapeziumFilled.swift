//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TrapeziumFilled: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color.themeBackground
            
            VStack(spacing: 0) {
                TrapeziumShape()
                    .fill(Color.themeTertiary)
                    .shadow(radius: 4, y: 4)
                    .frame(height: 200)
                    .overlay(Text("The Trapezium").font(.largeTitle).bold())
                
                VStack(spacing: 20.0) {
                    Text("What is a Trapezium?")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    Text("Well, it's kind of like a rectangle with one side that's slanted.")
                    
                    Spacer()
                    
                    Text("Customization Options")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Adjustable Slanting")
                    
                    HStack {
                        TrapeziumShape()
                            .fill(Color.themeAccent)
                            .frame(width: 100, height: 100)
                            .shadow(radius: 10, y: 10)
                            .frame(maxWidth: .infinity)
                        
                        TrapeziumShape(offset: 0.5)
                            .fill(Color.themeAccent)
                            .frame(width: 100, height: 100)
                            .shadow(radius: 10, y: 10)
                            .frame(maxWidth: .infinity)
                        
                        TrapeziumShape(offset: 0.25)
                            .fill(Color.themeAccent)
                            .frame(width: 100, height: 100)
                            .shadow(radius: 10, y: 10)
                            .frame(maxWidth: .infinity)
                    }
                    
                    HStack {
                        Text("75%").frame(maxWidth: .infinity)
                        Text("50%").frame(maxWidth: .infinity)
                        Text("25%").frame(maxWidth: .infinity)
                    }
                    
                    Group {
                        Text("Fill with any Color")
                        
                        HStack {
                            TrapeziumShape()
                                .fill(Color.themeAccent)
                                .frame(width: 100, height: 100)
                                .shadow(radius: 10, y: 10)
                                .frame(maxWidth: .infinity)
                            
                            TrapeziumShape(offset: 0.5)
                                .fill(Color.themeSecondary)
                                .frame(width: 100, height: 100)
                                .shadow(radius: 10, y: 10)
                                .frame(maxWidth: .infinity)
                            
                            TrapeziumShape(offset: 0.25)
                                .fill(Color.themeTertiary)
                                .frame(width: 100, height: 100)
                                .shadow(radius: 10, y: 10)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    Spacer()
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .accentColor(.themeAccent)
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

struct TrapeziumFilled_Previews: PreviewProvider {
    static var previews: some View {
        TrapeziumFilled()
            .preferredColorScheme(.dark)
    }
}
