//
//  Host.swift
//  CustomCurvesAndShapes
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

class Host: UIHostingController<ContentView> {
    // MARK: - AUTO HIDDEN HOME INDICATOR
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
}
