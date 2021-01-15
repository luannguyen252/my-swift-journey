//
//  UserUpdate.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/26/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation


struct UserUpdate: Identifiable, Hashable {
    let id = UUID()
    
    var title: String
    var bodyText: String
    var isUnread: Bool = true
    var date: Date
    var imageName: String
}


extension UserUpdate {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .medium
        
        return dateFormatter
    }()
    
    
    var formattedDate: String { Self.dateFormatter.string(from: date) }
}
