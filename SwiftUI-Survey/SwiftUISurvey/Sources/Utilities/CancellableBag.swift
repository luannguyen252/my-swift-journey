//
//  CancellableBag.swift
//  SwiftUISurvey
//
//  Created by Amir on 08/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Combine

public class CancellableBag {
    
    // MARK: Properties
    
    private var cancellableSet: Set<AnyCancellable> = Set()
    
    
    // MARK: Public functions
    
    func collect(_ cancellable: AnyCancellable) {
        cancellableSet.insert(cancellable)
    }
}
