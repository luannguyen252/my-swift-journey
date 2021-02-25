import SwiftUI

struct ColorList: View {
    var colors: [Color]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 240) {
                ForEach(colors, id: \.self) { _color in
                    GeometryReader { geometry in
                        ZStack {
                            Rectangle()
                                .foregroundColor(_color)
                                .frame(width: 240, height: 384, alignment: .center)
                                .cornerRadius(16)
                                .shadow(color: _color.opacity(0.15), radius: 24, x: 0, y: 4)
                                // Add Rotation 3D Effect
                                .rotation3DEffect(
                                    Angle(degrees: (Double(geometry.frame(in: .global).minX) - 216) / -16), axis: (x: 0, y: 1.0, z: 0)
                                )
                            
                            Image(systemName: "swift")
                                .font(.system(size: 64))
                                .foregroundColor(Color("dark"))
                        }
                    }
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 160)
            .offset(x: -88)
        }
    }
}

#if DEBUG
struct ColorList_Previews: PreviewProvider {
    static var previews: some View {
        ColorList(colors: [Color("purple"), Color("orange"), Color("red"), Color("pink"), Color("pink2"), Color("purple2"), Color("yellow")])
    }
}
#endif
