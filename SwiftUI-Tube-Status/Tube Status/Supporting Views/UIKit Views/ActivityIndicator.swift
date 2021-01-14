//
//  ActivityIndicator.swift
//  Tube Status
//
//  Created by Clarence Ji on 7/8/19.
//  Copyright © 2019 Clarence Ji. All rights reserved.
//

import SwiftUI
import UIKit

struct ActivityIndicator : UIViewRepresentable {
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: self.style)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
}
