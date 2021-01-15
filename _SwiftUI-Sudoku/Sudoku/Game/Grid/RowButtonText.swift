import SwiftUI

struct RowButtonText: View {
    let text: String
    let foregroundColor: Color

    private var buttonTextFont: Font {
        let textStyle: Font.TextStyle = isIpad ? .largeTitle : .title
        return Font.system(textStyle, design: .rounded).bold()
    }

    private var buttonMinHeight: CGFloat {
        (screenWidth - (2 * Grid.spacerWidth)) / 9
    }

    var body: some View {
        Text(text)
            .foregroundColor(foregroundColor)
            .font(buttonTextFont)
            .frame(maxWidth: .infinity, minHeight: buttonMinHeight)
    }
}

struct RowButtonText_Previews: PreviewProvider {
    static var previews: some View {
        RowButtonText(text: "1", foregroundColor: .black)
    }
}
