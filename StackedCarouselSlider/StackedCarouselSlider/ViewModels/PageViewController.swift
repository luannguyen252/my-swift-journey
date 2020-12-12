//
//  PageViewController.swift
//  StackedCarouselSlider
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

struct PageViewController: UIViewRepresentable {
    // MARK: - PROPERTIES
    var total: Int
    @Binding var current: Int
    
    // MARK: - MAKE UI VIEW
    func makeUIView(context: Context) -> UIPageControl {
        let view = UIPageControl()
        view.numberOfPages = total
        view.currentPage = current
        view.currentPageIndicatorTintColor = .white
        view.preferredIndicatorImage = UIImage(systemName: "dot.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16))
        view.backgroundStyle = .minimal
        
        return view
    }
    
    // MARK: - UPDATE UI VIEW
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = current
    }
}
