import Foundation

// MARK: - CATEGORY DATA MODEL
struct Category: Codable, Identifiable {
  let id    : Int
  let name  : String
  let image : String
}
