//
//  DropViewDelegate.swift
//  CoverFlow (iOS)
//
//  Created by Balaji on 18/01/21.
//

import SwiftUI

// Drop Delegate functions....
struct DropViewDelegate: DropDelegate {
    
    var page: Page
    var pageData: PageViewModel
    
    func performDrop(info: DropInfo) -> Bool {
        // UnComment This Just a try...
        //pageData.currentPage = nil
        return true
    }
    
    // When User Dragged Into New Page...
    func dropEntered(info: DropInfo) {
        
        // UnComment This Just a try...
       /* if pageData.currentPage == nil{
            pageData.currentPage = page
        } */
        
        // Getting From And To Index...
        
        // From Index
        let fromIndex = pageData.urls.firstIndex { (page) -> Bool in
            return page.id == pageData.currentPage?.id
        } ?? 0
        
        // To Index...
        let toIndex = pageData.urls.firstIndex { (page) -> Bool in
            return page.id == self.page.id
        } ?? 0
        
        // Safe Check if both are not same...
        if fromIndex != toIndex{
            // Animation...
            withAnimation(.default){
                
                // Swapping Data...
                let fromPage = pageData.urls[fromIndex]
                pageData.urls[fromIndex] = pageData.urls[toIndex]
                pageData.urls[toIndex] = fromPage
            }
        }
    }
    
    // setting Action as Move...
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}


// You Can Also Hide The Current View But When U Swiped So Fast The Perform Drop Dosent Seems To Work.....
// Let's See that...
