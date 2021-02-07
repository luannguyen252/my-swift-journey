import SwiftUI

struct MixStacks: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("pink2"))
                    .frame(width: 300, height: 300)
                    
                    Text("SwiftUI")
                        .offset(x: 0, y: 125)
                        .font(.system(size: 60))
                        .foregroundColor(Color("dark"))
            }
            HStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("orange"))
                    .frame(width: 80, height: 80)
                
                VStack(alignment: .leading) {
                    Text("Build Apps. Less Code.")
                        .font(.system(size: 24))
                        .fontWeight(.heavy)
                    
                    Text("Build Better Apps")
                }
            }
        }
    }
}

struct MixStacks_Previews: PreviewProvider {
    static var previews: some View {
        MixStacks()
    }
}
