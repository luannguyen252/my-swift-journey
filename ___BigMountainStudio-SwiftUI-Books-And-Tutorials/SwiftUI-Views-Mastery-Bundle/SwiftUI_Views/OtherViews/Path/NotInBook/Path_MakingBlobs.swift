//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Path_MakingBlobs: View {
    let lg = LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]),
                            startPoint: .topTrailing,
                            endPoint: .bottomLeading)
    
    let lg2 = LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]),
                             startPoint: .topTrailing,
                             endPoint: .bottomLeading)
    
    let lg3 = LinearGradient(gradient: Gradient(colors: [Color.clear, Color(#colorLiteral(red: 0.6168119941, green: 0.9449498395, blue: 1, alpha: 1))]),
                             startPoint: .topLeading,
                             endPoint: .bottom)
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text("The Blob")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Custom Shapes")
                .font(.title)
                .foregroundColor(.gray)
            
            Spacer()
            
            ZStack {
                BlobShape()
                    .fill(lg)
                
                BlobShape()
                    .stroke(lg3, style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap.round, dash: [60, 35]))
                    .offset(x: -16, y: -5)
                
                BlobShape()
                    .fill(lg2)
                    .opacity(0.6)
                    .rotationEffect(.degrees(10))
                    .scaleEffect(1.1)
                    .offset(x: -5)
                
                BlobShape()
                    .stroke(lg3, style: StrokeStyle(lineWidth: 12, lineCap: CGLineCap.round, dash: [45, 35]))
                    .frame(height: 360)
                
                BlobShape()
                    .stroke(lg3, style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap.round, dash: [60, 35]))
                    .offset(x: -8, y: 5)
                    .rotationEffect(.degrees(10))
                
                Image("laptop")
                    .offset(x: -90, y: 55)
                
                VStack(spacing: 10.0) {
                    Text("Meng To rocks!")
                        .fontWeight(.bold)
                        .font(.system(.title, design: .rounded))
                    
                    Text("Watch his video as he talks about the blob. ")
                }
                .foregroundColor(Color.white)
                .padding()
                .frame(width: 240)
                .background(RoundedRectangle(cornerRadius: 8)
                .fill(Color.secondary))
                .offset(x: 60, y: -70)
            }
            .frame(width: 400, height: 400)
            
            Spacer()
        }
    }
}

struct Path_MakingBlobs_Previews: PreviewProvider {
    static var previews: some View {
        Path_MakingBlobs()
    }
}

struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        let startPoint = CGPoint(x: rect.width * 0.65, y: 0)
        
        var path = Path()
        path.move(to: startPoint)
        path.addCurve(to: CGPoint(x: rect.width, y: rect.height/2),
                      control1: CGPoint(x: rect.width * 0.85, y: 0),
                      control2: CGPoint(x: rect.width, y: rect.height * 0.1))
        path.addCurve(to: CGPoint(x: rect.width / 2, y: rect.height),
                      control1: CGPoint(x: rect.width, y: rect.height * 0.9),
                      control2: CGPoint(x: rect.width * 0.75, y: rect.height))
        path.addCurve(to: CGPoint(x: 0, y: rect.height * 0.7),
                      control1: CGPoint(x: rect.width * 0.35, y: rect.height),
                      control2: CGPoint(x: 0, y: rect.height))
        path.addCurve(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.3),
                      control1: CGPoint(x: 0, y: rect.height * 0.4),
                      control2: CGPoint(x: rect.width * 0.17, y: rect.height * 0.45))
        path.addCurve(to: startPoint,
                      control1: CGPoint(x: rect.width * 0.42, y: rect.height * 0.16),
                      control2: CGPoint(x: rect.width * 0.46, y: 0))
        
        return path
    }
}
