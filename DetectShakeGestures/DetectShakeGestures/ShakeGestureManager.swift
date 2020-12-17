//
//  ShakeGestureManager.swift
//  DetectShakeGestures
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI
import Combine

struct ShakeGestureManager: View {
    let messagePublisher = PassthroughSubject<Void, Never>()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

class ShakableViewController: UIViewController {
override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        messagePublisher.send()
    }
}

struct ShakableViewRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ShakableViewController {
        ShakableViewController()
    }
    func updateUIViewController(_ uiViewController: ShakableViewController, context: Context) {
        
    }
}


struct ShakeGestureManager_Previews: PreviewProvider {
    static var previews: some View {
        ShakeGestureManager()
    }
}
