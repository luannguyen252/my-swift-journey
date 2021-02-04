import SwiftUI

struct SFSymbolView: View {
    var body: some View {
        HStack {
            Text("You are my sunshine")
                .foregroundColor(.green)
                .lineLimit(1)
            Image(systemName: "sun.haze")
                .foregroundColor(.yellow)
            // Image(systemName: "sun.haze").resizable().aspectRatio(contentMode: .fit).foregroundColor(.yellow)
            // Spacer()
            Text("my only sunshine")
                .foregroundColor(.orange)
                .lineLimit(1)
                .layoutPriority(1)
            // Spacer()
        }
    }
}

struct SFSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolView()
    }
}
