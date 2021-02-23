//
//  TextBubbleView.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-13.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import SwiftUI

struct MessageTail: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let arrowExtensionPercent: CGFloat = 0.25
        let arrowExtensionAmount = rect.width * arrowExtensionPercent
        //let messageArrow = CGPoint(x: rect.width * 1.25, y: rect.maxY)
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))

        path.addArc(center: CGPoint(x: rect.width + arrowExtensionAmount, y: rect.minY), radius: rect.width, startAngle: .degrees(180), endAngle: .degrees(86), clockwise: true)
        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.midY), control1: CGPoint(x: rect.maxX + (arrowExtensionAmount * 0.8), y: rect.maxY * 0.95), control2: CGPoint(x: rect.maxX, y: rect.maxY * 0.75))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        
        return path
    }
}

struct MessageTailView: ViewModifier {
    let hasTail: Bool
    let zAlignment: Alignment
    let color: Color
    let size: CGFloat
    let rotationAngle: Angle
    let axis: (x: CGFloat, y: CGFloat, z: CGFloat)
    
    func body(content: Content) -> some View {
        ZStack(alignment: zAlignment) {
            if hasTail {
                MessageTail()
                    .foregroundColor(color)
                    .rotation3DEffect(rotationAngle, axis: axis)
                    .frame(width: size, height: size)
            }
            content
        }
    }
    
    init(hasTail: Bool, location: HorizontalAlignment, color: Color, size: CGFloat = 18) {
        self.hasTail = hasTail
        self.zAlignment = Alignment(horizontal: location, vertical: .bottom)
        self.color = color
        self.size = size
        
        switch location {
        case .leading:
            self.rotationAngle = .degrees(180)
            self.axis = (x: 0, y: 1, z: 0)
        default:
            self.rotationAngle = .degrees(0)
            self.axis = (x: 0, y: 0, z: 0)
        }
    }
}

extension View {
    func messageTail(hasTail: Bool, location: HorizontalAlignment, color: Color, size: CGFloat = 18) -> some View {
        self.modifier(MessageTailView(hasTail: hasTail, location: location, color: color, size: size))
    }
}

struct TextBubbleView: View {
    let text: String
    let messageAlignment: HorizontalAlignment
    let textColor: Color
    let backgroundColor: Color
    let hasTail: Bool
    
    var body: some View {
        Text(text)
            .font(.system(size: 17, weight: .regular, design: .default))
            .multilineTextAlignment(.leading)
            .padding([.leading, .trailing], 12)
            .padding([.top, .bottom], 8)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(18)
            .messageTail(hasTail: hasTail, location: messageAlignment, color: backgroundColor)
    }
}

struct TextBubbleView_Previews: PreviewProvider {
    static let testMessage = "Here there here is a really long message that tests the size capacity available"
    
    static var previews: some View {
        Group {
            TextBubbleView(text: "Hi", messageAlignment: .leading, textColor: .white, backgroundColor: .gray, hasTail: true)
                .previewLayout(.sizeThatFits)
                .padding()
            
            TextBubbleView(text: "Medium message", messageAlignment: .trailing, textColor: .white, backgroundColor: .blue, hasTail: false)
            .previewLayout(.sizeThatFits)
            .padding()
            
            TextBubbleView(text: testMessage, messageAlignment: .trailing, textColor: .white, backgroundColor: .blue, hasTail: true)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
