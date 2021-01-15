//
//  CombineSubscriber.swift
//  SwiftUISurvey
//
//  Created by Amir on 08/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Combine
import UIKit


/**
 This extension adds a cancelableSet property to an NSObject at runtime
 */
public protocol CombineEnabled {
    
    var cancellableBag: CancellableBag { get }
    
}


private var CombineEnabledCancellableBagKey = 0


public extension CombineEnabled where Self: NSObject {
    
    // MARK: Properties
    
    var cancellableBag: CancellableBag {
        if let existing = objc_getAssociatedObject(self, &CombineEnabledCancellableBagKey) as? CancellableBag {
            return existing
        }
        let newCancelableBag = CancellableBag()
        objc_setAssociatedObject(self, &CombineEnabledCancellableBagKey, newCancelableBag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return newCancelableBag
    }
    
}

