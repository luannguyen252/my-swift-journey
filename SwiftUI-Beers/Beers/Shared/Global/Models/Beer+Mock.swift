import Foundation

extension Beer {
    static func mock() -> Beer {
        .init(
            id: Int.random(in: -999 ... -1000),
            name: "MockBeer",
            tagline: "Hey ho",
            firstBrewed: Date(),
            description: "A short description",
            imageURL: URL(string: "https://duckduckgo.com")!
        )
    }
}
