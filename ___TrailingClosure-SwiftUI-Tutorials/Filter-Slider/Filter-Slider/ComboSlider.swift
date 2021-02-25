import SwiftUI

struct ComboSlider: View {
    @State var inactiveColor    : Color // Background of Slider
    @State var activeColor      : Color // Active portion of Slider
    
    @State var barheight        : CGFloat = 10 // Slider Bar Height
    @State var buttonDiameter   : CGFloat = 20 // Slider Button Diameter

    // Position Of Buttons (Scale of 0-1)
    @Binding var pos1           : CGFloat
    @Binding var pos2           : CGFloat
    
    var widthFactor             : CGFloat { return pos2 - pos1 } // Factor for how wide the overlay is
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                // Background here
                Rectangle()
                    .foregroundColor(self.inactiveColor)
                    .frame(width: nil, height: self.barheight, alignment: .center)

                // Active Overlay here
                Rectangle()
                    .foregroundColor(self.activeColor)
                    .frame(width: geometry.size.width * self.widthFactor, height: self.barheight, alignment: .center)
                    .position(x: geometry.size.width * (self.pos1 + (self.widthFactor/2.0)), y: geometry.size.height/2.0)
                
                // Buttons here
                Circle()
                    .foregroundColor(self.activeColor)
                    .frame(width: self.buttonDiameter, height: self.buttonDiameter, alignment: .center)
                    .position(x: geometry.size.width * self.pos1, y: geometry.size.height/2.0)
                    .gesture(DragGesture()
                        .onChanged({ value in
                            // Caluclate the scaled position
                            let newPos = value.location.x / geometry.size.width

                            // Set new Position
                            if newPos < 0 { self.pos1 = 0 }
                            else if newPos > self.pos2 { self.pos1 = self.pos2 - 0.01 }
                            else { self.pos1 = newPos }
                        })
                    )

                Circle()
                    .foregroundColor(self.activeColor)
                    .frame(width: self.buttonDiameter, height: self.buttonDiameter, alignment: .center)
                    .position(x: geometry.size.width * self.pos2, y: geometry.size.height/2.0)
                    .gesture(DragGesture()
                        .onChanged({ value in
                            // Caluclate the scaled position
                            let newPos = value.location.x / geometry.size.width

                            // Set new Position
                            if newPos > 1.0 { self.pos2 = 1.0 }
                            else if newPos < self.pos1 { self.pos2 = self.pos1 + 0.01 }
                            else { self.pos2 = newPos }
                        })
                    )
            }
        }
    }
}

#if DEBUG
struct ComboSlider_Previews: PreviewProvider {
    static let c1   = Color.gray
    static let c2   = Color.green
    
    @State static var pos1  : CGFloat = 0.2
    @State static var pos2  : CGFloat = 0.9

    static var previews: some View {
        ComboSlider(inactiveColor: c1, activeColor: c2, pos1: $pos1, pos2: $pos2)
    }
}
#endif
