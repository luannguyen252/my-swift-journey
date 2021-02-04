import SwiftUI

extension Color {
    static func rgb(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    static let backgroundColor = Color("dark")
    static let outlineStrokeColor = Color("pink2")
    static let trackStrokeColor = Color("dark3")
    static let pulsatingFillColor = Color("purple")
    static let bodyText = Color("light")
}
