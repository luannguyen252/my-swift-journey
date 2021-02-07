//
//  RingView.swift
//  DesignCode.v2
//
//  Created by Tee Becker on 10/30/20.
//

import SwiftUI

struct RingView: View {
//    @State var show = true // we want to see the progress regardless of situation
    @Binding var show: Bool
    
    var colorOne = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    var colorTwo = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    var circleWidth:CGFloat = 44
    var circleHeight:CGFloat = 44
    var percent: CGFloat = 75

    var body: some View {
        // To scale the Linewidth, TextSize, shadow radiu
        let multiplier = circleWidth / 44
        let progress = 1 - (percent / 100)
        
        ZStack {
            
            // Base circle ( white ish color )
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: circleWidth, height: circleHeight)
            
            // Top circle
            Circle()
                // the line starts from mid -right area, and goes clockwise ->
                // .trim cuts part of the circle to look like a ring.  From cuts the first 10% of the chunk that will be missing.
                .trim(from: show ? progress : 1, to: 1)
                
                // lineWidth - length of each dash that makes the circle
                // line cap - shape of each dash basically, but ONLY visible if there is a dash between the gap
                // dash - if the second number is 0, then there is no gap in circle
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(colorOne), Color(colorTwo)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 1.0, y: 0.0, z: 0.0))
                .frame(width: circleWidth, height: circleHeight)
                .shadow(color: Color(colorTwo).opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
//                .animation(.easeInOut)  // set at the parent level ( Cert view )
            
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .bold()
                .onTapGesture(count: 1, perform: {
                    show.toggle()
                    print("Tapped")
                })
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
