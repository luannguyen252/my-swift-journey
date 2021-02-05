import SwiftUI

struct Card: Identifiable, Equatable, Codable {
    let id: Int
    let art: Art
    var isFaceUp: Bool
}

enum Art: String, CaseIterable, Codable {
    case artDeco
    case arty
    case cave
    case childish
    case destructured
    case geometric
    case gradient
    case impressionism
    case pixelArt
    case watercolor
    case stillLife
    case popArt
    case shadow
    case moderArt
    case charcoal
    case pattern
    case fruitArt
    case painting

    var image: Image {
        switch self {
        case .artDeco: return Image("Art Deco")
        case .arty: return Image("Arty")
        case .cave: return Image("Cave")
        case .childish: return Image("Childish")
        case .destructured: return Image("Destructured")
        case .geometric: return Image("Geometric")
        case .gradient: return Image("Gradient")
        case .impressionism: return Image("Impressionism")
        case .pixelArt: return Image("Pixel Art")
        case .watercolor: return Image("Watercolor")
        case .stillLife: return Image("Nature Morte")
        case .popArt: return Image("Pop Art")
        case .shadow: return Image("Shadow")
        case .moderArt: return Image("Modern Art")
        case .charcoal: return Image("Charcoal")
        case .pattern: return Image("Pattern")
        case .fruitArt: return Image("Fruit Art")
        case .painting: return Image("Painting")
        }
    }

    var description: String {
        switch self {
        case .artDeco: return NSLocalizedString("Art Deco", comment: "Art Deco style")
        case .arty: return NSLocalizedString("Arty", comment: "Arty art style")
        case .cave: return NSLocalizedString("Cave", comment: "Cave art style")
        case .childish: return NSLocalizedString("Childish", comment: "Childish art style")
        case .destructured: return NSLocalizedString("Destructured", comment: "Destructured art style")
        case .geometric: return NSLocalizedString("Geometric", comment: "Geometric art style")
        case .gradient: return NSLocalizedString("Gradient", comment: "Gradient art style")
        case .impressionism: return NSLocalizedString("Impressionism", comment: "Impressionism art style")
        case .pixelArt: return NSLocalizedString("Pixel Art", comment: "Pixel Art style")
        case .watercolor: return NSLocalizedString("Watercolor", comment: "Watercolor art style")
        case .stillLife: return NSLocalizedString("Still Life", comment: "Still Life art style")
        case .popArt: return NSLocalizedString("Pop Art", comment: "Pop Art style")
        case .shadow: return NSLocalizedString("Shadow", comment: "Shadow art style")
        case .moderArt: return NSLocalizedString("Modern Art", comment: "Modern Art style")
        case .charcoal: return NSLocalizedString("Charcoal", comment: "Charcoal art style")
        case .pattern: return NSLocalizedString("Pattern", comment: "Pattern art style")
        case .fruitArt: return NSLocalizedString("Fruit Art", comment: "Fruit Art style")
        case .painting: return NSLocalizedString("Painting", comment: "Painting art style")
        }
    }
}

extension Array where Element == Card {
    static func newGame(from arts: Set<Art>, level: DifficultyLevel) -> Self {
        let selectedArts = arts.shuffled().prefix(level.cardsCount/2)
        let arts = selectedArts + selectedArts
        return arts.shuffled().enumerated().map {
            Card(id: $0, art: $1, isFaceUp: false)
        }
    }

    static var newGame: Self {
        newGame(from: Set(Art.allCases), level: .normal)
    }

    #if DEBUG
    static var predicted: Self {
        predicted()
    }

    static func predicted(
        from arts: [Art] = Art.allCases,
        isFaceUp: Bool = false,
        level: DifficultyLevel = .normal
    ) -> Self {
        let selectedArts = arts.prefix(level.cardsCount/2)
        let cards = selectedArts + selectedArts
        return cards.enumerated().map {
            Card(id: $0, art: $1, isFaceUp: isFaceUp)
        }
    }
    #endif
}
