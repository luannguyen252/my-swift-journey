//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Path_RelativeArc: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Path", subtitle: "Relative Arc", desc: "Use .addRelativeArc to create a portion of a circle.",
                       back: .purple, textColor: .white)
            
            VStack(spacing: 0.0) {
                HalfCircle()
                    .fill(Color.purple)
                Rectangle()
                    .fill(Color.purple)
            }
            .padding(.horizontal)
            
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct Path_RelativeArc_Previews: PreviewProvider {
    static var previews: some View {
        Path_RelativeArc()
    }
}

struct HalfCircle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRelativeArc(center: CGPoint(x: rect.midX, y: rect.maxY),
                            radius: rect.midX,
                            startAngle: .degrees(180),
                            delta: .degrees(180))
        
        return path
    }
}
