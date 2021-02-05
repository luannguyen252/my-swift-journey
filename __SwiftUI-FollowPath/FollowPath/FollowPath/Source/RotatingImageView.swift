//
//  RotatingImageView.swift
//  Path
//
//  Created by Sudarshan Sharma on 12/5/20.
//

import SwiftUI

class ImagePosition: ObservableObject {
    @Published var currentPositionRect: CGRect = .zero
}

struct RotatingImageView: View {
    let animationDuration: Double
    @State var centerFrame: CGRect = CGRect(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2, width: 0.0, height: 0.0)
    @State private var currentPosition: CGPoint
    @State private var flag = false
    let foregroundColor: Color
    @ObservedObject var imagePosition = ImagePosition()
    let imageSize: CGSize
    @State var imageFrame: CGRect = .zero
    let name: String
    let pathSize: CGSize
    let pathWidth: CGFloat
    let showBackgroundCircle: Bool
    
    init(_ name: String,
         animationDuration: Double = 20.0,
         foregroundColor: Color = Color.blue,
         imageSize: CGSize = CGSize(width: 45.0, height: 45.0),
         pathSize: CGSize,
         pathWidth: CGFloat = 10.0,
         showBackgroundCircle: Bool = true) {
        self.name = name
        self.imageSize = imageSize
        self.pathSize = pathSize
        self.pathWidth = pathWidth
        self.foregroundColor = foregroundColor
        self.showBackgroundCircle = showBackgroundCircle
        self.animationDuration = animationDuration
        _currentPosition = State(initialValue: CGPoint(x: 0, y: 0))
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .topLeading) {
                if showBackgroundCircle {
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: pathWidth))
                        .foregroundColor(foregroundColor)
                        .frame(width: abs(pathSize.width)*2.1, height: abs(pathSize.height)*2.1)
                }
                
                Image(name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageSize.width, height: imageSize.height)
                    .offset(x: -imageSize.width/2, y: -imageSize.height/2)
                    .modifier(FollowEffect(currentPosition: $currentPosition, imagePosition: self.imagePosition, pct: self.flag ? 1 : 0, path: Circle().path(in: CGRect(x: 0, y: 0, width: abs(pathSize.width)*2.1, height: abs(pathSize.height)*2.1)), rotate: true))
                    .onAppear {
                        withAnimation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
                            self.flag.toggle()
                        }
                    }
            }
            .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
        }
    }
}
