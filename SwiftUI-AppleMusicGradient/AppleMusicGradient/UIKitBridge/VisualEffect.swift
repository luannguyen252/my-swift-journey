//
//  VisualEffect.swift
//  AppleMusicGradient
//
//  Created by Swapnanil Dhol on 7/19/20.
//  Copyright © 2020 Swapnanil Dhol. All rights reserved.
//

import SwiftUI

struct VisualEffect: UIViewRepresentable {
    var effect: UIVisualEffect?
    let effectView = UIVisualEffectView(effect: nil)
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        effectView.effect = effect
        return effectView
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { }
}
