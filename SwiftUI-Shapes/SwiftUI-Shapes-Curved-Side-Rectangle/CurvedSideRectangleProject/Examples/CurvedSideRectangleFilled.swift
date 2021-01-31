//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct CurvedSideRectangleFilled: View {
    var body: some View {
        ZStack {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                CurvedSideRectangle()
                    .fill(Color.themeTertiary)
                    .frame(height: 140.0)
                    .shadow(radius: 10, y: 5)
                    .overlay(
                        Text("Fill Me")
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center))
                
                Spacer()
                
                VStack(spacing: 20.0) {
                    Text("Customization Options")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Apply different colors and curve amounts")
                    
                    CurvedSideRectangle(bottomOffset: 10)
                        .fill(Color.themeAccent)
                        .frame(height: 80.0)
                        .shadow(radius: 5, y: 5)
                        .overlay(
                            Text("bottomOffset: 10")
                                .foregroundColor(.themeForeground))
                    
                    CurvedSideRectangle(bottomOffset: 20)
                        .fill(Color.themeForeground)
                        .frame(height: 80.0)
                        .shadow(radius: 5, y: 5)
                        .overlay(
                            Text("bottomOffset: 20")
                                .foregroundColor(.themeBackground))
                    
                    CurvedSideRectangle(bottomOffset: 30)
                        .fill(Color.themeSecondary)
                        .frame(height: 80.0)
                        .shadow(radius: 5, y: 5)
                        .overlay(
                            Text("bottomOffset: 30")
                                .foregroundColor(.themeForeground))
                    
                    CurvedSideRectangle(bottomOffset: 40)
                        .fill(Color.themeTertiary)
                        .frame(height: 80.0)
                        .shadow(radius: 5, y: 5)
                        .overlay(
                            Text("bottomOffset: 40")
                                .foregroundColor(.themeForeground))
                }
                .padding(.bottom)
                
                Spacer()
            }
        }
        .foregroundColor(.themeForeground)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CurvedSideRectangleFilled_Previews: PreviewProvider {
    static var previews: some View {
        CurvedSideRectangleFilled()
    }
}
