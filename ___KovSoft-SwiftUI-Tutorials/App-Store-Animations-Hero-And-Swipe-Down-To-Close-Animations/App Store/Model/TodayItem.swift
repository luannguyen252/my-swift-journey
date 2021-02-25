import SwiftUI

struct TodayItem: Identifiable {
    var id = UUID().uuidString
    var title: String
    var category: String
    var overlay: String
    var contentImage: String
    var logo: String
}

var items = [
    TodayItem(title: "SwiftUI for Designers P1", category: "Programming", overlay: "Better apps. Less code.", contentImage: "thumb1", logo: "avatar1"),
    TodayItem(title: "SwiftUI for Designers P2", category: "Programming", overlay: "Better apps. Less code.", contentImage: "thumb2", logo: "avatar2"),
    TodayItem(title: "SwiftUI for Designers P3", category: "Programming", overlay: "Better apps. Less code.", contentImage: "thumb3", logo: "avatar3"),
    TodayItem(title: "SwiftUI for Designers P4", category: "Programming", overlay: "Better apps. Less code.", contentImage: "thumb4", logo: "avatar4"),
    TodayItem(title: "SwiftUI for Designers P5", category: "Programming", overlay: "Better apps. Less code.", contentImage: "thumb5", logo: "avatar5"),
    TodayItem(title: "SwiftUI for Designers P5", category: "Programming", overlay: "Better apps. Less code.", contentImage: "thumb6", logo: "avatar6"),
    TodayItem(title: "SwiftUI for Designers P6", category: "Programming", overlay: "Better apps. Less code.", contentImage: "thumb7", logo: "avatar7"),
    TodayItem(title: "SwiftUI for Designers P7", category: "Programming", overlay: "Better apps. Less code.", contentImage: "thumb8", logo: "avatar8"),
]
