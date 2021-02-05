//
//  Habit.swift
//  Habits
//
//  Created by Sandesh on 01/07/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import Foundation

struct  Habit: Codable, Identifiable, Hashable {
    
    static let testHabit = Habit(id: UUID(), name: "Journelling")
    var id: UUID
    var name: String
    var createdDate = Date()
}


