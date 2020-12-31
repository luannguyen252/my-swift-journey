//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct OutlinesAndOverlapping: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var show = false
    
    let lg = LinearGradient(gradient: Gradient(colors: [Color.themeTertiary, Color.themeBackground]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    let opacity = 0.2
    
    var body: some View {
        ZStack {
            lg.edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .bottom) {
                TrapeziumShape(offset: 0.4, corner: .topLeft)
                    .fill(Color.themeTertiary.opacity(opacity))
                TrapeziumShape(offset: 0.5, corner: .topLeft)
                    .fill(Color.themeTertiary.opacity(opacity))
                TrapeziumShape(offset: 0.6, corner: .topLeft)
                    .fill(Color.themeTertiary.opacity(opacity))
                TrapeziumShape(offset: 0.7, corner: .topLeft)
                    .fill(Color.themeTertiary.opacity(opacity))
                TrapeziumShape(offset: 0.8, corner: .topLeft)
                    .fill(Color.themeTertiary.opacity(opacity))
                TrapeziumShape(offset: 0.9, corner: .topLeft)
                    .fill(Color.themeTertiary.opacity(opacity))
                TrapeziumShape(offset: 1, corner: .topLeft)
                    .fill(Color.themeTertiary.opacity(opacity))
                TrapeziumShape(offset: 0.9, corner: .topRight)
                    .fill(Color.themeSecondary.opacity(0.4))
                    .frame(height: 100)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                ZStack(alignment: .top) {
                    TrapeziumShape(offset: 0, corner: .bottomRight)
                        .fill(Color.themeSecondary.opacity(0.5))
                        .frame(height: 150)
                    TrapeziumShape(offset: 0.5)
                        .fill(Color.themeTertiary.opacity(0.5))
                        .frame(height: 200)
                }
                
                VStack(spacing: 60.0) {
                    Text("Overlapping")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    Text("Get creative by overlapping trapeziums in your UI.")
                    
                    Text("How about some outlines?")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Shapes can have strokes applied to them:")
                    
                    HStack {
                        TrapeziumShape(corner: .topLeft)
                            .stroke(Color.themeAccent, lineWidth: 15)
                            .frame(width: 100, height: 100)
                            .shadow(radius: 10, y: 10)
                            .frame(maxWidth: .infinity)
                        
                        TrapeziumShape(corner: .topRight)
                            .stroke(Color.themeAccent, lineWidth: 10)
                            .frame(width: 100, height: 100)
                            .shadow(radius: 10, y: 10)
                            .frame(maxWidth: .infinity)
                        
                        TrapeziumShape(offset: 0.25, corner: .bottomRight)
                            .stroke(Color.themeAccent, lineWidth: 5)
                            .frame(width: 100, height: 100)
                            .shadow(radius: 10, y: 10)
                            .frame(maxWidth: .infinity)
                    }
                    
                    Spacer()
                    Spacer()
                }
                .padding(.horizontal)
            }
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
}

struct OutlinesAndOverlapping_Previews: PreviewProvider {
    static var previews: some View {
        OutlinesAndOverlapping()
    }
}
