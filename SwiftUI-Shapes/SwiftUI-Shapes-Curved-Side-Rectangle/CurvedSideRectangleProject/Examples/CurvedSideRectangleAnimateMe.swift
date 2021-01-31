//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct CurvedSideRectangleAnimateMe: View {
    @State private var slideUp = false
    @State private var show = false
    
    let lgBackground = LinearGradient(gradient: Gradient(colors: [Color.themeTertiary, Color.themeBackground]), startPoint: .bottomLeading, endPoint: .topTrailing)
    let linearGradient = LinearGradient(gradient: Gradient(colors: [Color.themeTertiary, Color.themeBackground]), startPoint: .bottom, endPoint: .topTrailing)
    let radialGradient = RadialGradient(gradient: Gradient(colors: [.themeBackground, .themeTertiary]), center: .bottom, startRadius: 5, endRadius: 120)
    
    var body: some View {
        ZStack {
            lgBackground
            
            VStack {
                CurvedSideRectangle(bottomOffset: 40)
                    .fill(Color.themeSecondary)
                    .frame(height: 120.0)
                    .shadow(radius: 10, y: 5)
                    .overlay(
                        Text("Animate Me")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom, -10))
                
                VStack(spacing: 20.0) {
                    Text("Animate shapes moving into and out of the screen")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    Text("Use opposing shapes that fit together to create a cool effect.")
                    
                    Spacer()
                    
                    Text("Animate Your Shape")
                        .font(.title)
                        .fontWeight(.bold)
                    Image(systemName: "arrow.down")
                        .font(.title)
                    
                    Spacer()
                    
                }
                .padding([.top, .horizontal])
                
                Spacer()
            }
            
            GeometryReader { gr in
                ZStack {
                    VStack(spacing: 20) {
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
                        .rotationEffect(.degrees(self.slideUp ? 180 : 0))
                        .padding(.top, 40)
                        
                        Text("Gradients")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 40)
                        
                        Group {
                            Text("Since the trapezium is of type Shape, you can also apply gradients to it.")
                            
                            HStack(spacing: 40.0) {
                                CurvedSideRectangle(bottomOffset: 30)
                                    .fill(self.linearGradient)
                                    .frame(height: 100)
                                    .shadow(radius: 10, y: 10)
                                    .frame(maxWidth: .infinity)
                                
                                CurvedSideRectangle(bottomOffset: 30)
                                    .fill(self.radialGradient)
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
                        CurvedSideRectangle(topOffset: -40, bottomOffset: 0)
                            .fill(Color.themeSecondary)
                            .shadow(radius: 10, y: 35)
                    )
                        .offset(y: self.slideUp ? gr.size.height * 0.3 : gr.size.height * 0.85)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .foregroundColor(.themeForeground)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CurvedSideRectangleAnimateMe_Previews: PreviewProvider {
    static var previews: some View {
        CurvedSideRectangleAnimateMe()
    }
}
