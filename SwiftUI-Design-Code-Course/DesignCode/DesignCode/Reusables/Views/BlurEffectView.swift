//
//  BlurEffectView.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/25/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import UIKit

struct BlurEffectView {
    typealias UIViewType = UIView
    typealias Context = UIViewRepresentableContext<BlurEffectView>
    
    let blurStyle: UIBlurEffect.Style
    

    init(blurStyle: UIBlurEffect.Style = .systemMaterial) {
        self.blurStyle = blurStyle
    }
}


extension BlurEffectView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let containerView = UIView(frame: .zero)
        containerView.backgroundColor = .clear
        
        // Create a blurred effect view
        let blurredEffectView = makeBlurredEffectView()
        
        // Add the blurred effect view as the first
        // subview of the transparent container view
        containerView.insertSubview(blurredEffectView, at: 0)
        
        activateEndToEndConstraints(for: blurredEffectView, in: containerView)

        return containerView
    }
    
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}


private extension BlurEffectView {
    
    func makeBlurredEffectView() -> UIVisualEffectView {
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
        
        effectView.translatesAutoresizingMaskIntoConstraints = false
        
        return effectView
    }
    
    
    func activateEndToEndConstraints(for subview: UIView, in containerView: UIView) {
        NSLayoutConstraint.activate([
            subview.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            subview.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            subview.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            subview.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
    }
}


struct BlurEffectView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Text("Blur Me")
            BlurEffectView(blurStyle: .systemChromeMaterial)
        }
        .background(Color.blue)
    }
}
