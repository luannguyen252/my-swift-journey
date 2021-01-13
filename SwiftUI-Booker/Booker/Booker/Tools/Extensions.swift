import Foundation
import SwiftUI

extension Date {
    init(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) {
        var comp = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
        if let _year   = year   { comp.year   = _year   }
        if let _month  = month  { comp.month  = _month  }
        if let _day    = day    { comp.day    = _day    }
        if let _hour   = hour   { comp.hour   = _hour   }
        if let _minute = minute { comp.minute = _minute }
        if let _second = second { comp.second = _second }
        self = Calendar.current.date(from: comp)!
    }
    
    var dayString: String {
        let isCurrentYear = Calendar.current.component(.year, from: Date()) == year
        DateFormatter.default.dateFormat = isCurrentYear ? "MM/dd" : "yy/MM/dd"
        return DateFormatter.default.string(from: self)
    }
}

extension Date {
    var year:   Int { Calendar.current.component(.year,   from: self) }
    var month:  Int { Calendar.current.component(.month,  from: self) }
    var day:    Int { Calendar.current.component(.day,    from: self) }
    var hour:   Int { Calendar.current.component(.hour,   from: self) }
    var minute: Int { Calendar.current.component(.minute, from: self) }
    var second: Int { Calendar.current.component(.second, from: self) }
}

extension DateFormatter {
    static var `default` = DateFormatter()
}


// MARK: - Image
extension Image {
    init?(data: Data) {
        if let uiImage = UIImage(data: data) {
            self = .init(uiImage: uiImage)
            return
        }else {
            return nil
        }
    }
}

// MARK: - Array
extension Array {
    subscript(safe index: Index) -> Element? {
        get {
            indices.contains(index) ? self[index] : nil
        }
    }
}

// MARK: - CGSize
extension CGSize {
    static let silver = CGSize(width: 1, height: sqrt(2))
}
