//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Parallelogram: View {
    @State private var slideUp = false
    @Environment(\.presentationMode) var presentationMode
    @State private var show = false
    
    let lgBackground = LinearGradient(gradient: Gradient(colors: [Color.themeTertiary, Color.themeBackground]), startPoint: .bottomLeading, endPoint: .topTrailing)
    let linearGradient = LinearGradient(gradient: Gradient(colors: [Color.themeTertiary, Color.themeBackground]), startPoint: .bottom, endPoint: .topTrailing)
    let radialGradient = RadialGradient(gradient: Gradient(colors: [.themeBackground, .themeTertiary]), center: .bottom, startRadius: 5, endRadius: 120)
    
    var body: some View {
        ZStack {
            lgBackground
            
            VStack(spacing: 0) {
                TrapeziumShape(offset: 0.6, corner: .bottomRight)
                    .fill(Color.themeSecondary)
                    .shadow(radius: 4, y: 4)
                    .frame(height: 200)
                    .overlay(
                        Text("Parallelogram")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom, 40))
                
                VStack(spacing: 20.0) {
                    Text("Turn your UI into a Parallelogram")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    Text("Make your UI look like it is a Parallelogram by putting a trapezium shape on the top and bottom of your screens.")
                    
                    Spacer()
                    
                    Text("Animate Your Shape")
                        .font(.title)
                        .fontWeight(.bold)
                    Image(systemName: "arrow.down")
                        .font(.title)
                    
                    Spacer()
                    Spacer()
                    
                }
                .padding([.top, .horizontal])
                
                Spacer()
            }
            
            ZStack {
                VStack(spacing: 40) {
                    Button(action: {
                        withAnimation(Animation.easeInOut(duration: 0.6)) {
                            self.slideUp.toggle()
                        }
                    }) {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(Font.system(size: 50))
                            .foregroundColor(.themeAccent)
                    }
                    .shadow(radius: 1, y: 1)
                    .rotationEffect(.degrees(slideUp ? 180 : 0))
                    .padding(.top, 70)
                    
                    Text("Gradients")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 40)
                    
                    Group {
                        Text("Since the trapezium is of type Shape, you can also apply gradients to it.")
                        
                        HStack(spacing: 40.0) {
                            TrapeziumShape(corner: .topLeft)
                                .fill(linearGradient)
                                .frame(height: 100)
                                .shadow(radius: 10, y: 10)
                                .frame(maxWidth: .infinity)
                            
                            TrapeziumShape()
                                .fill(radialGradient)
                                .frame(height: 100)
                                .shadow(radius: 10, y: 10)
                                .frame(maxWidth: .infinity)
                        }
                        
                        HStack {
                            Text("Linear").frame(maxWidth: .infinity)
                            Text("Radial").frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.horizontal, 40)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(
                    VStack(spacing: 0.0) {
                        TrapeziumShape(offset: 0.4, corner: .topLeft)
                            .fill(Color.themeSecondary)
                            .shadow(radius: 4, y: -4)
                            .frame(height: 200)
                        Rectangle()
                            .fill(Color.themeSecondary)
                    }
                )
                    .offset(y: slideUp ? 300 : 750)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
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

struct Parallelogram_Previews: PreviewProvider {
    static var previews: some View {
        Parallelogram()
        //            .preferredColorScheme(.dark)
    }
}
