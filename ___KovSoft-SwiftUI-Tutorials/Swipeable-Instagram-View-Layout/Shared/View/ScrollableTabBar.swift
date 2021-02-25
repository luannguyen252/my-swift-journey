//
//  ScrollableTabBar.swift
//  Instagram_DM_Swipe (iOS)
//
//  Created by Balaji on 06/02/21.
//

import SwiftUI

struct ScrollableTabBar<Content: View>: UIViewRepresentable {

    // to store our SwiftUI View...
    var content: Content
    
    // Getting Rect To Calculate Width And Height Of ScrollView...
    
    var rect: CGRect
    
    // ContentOffset...
    @Binding var offset: CGFloat
    
    // Tabs...
    var tabs: [Any]
    
    // ScrollView...
    // For Paging AKA Scrollable Tabs...
    let scrollView = UIScrollView()
    
    init(tabs: [Any],rect: CGRect,offset: Binding<CGFloat>,@ViewBuilder content: ()->Content) {
        
        self.content = content()
        self._offset = offset
        self.rect = rect
        self.tabs = tabs
    }
    
    func makeCoordinator() -> Coordinator {
        return ScrollableTabBar.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) ->  UIScrollView {
        
        setUpScrollView()
        // setting Content Size...
        
        scrollView.contentSize = CGSize(width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        scrollView.contentOffset.x = offset
        
        scrollView.addSubview(extractView())
        
        scrollView.delegate = context.coordinator
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // Updating View...
        if uiView.contentOffset.x != offset{
            
            // Animating...
            // The ANimation Glitch Is Because It s Updating On Two Times...

            // Simple....
            // Removing Delegate While Animating...
            
            uiView.delegate = nil
            
            UIView.animate(withDuration: 0.4) {
                uiView.contentOffset.x = offset
            } completion: { (status) in
                if status{uiView.delegate = context.coordinator}
            }

        }
    }
    
    // setting Up ScrollView...
    func setUpScrollView(){
        
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    // Extracting SwiftUI View...
    func extractView()->UIView{
        
        // since it depends upon tab size..
        // so we getting tabs also...
        
        // For Ease Of Use.....
        let controller = UIHostingController(rootView: HStack(spacing: 0){content}.ignoresSafeArea())
        controller.view.frame = CGRect(x: 0, y: 0, width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        return controller.view!
    }
    
    // Delegate Function To Get Offset...
    
    class Coordinator: NSObject,UIScrollViewDelegate{
        
        var parent: ScrollableTabBar
        
        init(parent: ScrollableTabBar) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            parent.offset = scrollView.contentOffset.x
        }
    }
}
