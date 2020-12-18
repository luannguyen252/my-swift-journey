//
//  BlurView.swift
//  TranslucentBackgroundEffect
//
//  Created by Luan Nguyen on 18/12/2020.
//

import SwiftUI

//: MARK: - VISUAL EFFECT VIEW
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) { }
}

