import SwiftUI

struct YellowSmileyFace: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.yellow)
                .overlay(Circle().stroke().stroke(lineWidth: 7))
                .padding()
            
            Eyes()
                .frame(width: 350, height: 290, alignment: .leading)
                .offset(x: 0, y: 25)
            
            Mouth()
                .frame(width: 350, height: 100, alignment: .center)
                .offset(x: 25, y: -18)
        }
        .rotationEffect(.init(degrees: 5))
    }
}

#if DEBUG
struct YellowSmileyFace_Previews: PreviewProvider {
    static var previews: some View {
        YellowSmileyFace()
    }
}
#endif
