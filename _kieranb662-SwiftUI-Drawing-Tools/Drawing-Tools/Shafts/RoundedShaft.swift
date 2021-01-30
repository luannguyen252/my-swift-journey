import SwiftUI

struct RoundedShaft: View {
    var color: Color
    var width: CGFloat
    var shaftCornerRadius: CGFloat = 5
    
    init(color: Color, width: CGFloat = 50) {
        self.color = color
        self.width = width
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: shaftCornerRadius)
            .fill(color)
            .frame(width: width)
    }
}

struct RoundedShaft_Previews: PreviewProvider {
    static var previews: some View {
        RoundedShaft(color: .blue)
    }
}
