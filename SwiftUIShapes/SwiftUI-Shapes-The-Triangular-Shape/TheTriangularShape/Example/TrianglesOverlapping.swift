//   | @BigMtnStudio

import SwiftUI

struct TrianglesOverlapping: View {
    var body: some View {
        ZStack {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
            
            TrianglesInCornerView()
            
//            TrianglesInCornerView()
//                .scaleEffect(x: 1, y: -1)
            
            TrianglesInCornerView()
                .scaleEffect(x: -1, y: -1)

//            TrianglesInCornerView()
//                .scaleEffect(x: -1, y: 1)
            
            VStack(spacing: 20) {
                Spacer()
                
                Text("How about some outlines?")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Shapes can have strokes applied to them:")
                
                ZStack {
                    Triangle()
                        .stroke(Color.themeAccent, lineWidth: 10)
                        .frame(height: 120.0)
                        .padding()
                        .shadow(radius: 10, y: 5)
                    
                    Triangle()
                        .stroke(Color.themeTertiary, style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [15, 20]))
                        .frame(height: 110.0)
                        .padding([.top, .leading], 20)
                        .shadow(radius: 10, y: 5)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .foregroundColor(.themeForeground)
        .navigationTitle("Overlapping Triangles")
    }
}

struct TrianglesOverlapping_Previews: PreviewProvider {
    static var previews: some View {
        TrianglesOverlapping()
            .preferredColorScheme(.dark)
    }
}

struct TrianglesInCornerView: View {
    var body: some View {
        GeometryReader { gp in
            ZStack(alignment: .bottomLeading) {
                Triangle()
                    .fill(Color.themeTertiary)
                    .opacity(0.2)
                    .frame(height: 50)
                
                Triangle()
                    .fill(Color.themeTertiary)
                    .opacity(0.2)
                    .frame(width: gp.size.width - 50, height: 100)
                
                Triangle()
                    .fill(Color.themeTertiary)
                    .opacity(0.2)
                    .frame(width: gp.size.width - 100, height: 150)
                
                Triangle()
                    .fill(Color.themeTertiary)
                    .opacity(0.2)
                    .frame(width: gp.size.width - 150, height: 200)
                
                Triangle()
                    .fill(Color.themeTertiary)
                    .opacity(0.2)
                    .frame(width: gp.size.width - 200, height: 250)
                
                Triangle()
                    .fill(Color.themeTertiary)
                    .opacity(0.2)
                    .frame(width: gp.size.width - 250, height: 300)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}
