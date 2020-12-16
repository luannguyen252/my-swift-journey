//
//  PageControl.swift
//  SwiftUIOnboardingScreen
//
//  Created by Luan Nguyen on 16/12/2020.
//

import Foundation
import UIKit
import SwiftUI

struct PageControl: UIViewRepresentable {
    // MARK: - SET PAGE NUMBER
    var numberOfPages: Int
    
    // MARK: - SET CURRENT PAGE
    @Binding var currentPageIndex: Int
    
    // MARK: - MAKE UI VIEW
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.currentPageIndicatorTintColor = UIColor.orange
        control.pageIndicatorTintColor = UIColor.gray

        return control
    }
    
    // MARK: - UPDATE UI VIEW
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPageIndex
    }
}
