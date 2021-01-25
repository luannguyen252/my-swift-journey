//
//  IAPManager.swift
//  PinTube
//
//  Created by Daval Cato on 10/8/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit
import StoreKit


class IAPManager: NSObject, SKProductsRequestDelegate {
    static let sharedInstance = IAPManager()
    
    
    var request: SKProductsRequest!
    var products:[SKProduct] = []
    
    func setupPurchases(_ completion: @escaping (Bool) -> Void) {
        // Check if app can make payments
        if SKPaymentQueue.canMakePayments() {
            completion(true)
            return
            
        }
        
        completion(false)
        
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
        print("products: \(self.products)")
        
    }
    
}

// MARK: Ask For Review

func askForReview() {
    if #available(iOS 10.3, *) {
        SKStoreReviewController.requestReview()
    } else {
        // Fallback on earlier versions
    }
    
}

































