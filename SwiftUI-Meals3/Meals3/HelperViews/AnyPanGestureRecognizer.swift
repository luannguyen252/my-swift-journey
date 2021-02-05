//
//  AnyGestureRecognizer.swift
//
//  To resign keyboard on any pan gesture, modified version of https://stackoverflow.com/a/60010955/3687284
//  Meals3
//
//  Created by Uwe Petersen on 10.04.20.
//  Copyright © 2020 Uwe Petersen. All rights reserved.
//

import Foundation
import SwiftUI

class AnyPanGestureRecognizer: UIPanGestureRecognizer {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        //        To prevent keyboard hide and show when switching from one textfield to another
        if let textField = touches.first?.view, textField is UITextField {
            state = .failed
        } else {
            state = .began
        }
    }

//    // Uwe: it also works, when resigning first responder in touchesMoved(...)
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
////        state = .changed
//        print("touches moved and ended afterwards")
//        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//        state = .ended
//    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        state = .ended
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        state = .cancelled
    }
}

