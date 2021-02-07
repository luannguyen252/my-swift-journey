import SwiftUI

struct RollCellView: View {
    var index:Int
    var size:CGFloat = 30
    var alphabet:[Character]
    var fontDesign:Font.Design = Font.Design.monospaced
    var fontColor:Color
    
    var body: some View {
        VStack{
            ForEach(alphabet, id:\.self){ n in
                Text(String(n))
                    .font(.system(size: size, design: fontDesign))
                    .foregroundColor(fontColor)
                    .offset(x: 0, y: CGFloat(index) * (-size))
                    .frame(width: size, height: size, alignment: .center)
            }

        }
        .frame(width: size, height: size, alignment: .top)
        .clipShape(Rectangle())
    }
}
