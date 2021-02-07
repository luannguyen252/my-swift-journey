import SwiftUI

enum ColorIdentifier: String, Identifiable, CaseIterable, Codable {
    case yellow
    case orange
    case red
    case pink
    case purple
    case blue
    case green
    case gray

    var color: Color {
        switch self {
        case .yellow: return .yellow
        case .orange: return .orange
        case .red: return .red
        case .pink: return .pink
        case .purple: return .purple
        case .blue: return .blue
        case .green: return .green
        case .gray: return .gray
        }
    }

    var name: String {
        switch self {
        case .yellow: return "yellow"
        case .orange: return "orange"
        case .red: return "red"
        case .pink: return "pink"
        case .purple: return "purple"
        case .blue: return "blue"
        case .green: return "green"
        case .gray: return "gray"
        }
    }

    var id: Int { hashValue }
}
