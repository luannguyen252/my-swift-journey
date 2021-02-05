import SwiftUI
import SpriteKit

extension Color {
    static let systemBackground: Self = {
        #if os(macOS)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color(UIColor.systemBackground)
        #endif
    }()

    static let systemGray5: Self = {
        #if os(macOS)
        return Color(NSColor.systemGray)
        #else
        return Color(UIColor.systemGray5)
        #endif
    }()

    static func forLevel(_ level: DifficultyLevel) -> Self {
        switch level {
        case .easy: return .green
        case .normal: return .blue
        case .hard: return .red
        }
    }
}
