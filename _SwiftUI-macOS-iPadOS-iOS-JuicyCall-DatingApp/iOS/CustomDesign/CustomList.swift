
import SwiftUI

struct LibraryListContent: LibraryContentProvider {
    
    @LibraryContentBuilder
    func listDesign(base: AnyView) -> [LibraryItem] {
        LibraryItem(
            base.listDesign(image: "user13", title: "Messages"),
            title: "Custom List"
        )
    }
}




//MARK: List Design


extension View {
    func listDesign(image: String, title: String) -> some View {
    self
        .navigationBarItems(trailing: Image(image)
        .imgAvatar(width: 30, height: 30))
        .navigationBarTitle(title)
        .listStyle(SidebarListStyle())
    }
   
}
