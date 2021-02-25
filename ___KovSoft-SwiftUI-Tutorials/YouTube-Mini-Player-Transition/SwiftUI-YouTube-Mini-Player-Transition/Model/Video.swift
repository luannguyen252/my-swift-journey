import SwiftUI

struct Video: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var author: String
    var views: Double
    var date: String
}

var videos = [
    Video(image: "thumb1", title: "Video 1", author: "Luan Nguyen", views: 1.000, date: "23 Jan 2021"),
    Video(image: "thumb2", title: "Video 2", author: "Luan Nguyen", views: 1.050, date: "24 Jan 2021"),
    Video(image: "thumb3", title: "Video 3", author: "Luan Nguyen", views: 1.100, date: "25 Jan 2021"),
    Video(image: "thumb4", title: "Video 4", author: "Luan Nguyen", views: 1.150, date: "26 Jan 2021"),
    Video(image: "thumb5", title: "Video 5", author: "Luan Nguyen", views: 1.200, date: "27 Jan 2021"),
    Video(image: "thumb6", title: "Video 6", author: "Luan Nguyen", views: 1.250, date: "28 Jan 2021"),
    Video(image: "thumb7", title: "Video 7", author: "Luan Nguyen", views: 1.300, date: "29 Jan 2021"),
    Video(image: "thumb8", title: "Video 8", author: "Luan Nguyen", views: 1.350, date: "31 Jan 2021"),
]
