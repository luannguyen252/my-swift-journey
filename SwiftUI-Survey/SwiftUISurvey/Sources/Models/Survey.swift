//
//  Survey.swift
//  SwiftUISurvey
//
//  Created by Amir on 02/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Foundation

struct Survey: Codable, Identifiable {
    
    // MARK: Properties
    
    var id: UUID
    var title: String
    var questionIds: [UUID]
}
