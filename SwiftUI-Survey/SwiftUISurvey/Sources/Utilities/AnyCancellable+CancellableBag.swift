//
//  AnyCancellable+CancellableBag.swift
//  SwiftUISurvey
//
//  Created by Amir on 08/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Combine

extension AnyCancellable {
    
    func collect(by bag: CancellableBag) {
        bag.collect(self)
    }

}
    
