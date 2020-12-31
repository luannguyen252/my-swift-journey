//   | @BigMtnStudio

import SwiftUI

struct TriangleFilled: View {
    var body: some View {
        ZStack {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Triangle()
                    .fill(Color.themeSecondary)
                    .frame(height: 200.0)
                    .scaleEffect(y: -1)
                    .shadow(radius: 4)
                
                Spacer()
                
                VStack(spacing: 40.0) {
                    Text("Customization Options")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Apply different colors and curve amounts")
                    
                    Triangle(xOffset: 0.5)
                        .fill(Color.themeAccent)
                        .frame(height: 80.0)
                        .shadow(radius: 5, y: 5)
                        .overlay(
                            Text("xOffset: 0.5"))
                    
                    Triangle(xOffset: 1)
                        .fill(Color.themeTertiary)
                        .frame(width: 200, height: 80.0)
                        .shadow(radius: 5, y: 5)
                        .overlay(
                            Text("xOffset: 1"))
                    
                    Triangle(xOffset: -0.75)
                        .fill(Color.themeSecondary)
                        .frame(width: 150, height: 80.0)
                        .shadow(radius: 5, y: 5)
                        .overlay(
                            Text("xOffset: -0.75"))
                }
                .padding(.bottom)
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
        }
        .foregroundColor(.themeForeground)
        .navigationTitle("Filled Triangle")
    }
}

struct TriangleFilled_Previews: PreviewProvider {
    static var previews: some View {
        TriangleFilled()
    }
}
