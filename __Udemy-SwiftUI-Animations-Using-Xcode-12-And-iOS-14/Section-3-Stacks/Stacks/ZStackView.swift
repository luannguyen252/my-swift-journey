import SwiftUI

struct ZStackView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("pink2"))
                .frame(width: 270, height: 200)
                .offset(x: 0, y: 50)
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("orange"))
                .frame(width: 220, height: 150)
                .offset(x: 0, y: 100)
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("purple"))
                .frame(width: 170, height: 100)
                .offset(x: 0, y: 150)
        }
    }
}

struct ZStackView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackView()
    }
}
