//
//  DailyScrum.swift
//  scrumdinger
//
//  Created by An Trinh on 16/12/2020.
//

import SwiftUI

struct DailyScrum: Identifiable, Codable {
    var id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
    var history: [History]
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color, history: [History] = []) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.color = color
        self.history = history
    }
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(title: "Design",
                       attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                       lengthInMinutes: 10,
                       color: Color("Design")),
            DailyScrum(title: "App Dev",
                       attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                       lengthInMinutes: 5,
                       color: Color("App Dev")),
            DailyScrum(title: "Web Dev",
                       attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                       lengthInMinutes: 1,
                       color: Color("Web Dev"))
        ]
    }
}

extension DailyScrum {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.0
        var color: Color = .random
    }
    
    var data: Data {
        return Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), color: color)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        color = data.color
    }
}

extension DailyScrum {
    var timer: ScrumTimer {
        ScrumTimer(lengthInMinutes: lengthInMinutes, attendees: attendees)
    }
}

extension DailyScrum {
    var iconName: String {
        attendees.count <= 1 ? "person.fill" : "person.\(min(attendees.count, 3)).fill"
    }
}
