//
//  ActivityIndicator.swift
//  UI
//
//  Created by josh on 2019/07/31.
//  Copyright © 2019 josh. All rights reserved.
//

import SwiftUI
import UIKit

struct ActivityIndicator: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    typealias Coordinator = Void

    let style: UIActivityIndicatorView.Style

    func makeUIView(context: Self.Context) -> Self.UIViewType {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: Self.UIViewType, context: Self.Context) {
        uiView.startAnimating()
    }

    static func dismantleUIView(_ uiView: Self.UIViewType, coordinator: Self.Coordinator) {
        uiView.stopAnimating()
    }
}
