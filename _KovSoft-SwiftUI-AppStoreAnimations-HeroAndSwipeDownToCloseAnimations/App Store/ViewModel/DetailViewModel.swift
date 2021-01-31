import SwiftUI

class DetailViewModel: ObservableObject {
    @Published var selectedItem = TodayItem(title: "", category: "", overlay: "", contentImage: "", logo: "")
    @Published var show = false
}

