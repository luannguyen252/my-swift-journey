//
//  AnimatedView.swift
//  AnimatedSplashScreen
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI
import Lottie

struct AnimatedView: UIViewRepresentable {
    // MARK: - PROPERTIES
    @Binding var show: Bool
    
    func makeUIView(context: Context) -> AnimationView {
        let view = AnimationView(name: "splash", bundle: Bundle.main)
        view.play { (status) in
            if status {
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)) {
                    show.toggle()
                }
            }
        }
        return view
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
    }
}
