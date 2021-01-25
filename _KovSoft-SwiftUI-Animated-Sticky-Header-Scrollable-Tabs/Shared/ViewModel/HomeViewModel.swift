import SwiftUI

class HomeViewModel: ObservableObject{
    @Published var offset: CGFloat = 0
    
    // Selected Tab
    @Published var selectedtab = tabsItems.first!.tab
}
