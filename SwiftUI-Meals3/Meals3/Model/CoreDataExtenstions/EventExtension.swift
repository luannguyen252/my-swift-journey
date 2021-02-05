//
//  EventExtension.swift
//  meals2
//
//  Created by Uwe Petersen on 03.10.17.
//  Copyright © 2017 Uwe Petersen. All rights reserved.
//

import Foundation
import CoreData

extension Event {
    
    override public func awakeFromInsert() {
        // Set date automatically when object ist created
        super.awakeFromInsert()
        timestamp = NSDate() as Date
    }
}

