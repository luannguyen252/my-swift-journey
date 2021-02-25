import SwiftUI

struct ContentView: View {
    @State var rollNumber = 1
    @State var rolledIt = false

    var body: some View {
        VStack {
            Spacer()
            
            Image(rolledIt ? "\(rollNumber)" : "unknown")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 64, height: 64)
                .clipped()

            Spacer()

            Button("Roll The Dice") {
                let randomNumber = Int.random(in: 1 ..< 7)
                rollNumber = randomNumber
                rolledIt = true
            }
            .font(.custom("TTFirsNeue-Bold", size: 16))
            .foregroundColor(Color("dark"))
            .background(Capsule().fill(Color(rolledIt ? "\(rollNumber)" : "unknown")))
        }
        .padding(.horizontal, 16)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
