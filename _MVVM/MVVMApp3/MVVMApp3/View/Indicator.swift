//
//  Indicator.swift
//  MVVMApp3
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct Indicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
