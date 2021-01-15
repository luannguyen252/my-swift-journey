//
//  UserUpdatesStore.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/26/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import Combine


final class UserUpdatesStore: ObservableObject {
    
    static var defaultUpdates = [
        UserUpdate(
            title: "SwiftUI",
            bodyText: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.",
            isUnread: true,
            date: Date().addingTimeInterval(-1 * (60 * 60 * 24 * 2)),
            imageName: "Illustration1"
        ),
        UserUpdate(
            title: "Achievement Unlocked",
            bodyText: "You won an Apple Design Award",
            isUnread: true,
            date: Date().addingTimeInterval(-1 * (60 * 60 * 24 * 4)),
            imageName: "Illustration2"
        ),
        UserUpdate(
            title: "New Courses Available",
            bodyText: "3 new courses have been published since your last visit",
            isUnread: false,
            date: Date().addingTimeInterval(-1 * (60 * 60 * 24 * 6)),
            imageName: "Illustration3"
        ),
    ]
    
    @Published var updates: [UserUpdate]
    
    
    init(updates: [UserUpdate] = UserUpdatesStore.defaultUpdates) {
        self.updates = updates
    }
}
