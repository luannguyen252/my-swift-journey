//
//  Workout.swift
//  FitnessExample
//
//  Created by Gualtiero Frigerio on 05/02/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Foundation

struct Workout : Codable {
    var imageName:String?   // optional path of the image describing the exercise
    var title:String!
    var description:String!
    var startDate:Date?
    var endDate:Date?
    var averageHeartRate:Double?
    
    init(title:String, description:String) {
        self.title = title
        self.description = description
    }
    
    func getDuration() -> TimeInterval? {
        guard let startDate = startDate,
              let endDate = endDate else {return nil}
        return endDate.timeIntervalSince(startDate)
    }
    
    func getStartDateString() -> String? {
        if let date = startDate {
            return formatDate(date)
        }
        return nil
    }
    
    func getEndDateString() -> String? {
        if let date = endDate {
            return formatDate(date)
        }
        return nil
    }
    
    func getHeartRateStringValue() -> String {
        if let rate = averageHeartRate {
            return String(Int(rate)) + " bpm"
        }
        return "n/a"
    }
    
    func getBurnedCalories() -> Double {
        guard let duration = getDuration() else {return 0}
        let cph = 100.0 // calories per hour made up value
        let hours = duration / 3600
        let calories = cph * hours
        return calories
    }
}

extension Workout {
    private func formatDate(_ date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
}
