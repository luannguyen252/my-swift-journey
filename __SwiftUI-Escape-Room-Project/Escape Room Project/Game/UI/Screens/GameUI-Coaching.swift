//
//  GameUI-Coaching.swift
//  Created by Julian Schiavo on 10/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

extension GameUI {
    struct DefaultCoachingExtra: View {
        public var body: some View {
            Text("The game works best with a large, flat surface")
                .foregroundColor(.white)
                .font(.headline)
                .offset(y: 200)
                .allowsHitTesting(false)
        }
    }
    
    struct PlaneCoachingOverlay: View {
        
        @Binding var isAccuratePlaneDetectionDisabled: Bool
        
        @State private var tapIconScale: CGFloat = 1
        @State private var tapIconOffset: CGFloat = 0
        
        public var body: some View {
            ZStack {
                mainUI
                skipButton
            }
            .onAppear {
                self.animateTapIcon()
            }
        }
        
        private var mainUI: some View {
            VStack(spacing: 20) {
                Spacer().frame(height: 40)
                ZStack() {
                    Image("coaching-plane", isTemplateImage: true)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .foregroundColor(Color.white.opacity(0.6))
                        .allowsHitTesting(false)
                    Image("tap", isTemplateImage: true)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .foregroundColor(.white)
                        .position(x: 260 - tapIconOffset, y: 95)
                        .scaleEffect(tapIconScale)
                        .allowsHitTesting(false)
                }
                    .frame(width: 300, height: 100)
                    .allowsHitTesting(false)
                
                Spacer().frame(height: 70)
                
                Text("Tap a highlighted surface to place the game")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("If no surfaces are shown, try to move around")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .allowsHitTesting(false)
        }
        
        private var skipButton: some View {
            VStack {
                Spacer()
                Button(action: {
                    self.isAccuratePlaneDetectionDisabled.toggle()
                }) {
                    Text("Skip and Use Less Accurate AR")
                        .foregroundColor(Color(red: 235 / 255, green: 235 / 255, blue: 245 / 255))
                        .font(Font.system(.headline, design: .rounded))
                        .fontWeight(.bold)
                        .padding(15)
                }
                .buttonStyle(PlainButtonStyle())
                .background(Blur(style: .systemThinMaterial))
                .cornerRadius(10000)
                .shadow(color: Color.black.opacity(0.5), radius: 3)
            }.padding(.bottom, 30)
        }
        
        private func animateTapIcon() {
            guard GameEngine.current.state == .planeCoaching else { return }
            let offset = CGFloat.random(in: 0...200)
            let duration = Double(abs(offset - tapIconOffset) / 200) * 2
            
            let moveAnimation = Animation.easeInOut(duration: duration)
            let scaleAnimation = Animation.easeInOut(duration: 0.2)
            
            withAnimation(moveAnimation) {
                self.tapIconOffset = offset
            }
            
            DispatchQueue.runAfter(duration + 1.2) {
                withAnimation(scaleAnimation) {
                    self.tapIconScale = 0.8
                }
            }
            
            DispatchQueue.runAfter(duration + 1.4) {
                withAnimation(scaleAnimation) {
                    self.tapIconScale = 1
                }
            }
            
            DispatchQueue.runAfter(duration + 4) {
                self.animateTapIcon()
            }
        }
    }
}
