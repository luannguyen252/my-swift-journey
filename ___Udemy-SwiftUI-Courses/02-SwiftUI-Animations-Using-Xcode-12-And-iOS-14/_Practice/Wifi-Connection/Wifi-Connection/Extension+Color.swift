import SwiftUI

extension Color {
    static let wifiBackground   : Color = Color(r: 17, g: 17, b: 17)
    static let wifiShadow       : Color = Color(r: 24, g: 24, b: 24)
    static let wifiConnected    : Color = Color(r: 0, g: 229, b: 153)
    
    init(r: Double, g: Double, b: Double) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0)
    }
}
