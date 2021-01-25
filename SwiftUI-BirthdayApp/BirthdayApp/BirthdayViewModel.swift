//
//  BirthdayViewModel.swift
//  BirthdayApp
//
//  Created by jb on 2020/10/13.
//

import Foundation
import SwiftUI
import Combine

class BirthdayViewModel{
    var id: UUID
    var name: String
    var date: Date
    
    var monthFormatter : DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .short
        f.dateFormat = "MMM"
        return f
    }()
    
    var dayFormatter : DateFormatter = {
        let d = DateFormatter()
        d.dateStyle = .short
        d.dateFormat = "dd"
        return d
    }()
    
    var remainingDays: Int {
        var nextBirthdayComponents = Calendar.current.dateComponents([.day, .month], from: date)
        let todayComponent = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        nextBirthdayComponents.year = todayComponent.year!
        
        var nextBday = Calendar.current.date(from: nextBirthdayComponents)
        
        if todayComponent.day == nextBirthdayComponents.day && todayComponent.month == nextBirthdayComponents.month {
            return 0
        }
        
        if Date() > nextBday! {
            nextBday = Calendar.current.date(byAdding: .year, value: 1, to: nextBday!)
        }
        
        return Calendar.current.dateComponents([.day], from: Date(), to: nextBday!).day ?? 0
    }
    
    var turningYear: Int{
        return (Calendar.current.dateComponents([.year], from: date, to: Date()).year ?? 0) + 1
    }
    
    var monthString: String{
        return monthFormatter.string(from: date)
    }
    
    var dayString: String{
        return dayFormatter.string(from: date)
    }
    
    init(id: UUID, name: String, date: Date){
        self.id = id
        self.name = name
        self.date = date
    }
    
    init(birthday: Birthday){
        self.id = birthday.id ?? UUID()
        self.name = birthday.name ?? ""
        self.date = birthday.date ?? Date()
    }
}
