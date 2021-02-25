import SwiftUI

struct BarGraph: View {
    @State var values:[CGFloat]
    
    var maxVal:CGFloat{
        return self.values.max() ?? 0
    }
    
    // Position of active bars. Range (0-1)
    @Binding var pos1:CGFloat
    @Binding var pos2:CGFloat

    @State var activeColor:Color
    @State var inactiveColor:Color

    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center, spacing: 2) {
                ForEach(self.values.indices) { x in
                    VStack {
                        Spacer()
                        Rectangle()
                        .frame(width: (geometry.size.width / CGFloat(self.values.count)) - 2, height: geometry.size.height * (self.values[x] / self.maxVal) , alignment: .center)
                            .foregroundColor(self.isInActiveArea(x: x) ? self.activeColor : self.inactiveColor)

                    }

                }
            }
        }
    }
    
    
    // Returns whether or not bar is in active area.
    func isInActiveArea(x:Int) -> Bool {
        let position:CGFloat = (CGFloat(x) + 0.5) / CGFloat(self.values.count)
        return position >= self.pos1 && position <= self.pos2
    }
}
