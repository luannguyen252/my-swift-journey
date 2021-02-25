import SwiftUI

struct ContentView: View {
    @State var values:[CGFloat]
        
    @State var pos1:CGFloat = 0.0
    @State var pos2:CGFloat = 1.0

    @State var activeColor:Color = .blue
    @State var inactiveColor:Color = .gray
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                // Bar Graph
                BarGraph(values: self.values, pos1: self.$pos1, pos2: self.$pos2, activeColor: self.activeColor, inactiveColor: self.inactiveColor)

                // ComboSlider
                ComboSlider(inactiveColor: self.inactiveColor, activeColor: self.activeColor, pos1: self.$pos1, pos2: self.$pos2)
                    .position(x: geometry.size.width/2.0, y: geometry.size.height + 5)

            }
        }
    }
}
