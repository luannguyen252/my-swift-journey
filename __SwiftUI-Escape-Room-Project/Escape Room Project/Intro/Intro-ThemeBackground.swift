//
//  ThemeBackground.swift
//  Created by Julian Schiavo on 8/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

struct ThemeBackground: View {
    
    @State private var isHelloStickerVisible = false
    @State private var isWWDCStickerVisible = false
    @State private var is2020StickerVisible = false
    
    private let startingColor = Color(red: 44 / 255, green: 45 / 255, blue: 46 / 255) // #2C2D2E
    private let endingColor =   Color(red: 24 / 255, green: 24 / 255, blue: 25 / 255) // #181819
    
    public var body: some View {
        GeometryReader { proxy in
            self.body(screenWidth: proxy.size.width, screenHeight: proxy.size.height)
        }.edgesIgnoringSafeArea(.all)
    }
    
    private func body(screenWidth: CGFloat, screenHeight: CGFloat) -> some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(gradient: Gradient(colors: [startingColor, endingColor]), startPoint: .top, endPoint: .bottom)
            if isHelloStickerVisible {
                helloSticker(screenWidth: screenWidth, screenHeight: screenHeight)
            }
            if isWWDCStickerVisible {
                wwdcSticker(screenWidth: screenWidth, screenHeight: screenHeight)
            }
            if is2020StickerVisible {
                yearSticker(screenWidth: screenWidth, screenHeight: screenHeight)
            }
            Rectangle()
                .fill(Color.black)
                .frame(width: 2, height: screenHeight)
                .offset(x: screenWidth / 2, y: 0)
        }
        .onAppear {
            let helloStickerAnimation = Animation.easeInOut(duration: 0.4)
            withAnimation(helloStickerAnimation) {
                self.isHelloStickerVisible = true
            }
            let wwdcStickerAnimation = Animation.easeInOut(duration: 0.4).delay(0.2)
            withAnimation(wwdcStickerAnimation) {
                self.isWWDCStickerVisible = true
            }
            let yearStickerAnimation = Animation.easeInOut(duration: 0.3).delay(0.6)
            withAnimation(yearStickerAnimation) {
                self.is2020StickerVisible = true
            }
        }
    }
    
    private func helloSticker(screenWidth: CGFloat, screenHeight: CGFloat) -> some View {
        let width = screenWidth * 0.4 //0.5
        let height = (196 / 521) * width
        
        let x = (screenWidth * 0.048)
        let y = (screenHeight * 0.1)
        
        return Image("sticker-hello", isTemplateImage: false)
            .resizable()
            .frame(width: width, height: height)
            .rotationEffect(.degrees(-13))
            .offset(x: x, y: y)
            .transition(.scale(scale: 2, anchor: .center))
    }
    
    private func wwdcSticker(screenWidth: CGFloat, screenHeight: CGFloat) -> some View {
        let width = screenWidth * 0.35 //0.45
        let height = (148.5 / 460) * width
        
        let x = (screenWidth * 0.96) - width
        let y = (screenHeight * 0.76) - height
        
        return Image("sticker-wwdc", isTemplateImage: false)
            .resizable()
            .frame(width: width, height: height)
            .rotationEffect(.degrees(17))
            .offset(x: x, y: y)
            .transition(.scale(scale: 2, anchor: .center))
    }
    
    private func yearSticker(screenWidth: CGFloat, screenHeight: CGFloat) -> some View {
        let width = screenWidth * 0.124 //0.214
        let height = (250 / 219) * width
        
        let x = (screenWidth * 0.89) - width
        let y = (screenHeight * 0.92) - height
        
        return Image("sticker-2020", isTemplateImage: false)
            .resizable()
            .frame(width: width, height: height)
            .rotationEffect(.degrees(-15))
            .offset(x: x, y: y)
            .transition(.scale(scale: 2, anchor: .center))
    }
}
