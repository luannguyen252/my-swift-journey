//
//  Resource.swift
//  EnumUses
//
//  Created by Stewart Lynch on 2021-02-16.
//

import Foundation

struct Resource: Identifiable {
    enum ResourceType: String {
        case blog,website,podcast,youtube
    }
    let id = UUID()
    var name: String
    var url: String
    var resourceType: ResourceType
}

extension Resource {
    static var starterResources: [Resource] {
        [
            Resource.init(name: "Swift by Sundell", url: "https://www.swiftbysundell.com", resourceType: .website),
            Resource.init(name: "Hacking With Swift", url: "https://www.hackingwithswift.com", resourceType: .website),
            Resource.init(name: "Code with Chris", url: "https://www.youtube.com/c/CodeWithChris", resourceType: .youtube),
            Resource.init(name: "SwiftLee", url: "https://www.avanderlee.com", resourceType: .blog),
            Resource.init(name: "Fireside Swift", url: "https://podcasts.apple.com/ca/podcast/fireside-swift/id1269435221", resourceType: .podcast),
            Resource.init(name: "Kilo Loco", url: "https://www.youtube.com/c/KiloLoco", resourceType: .youtube)
        ]
    }
    
}
