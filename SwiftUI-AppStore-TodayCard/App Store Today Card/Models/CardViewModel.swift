import Foundation

struct CardModel: Identifiable {
    let id = UUID()
    let header: String
    let title: String
    let description: String
    let subtitle: String
    let image: String

    static let sampleCard: CardModel = CardModel(header: "App of the day",
                                                         title: "Nature shots",
                                                         description: "Desc",
                                                         subtitle: "Camera",
                                                         image: "2")
}
