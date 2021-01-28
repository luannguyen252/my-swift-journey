import SwiftUI

struct ContentView: View {
    // var colors: [Color] = [.blue, .green, .red, .orange]
    var colors = ["pink", "orange", "green", "red", "yellow"]
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 8) {
            Image(uiImage: #imageLiteral(resourceName: "profile"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32, alignment: .center)
                .cornerRadius(16)

            VStack(spacing: 2) {
                Text("Luan Nguyen")
                    .font(.custom("TTFirsNeue-Bold", size: 16))
                    .foregroundColor(colorScheme == .dark ? Color("light") : Color("dark"))
                Text("UX Engineer")
                    .font(.custom("TTFirsNeue-REgular", size: 14))
                    .foregroundColor(colorScheme == .dark ? Color("light") : Color("dark"))
            }
        }
        .padding(.top, 16)
        
        Spacer()
        
        HStack(alignment: .center, spacing: 16) {
            ForEach(0 ..< colors.count) { i in
                ZStack {
                    // colors[i]
                    Color(colors[i])
                        .frame(width: 256, height: 456, alignment: .center)
                        .cornerRadius(24)
                        // .shadow(color: Color(colors[i]).opacity(0.5), radius: 16, x: 2, y: 4)
                    
                    Image(systemName: "swift")
                        .foregroundColor(Color("dark"))
                        .font(.system(size: 80))
                }
            }
        }
        .modifier(ScrollingHStackModifier(items: colors.count, itemWidth: 256, itemSpacing: 16))
        
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
