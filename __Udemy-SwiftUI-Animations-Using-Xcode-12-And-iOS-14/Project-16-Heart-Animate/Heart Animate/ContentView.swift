//
//  ContentView.swift
//  Heart Animate
//
//  Created by Stephen DeStefano on 12/29/20.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - VARIABLES
    @State var strokeReset: Bool = true
    @State var startStroke: CGFloat = 0.0
    @State var endStroke: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                //MARK: - STATIONARY HEART SHAPE
                ZStack {
                    HeartShape()
                        .stroke(style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                        .foregroundColor(.white)
                        .opacity(0.40)
                    
                    //MARK: - ANIMATING HEART STROKE
                    HeartShape().trim(from: startStroke, to: endStroke)
                        .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color.white)
                    
                    //MARK: - HEART IMAGE
                    Image("heart").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 175, alignment: .center)
                        .position(x: (geo.size.width / 4.1), y: (geo.size.height / 8.5))
                }.position(x: (geo.size.width / 1.3), y: (geo.size.height / 1.2))
                
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
                        if (endStroke >= 1) {
                            if (strokeReset) {
                                Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { _ in
                                    endStroke = 0
                                    startStroke = 0
                                    strokeReset.toggle()
                                }
                                strokeReset = false
                            }
                        }
                        
                        withAnimation(Animation.easeOut) {
                            endStroke += 0.1
                            startStroke = endStroke - 0.3
                        }
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
