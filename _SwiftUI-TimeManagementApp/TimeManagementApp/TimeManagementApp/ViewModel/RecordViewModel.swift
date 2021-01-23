import SwiftUI

class RecordViewModel: ObservableObject {
    @Published var eventTitle:String = ""
    @Published var workHour:Int = 0
    @Published var workMinute:Int = 0
    @Published var workSecond:Int = 0
    @Published var deleteView = false
    @Published var moveToView = false
    @Published var memoEditor:String = "初期値"
}
