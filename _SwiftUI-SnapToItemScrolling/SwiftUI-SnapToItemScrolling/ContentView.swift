import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.blue, .green, .red, .orange]
    
    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            ForEach(0..<colors.count) { i in
                 colors[i]
                     .frame(width: 250, height: 400, alignment: .center)
                     .cornerRadius(10)
                
            }
        }
        .modifier(ScrollingHStackModifier(items: colors.count, itemWidth: 250, itemSpacing: 30))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
