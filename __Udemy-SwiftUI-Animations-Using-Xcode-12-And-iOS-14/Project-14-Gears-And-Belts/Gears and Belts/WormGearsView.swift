//
//  WormGearsView.swift
//  Gears and Belts
//
//  Created by Stephen DeStefano on 11/10/20.
//

import SwiftUI

struct WormGearsView: View {
    
    @State private var rotateWormGear = false
    @State private var animateRect1 = false
    @State private var animateRect2 = false
    @State private var animateRect3 = false
    @State private var animateRect4 = false
    
    var body: some View {
        ZStack {
            ZStack {
                //MARK: - WORM GEAR
                Image("wormGear").resizable().frame(width: 100, height: 75)
                
                //MARK: - RECTANGLES FOT THE TURNING EFFECT
                HStack {
                    Rectangle().frame(width: 4, height: 40).foregroundColor(.black)
                        .cornerRadius(5).opacity(animateRect1 ? 0 : 0.3)
                        .offset(x: 2, y: animateRect1 ? 14 : -8)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                        .rotationEffect(.degrees(-4), anchor: .top)
                        .onAppear(){
                            animateRect1.toggle()
                        }
                    
                    Rectangle().frame(width: 4, height: 40).foregroundColor(.black)
                        .cornerRadius(5).opacity(animateRect2 ? 0 : 0.3)
                        .offset(x: 7, y: animateRect2 ? -15 : -8)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                        .rotationEffect(.degrees(-8))
                        .onAppear(){
                            animateRect2.toggle()
                        }
                    
                    Rectangle().frame(width: 4, height: 40).foregroundColor(.black)
                        .cornerRadius(5).opacity(animateRect3 ? 0 : 0.3)
                        .offset(x: 7, y: animateRect3 ? -5 : -10)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                        .rotationEffect(.degrees(-8), anchor: .top)
                        .onAppear(){
                            animateRect3.toggle()
                        }
                    
                    Rectangle().frame(width: 4, height: 40).foregroundColor(.black)
                        .cornerRadius(5).opacity(animateRect4 ? 0 : 0.3)
                        .offset(x: 5, y: animateRect4 ? -10 : -10)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                        .rotationEffect(.degrees(-8), anchor: .top)
                        .onAppear(){
                            animateRect4.toggle()
                        }
                }
            }
        }.shadow(color: .black, radius: 0.4, x: 0, y: 1)
    }
}

struct WormGearsView_Previews: PreviewProvider {
    static var previews: some View {
        WormGearsView()
    }
}
