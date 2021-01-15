//
//  LottieView.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/15.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    let animationView = AnimationView()
    let fileName: String
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
        
        let view = UIView()
        
        let animation = Animation.named(fileName)
        animationView.loopMode = .autoReverse
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

