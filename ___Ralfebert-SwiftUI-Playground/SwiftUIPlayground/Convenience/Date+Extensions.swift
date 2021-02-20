// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import Foundation

extension Date {

    init(year: Int, month: Int, day: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        self = Calendar.current.date(from: dateComponents)!
    }

}
