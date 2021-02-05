//
//  ListScrollingHelper.swift
//  Meals3
//
//  Created by Uwe Petersen on 10.04.20.
//  Copyright © 2020 Uwe Petersen. All rights reserved.
//

import Foundation
import SwiftUI

struct ListScrollingHelper: UIViewRepresentable {
    let proxy: ListScrollingProxy // reference type

    func makeUIView(context: Context) -> UIView {
        return UIView() // managed by SwiftUI, no overloads
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        proxy.catchScrollView(for: uiView) // here UIView is in view hierarchy
    }
}
