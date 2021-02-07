//
//  ArcView.swift
//  Wifi_Loading
//
//  Created by Stephen DeStefano on 1/8/21.
//

import SwiftUI

struct ArcView: View {
    var radius: CGFloat
    @Binding var fillColor: Color
    @Binding var shadowColor: Color
    
    var body: some View {
        ArcShape(radius: radius)
            .fill(fillColor)
            .shadow(color: shadowColor, radius: 5)
            .frame(height: radius)
            .animation(Animation.spring().speed(0.75))
            .onTapGesture {
                fillColor = Color.wifiConnected
            }
    }
}

struct ArcShape : Shape {
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: self.radius, startAngle: .degrees(220), endAngle: .degrees(320), clockwise: false)
        return p.strokedPath(.init(lineWidth: 6, lineCap: .round))
    }
}

struct ArcView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ArcView(radius: 42, fillColor: .constant(Color.green), shadowColor: .constant(Color.red))
        }
    }
}
