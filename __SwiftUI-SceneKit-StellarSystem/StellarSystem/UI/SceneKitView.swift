//
//  SceneKitView.swift
//  StellarSystem
//
//  Created by Malik, Alayli on 2019/10/21.
//  Copyright © 2019 Malik Alayli. All rights reserved.
//

import SwiftUI
import SceneKit

struct SceneKitView {
    private let sceneView = StellarSystemView(frame: .zero)
    
    func toggleMotion () {
        guard let scene = sceneView.scene else {
            return
        }
        scene.isPaused = !scene.isPaused
    }
}

extension SceneKitView : UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return sceneView
    }

    func updateUIView(_ view: UIView, context: Context) {
    }
}
