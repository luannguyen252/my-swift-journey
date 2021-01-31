//
//  Calendar+Extension.swift
//  iMovie
//
//  Created by Sandesh on 14/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import Foundation

extension Calendar {
    
    static var shared: Calendar { Calendar(identifier: .gregorian) }
    
    func convertStringToDate(_ date: String, format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: date)
    }
    
    func convertDateToString(_ date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    func convertString(date: String, from format : String, to newFormat: String) -> String?{
        guard let newDate = convertStringToDate( date, format: format) else { return nil }
        return convertDateToString(newDate, format: newFormat)
    }
}
