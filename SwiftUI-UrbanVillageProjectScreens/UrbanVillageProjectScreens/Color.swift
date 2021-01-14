import SwiftUI

@available(iOS 13.0, *)
extension Color {
  static var random: Color {
    return Color(red: .random(in: 0...1),
                 green: .random(in: 0...1),
                 blue: .random(in: 0...1))
  }
}
