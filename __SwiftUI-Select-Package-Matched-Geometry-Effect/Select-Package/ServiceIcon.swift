import SwiftUI

struct ServiceIcon  : View {
    var namespace   : Namespace.ID
    let name        : String
    let size        : CGFloat
    
    var body: some View {
        Image(name)
            .resizable()
            .frame(width: size, height: size, alignment: .center)
            .cornerRadius(size/4)
            .overlay(
                RoundedRectangle(cornerRadius: size/4)
                    .stroke(Color("dark").opacity(0.15), lineWidth: 0.5)
            )
            .matchedGeometryEffect(id: name, in: namespace)
    }
}
