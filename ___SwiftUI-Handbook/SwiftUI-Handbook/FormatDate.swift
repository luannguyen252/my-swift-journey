import SwiftUI

struct FormatDate: View {
    let today = Date().formatDate()
    
    var body: some View {
        Text(today)
    }
}

extension Date {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMM d")
        return dateFormatter.string(from: self)
    }
}

// Format a JavaScript string to a SwiftUI Date
/*
 func formatStringDate(date: String) -> String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
         let newDate = dateFormatter.date(from: date)
         dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
         return dateFormatter.string(from: newDate!)
 }
 // Output: December 21, 2020
 */

#if DEBUG
struct FormatDate_Previews: PreviewProvider {
    static var previews: some View {
        FormatDate()
    }
}
#endif
