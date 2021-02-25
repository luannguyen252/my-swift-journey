//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

let GreenSquareSpace = "GreenSquareCoordinateSpace"

struct CoordinateSpace_Intro: View {
    @State var location = CGPoint.zero
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("CoordinateSpace",
                       subtitle: "Introduction",
                       desc: "Use the coordinateSpace modifier to create a named coordinate space that you can refer to elsewhere.",
                       back: Color.green)
            
            Text("The red dot's position starts at 0,0 in the green square's coordinate space.")
                .padding(.horizontal)
            
            Color.green
                .frame(width: 200, height: 200)
                .opacity(0.5)
                .overlay(RedCircle(location: $location))
                .coordinateSpace(name: GreenSquareSpace)
            
            Text("Location: \(Int(location.x)), \(Int(location.y))")
        }
        .font(.title)
    }
}

struct RedCircle: View {
    @Binding var location: CGPoint
    
    var body: some View {
        Circle()
            .fill(Color.red)
            .frame(width: 25, height: 25)
            .gesture(DragGesture(coordinateSpace: .named(GreenSquareSpace))
                        .onChanged { info in
                            location = info.location
                        })
            .position(location)
    }
}

struct CoordinateSpace_Intro_Previews: PreviewProvider {
    static var previews: some View {
        CoordinateSpace_Intro()
    }
}
