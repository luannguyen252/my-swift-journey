//
//  BlurView.swift
//  DesignCode.v2
//
//  Created by Tee Becker on 11/3/20.
//

import SwiftUI

struct BlurView: UIViewRepresentable{
    typealias UIViewType = UIView
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIView {
        // create view
        let view = UIView()
        view.frame = CGRect.zero
        view.backgroundColor = .clear
        
        // create blureffect
        let blurEffect = UIBlurEffect(style: style) // dark mode adaptbale
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // dont need this right now, useful for animation or when view gets changed.
    }
    

    
}
