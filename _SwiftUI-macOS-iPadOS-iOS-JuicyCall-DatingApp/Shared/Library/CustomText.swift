
import SwiftUI

struct LibraryTextContent: LibraryContentProvider {
    @LibraryContentBuilder
    func subtitleText(base: Text) -> [LibraryItem] {
        LibraryItem(
            base.timeText(),
            title: "Secondary Text"
        )
    }
    @LibraryContentBuilder
    func titleText(base: Text) -> [LibraryItem] {
        LibraryItem(
            base.primaryText(),
            title: "Primary text"
        )
    }
}




//MARK: Time Text..
extension Text {
    func primaryText() -> some View {
        self
            .font(.subheadline)
            .fontWeight(.light)
            .foregroundColor(Color.gray)
            .lineLimit(1)
    }
}

extension Text {
    func timeText() -> some View {
        self
        .font(.footnote)
        .foregroundColor(Color.gray)
    }
}




struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
