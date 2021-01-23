import SwiftUI

// デバイスに応じてスクリーンサイズを返す
class SGConvenience{
    #if os(watchOS)
    static var deviceHeight:CGFloat = WKInterfaceDevice.current().screenBounds.size.height
    static var deviceWidth:CGFloat = WKInterfaceDevice.current().screenBounds.size.width
    #elseif os(iOS)
    static var deviceHeight:CGFloat = UIScreen.main.bounds.size.height
    static var deviceWidth:CGFloat = UIScreen.main.bounds.size.width
    #elseif os(macOS)
    static var deviceHeight:CGFloat = NSScreen.main.bounds.size.height
    static var deviceWidth:CGFloat = NSScreen.main.bounds.size.width
    #endif
}

func dateFormatStr() -> String {
    let formatter = DateFormatter()
    // フォーマット設定
    formatter.dateFormat = "yyyy:MM:dd:HH:mm"
    //dateFormatter.dateFormat = "yyyyMMddHHmmssSSS" // ミリ秒込み
    // ロケール設定（端末の暦設定に引きづられないようにする）
    formatter.locale = Locale(identifier: "en_US_POSIX")
    // タイムゾーン設定（端末設定によらず固定にしたい場合）
    formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
    return formatter.string(from: Date())
}

class EventDay {
    var StartDay = ""
    var EndDay = ""
    static let singleton = EventDay() //staticキーワードでsingle()をsingletonに代入
    private init(){}
}

func timeFomatter(iHour:Int,iMinute:Int,iSeconds:Int) -> String {
    return String(format: "%02d", iHour) + ":" + String(format: "%02d", iMinute) + ":" + String(format: "%02d", iSeconds)
}
