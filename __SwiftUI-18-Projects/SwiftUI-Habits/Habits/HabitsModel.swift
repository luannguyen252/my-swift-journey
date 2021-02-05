//
//  HabitsModel.swift
//  Habits
//
//  Created by Sandesh on 16/11/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import Foundation

class HabitsModel: ObservableObject {
    @Published var allHabits = [Habit(id: UUID(), name: "Journelling"),
                                Habit(id: UUID(), name: "Journelling"),
                                Habit(id: UUID(), name: "Journelling"),
                                Habit(id: UUID(), name: "Journelling"),
                                Habit(id: UUID(), name: "Journelling"),
                                Habit(id: UUID(), name: "Journelling"),
                                Habit(id: UUID(), name: "Journelling")]
    
    func addHabit(_ habit: Habit) {
        allHabits.append(habit)
    }
    
    func removeHabit(_ habit: Habit) {
        allHabits.removeAll { $0.id == habit.id }
    }

}
