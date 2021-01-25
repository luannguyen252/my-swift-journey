//
//  Video.swift
//  PinTube
//
//  Created by Daval Cato on 2/24/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    
    var channel: Channel?
    
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
    
    
}



