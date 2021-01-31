import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "n.square")
                .font(.system(size: 72))
                .foregroundColor(.pink)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
