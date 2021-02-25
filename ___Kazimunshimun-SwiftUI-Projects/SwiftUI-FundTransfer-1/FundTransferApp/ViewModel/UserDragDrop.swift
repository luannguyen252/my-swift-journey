//
//  UserDragDrop.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import SwiftUI

class UserDragDrop: ObservableObject {
    // 3 rect postion i need to know
    var paymentViewRect = CGRect()
    var collectViewRect = CGRect()
    var userViewRect = CGRect()
    
    @Published var dragDropConfig = DragDropConfig()
    
    //when dragging scroll view should stop scrolling
    @Published var shouldScoll = true
    var scrollAxis: Axis.Set {
        return shouldScoll ? .vertical : []
    }
    
    // i need to know which user is dragging
    @Published var pickedUser = Data.data[0] // for initial
    
    // how much drag occur
    @Published var dragUserMovingPoint = CGPoint()
    @Published var offsetValue = CGPoint(x: 0, y: 0)
    
    // next I need 2 function to check if user rect intersect with paymentView rect or collect view rect
    // so drag working now check if we can work drop
    func checkRectEnter(location: CGPoint) {
        offsetValue = location
        dragUserMovingPoint = CGPoint(
            x: userViewRect.minX + offsetValue.x - 30,
            y: userViewRect.minY + offsetValue.y - 30)
        
        let userRect = CGRect(x: dragUserMovingPoint.x, y: dragUserMovingPoint.y, width: 60, height: 60)
        
        if paymentViewRect.intersects(userRect) {
            if (dragDropConfig.isEnteredCollect) { // first checking if user already entered in collect view
                dragDropConfig.isEnteredCollect = false
            }
            
            if !dragDropConfig.isEnteredPayment { // checking if user view already not entered in paymnet view
                dragDropConfig.isEnteredPayment = true
            }
        } else {
            if dragDropConfig.isEnteredPayment {
                dragDropConfig.isEnteredPayment = false
            }
            
            if collectViewRect.intersects(userRect) {
                if !dragDropConfig.isEnteredCollect {
                    dragDropConfig.isEnteredCollect = true
                }
            } else {
                if dragDropConfig.isEnteredCollect {
                    dragDropConfig.isEnteredCollect = false
                }
            }
        }
        
    }
    
    // and if user dropped on either paymentView or collectView
    func checkDrop() {
        shouldScoll = true
        dragDropConfig.isDragging = false
        
        offsetValue = CGPoint(x: 0, y: 0)
        dragUserMovingPoint = CGPoint(x: userViewRect.minX, y: userViewRect.minY)
        
        if dragDropConfig.isEnteredPayment {
            //need to reset the enter payment
            dragDropConfig.isEnteredPayment = false
            //dropped on payment need to do with animation
            withAnimation {
                dragDropConfig.isDroppedOnPayment = true
            }
        }
        
        if dragDropConfig.isEnteredCollect {
            dragDropConfig.isEnteredCollect = false
            //dropped on collect
            withAnimation {
                dragDropConfig.isDroppedOnCollect = true
            }
        }
    }
}
