//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct CurvedSideRectangleLayerMe: View {
    let lg = LinearGradient(gradient: Gradient(colors: [Color.themeTertiary, Color.themeBackground]), startPoint: .topLeading, endPoint: .bottomTrailing)
    let lg2 = LinearGradient(gradient: Gradient(colors: [Color.themeTertiary, Color.themeBackground]), startPoint: .top, endPoint: .bottom)
    
    let opacity = 0.2
    
    var body: some View {
        ZStack {
            lg.edgesIgnoringSafeArea(.all)
            
            GeometryReader { gr in
                ZStack(alignment: .bottom) {
                    CurvedSideRectangle(topOffset: 40, bottomOffset: 0)
                        .fill(self.lg2)
                        .opacity(self.opacity)
                    CurvedSideRectangle(topOffset: 40, bottomOffset: 0)
                        .fill(self.lg2)
                        .opacity(self.opacity)
                        .frame(height: gr.size.height * 0.8)
                    CurvedSideRectangle(topOffset: 40, bottomOffset: 0)
                        .fill(self.lg2)
                        .opacity(self.opacity)
                        .frame(height: gr.size.height * 0.6)
                    CurvedSideRectangle(topOffset: 40, bottomOffset: 0)
                        .fill(self.lg2)
                        .opacity(self.opacity)
                        .frame(height: gr.size.height * 0.4)
                    CurvedSideRectangle(topOffset: 40, bottomOffset: 0)
                        .fill(self.lg2)
                        .opacity(self.opacity)
                        .frame(height: gr.size.height * 0.2)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .edgesIgnoringSafeArea(.bottom)
            }
            
            VStack(spacing: 20.0) {
                CurvedSideRectangle()
                    .fill(Color.themeTertiary)
                    .frame(height: 100.0)
                    .opacity(0.4)
                    .shadow(radius: 10, y: 5)
                
                Spacer()
                
                VStack(spacing: 40.0) {
                    Text("Overlapping")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    Text("Get creative by overlapping these shapes and using them as a background design.")
                    
                    Text("How about some outlines?")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Shapes can have strokes applied to them:")
                    
                    CurvedSideRectangle()
                        .stroke(Color.themeAccent, lineWidth: 10)
                        .frame(height: 120.0)
                        .padding()
                        .shadow(radius: 10, y: 5)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct CurvedSideRectangleLayerMe_Previews: PreviewProvider {
    static var previews: some View {
        CurvedSideRectangleLayerMe()
    }
}
