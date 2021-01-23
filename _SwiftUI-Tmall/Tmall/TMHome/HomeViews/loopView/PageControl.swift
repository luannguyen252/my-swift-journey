//
//  PageControl.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/23.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI


/// 已经不再使用
struct PageControl: UIViewRepresentable {
    typealias UIViewType = UIPageControl
    
  func makeCoordinator() -> Coordinator {
         Coordinator(self)
     }
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: UIViewRepresentableContext<PageControl>) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        
        return control
    }
    
    
    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<PageControl>) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
    
}
