//
//  ContentView.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopNavigationBar()
                .padding(.top, 60)
                .padding(.leading, 30)
                .padding(.trailing, 30)
            
            DashboardView()
                .padding(.leading, 30)
                .padding(.trailing, 30)
            
            GraphBarView()
                .padding(.leading, 30)
                .padding(.trailing, 30)
            
            Spacer()
            
            TabBarView()
                .frame(height: 100)
        }
        .environmentObject(DashboardManager())
        .background(ColorConstants.backgroundLinear)
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

struct TabBarView: View {
    var body: some View {
        ZStack {
            TabWaveShape()
                .fill(ColorConstants.topBackground)
                .frame(height: 100)
            
            Circle()
                .fill(ColorConstants.hexagonLinear)
                .frame(width: 200, height: 200)
                .offset(x: -155, y: 40)
                .clipShape(
                    Rectangle()
                        .rotation(Angle.degrees(8))
                        .offset(x: -155, y: 55)
                )
                .opacity(0.3)
            
            Circle()
                .fill(ColorConstants.hexagonLinearInverted)
                .frame(width: 200, height: 200)
                .offset(x: 155, y: 40)
                .clipShape(
                    Rectangle()
                        .rotation(Angle.degrees(82))
                        .offset(x: 155, y: 55)
                )
                .opacity(0.3)
            
            HStack {
                Image(systemName: "eyedropper.halffull")
                Spacer()
                Image(systemName: "books.vertical.fill")
                Spacer()
                Image(systemName: "applelogo")
            }
            .font(.title2)
            .foregroundColor(ColorConstants.circle)
            .padding(.leading, 30)
            .padding(.trailing, 30)
        }
    }
}

struct TabWaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let midWidth = width/2
        
        path.move(to: CGPoint(x: 0, y: 0))
        
        path.addLine(to: CGPoint(x: 50, y: 7))
        path.addQuadCurve(
            to: CGPoint(x: midWidth - 40, y: 5),
            control: CGPoint(x: 100, y: 20))
        path.addQuadCurve(
            to: CGPoint(x: midWidth + 40, y: 5),
            control: CGPoint(x: midWidth, y: -8))
        path.addQuadCurve(
            to: CGPoint(x: width - 50, y: 7),
            control: CGPoint(x: width - 100, y: 20))
        
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        return path
    }
}

struct NeomorphicRectangleInverted: ViewModifier {
    let topBlur: CGFloat
    let bottomBlur: CGFloat
    let cornerRadius: CGFloat
    let topOffset: CGFloat
    let bottomOffset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.black, lineWidth: 2)
                    .cornerRadius(cornerRadius)
                    .blur(radius: topBlur)
                    .offset(x: topOffset, y: topOffset)
                    .mask(RoundedRectangle(cornerRadius: cornerRadius))
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(ColorConstants.whiteClearWithStopLinear, lineWidth: 2)
                    .blur(radius: bottomBlur)
                    .offset(x: bottomOffset, y: bottomOffset)
                    .mask(RoundedRectangle(cornerRadius: cornerRadius))
            )
    }
}

struct NeomorphicRectangleInvertedTopBottom: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 2)
                    .blur(radius: 4)
                    .offset(x: 0, y: 3)
                    .mask(RoundedRectangle(cornerRadius: 20))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(ColorConstants.whiteClearWithStopTopMiddleToBottomMiddleLinear, lineWidth: 2)
                    .blur(radius: 4)
                    .offset(x: 0, y: -3)
                    .mask(RoundedRectangle(cornerRadius: 20))
            )
    }
}

extension View {
    func invertedRectangleNeomorphify(topBlur: CGFloat = 3,
                                      bottomBlur: CGFloat = 6,
                                      cornerRadius: CGFloat = 10,
                                      topOffset: CGFloat = 3,
                                      bottomOffset: CGFloat = -2) -> some View {
        self.modifier(NeomorphicRectangleInverted(topBlur: topBlur, bottomBlur: bottomBlur, cornerRadius: cornerRadius, topOffset: topOffset, bottomOffset: bottomOffset))
    }
    
    func invertedRectangleMiddleNeomorphify() -> some View {
        self.modifier(NeomorphicRectangleInvertedTopBottom())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
