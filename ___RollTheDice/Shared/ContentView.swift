import SwiftUI

struct ContentView: View {
    @State var rollNumber = 1
    @State var rolledIt = false

    var body: some View {
        #if os(iOS)
        ZStack {
            Rectangle()
                .fill(Color("dark"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image(rolledIt ? "\(rollNumber)" : "unknown")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipped()
                
                Spacer()
                
                Button("Roll The Dice") {
                    let randomNumber = Int.random(in: 1 ..< 7)
                    rollNumber = randomNumber
                    rolledIt = true
                }
                .foregroundColor(Color("dark"))
                .background(Capsule().fill(Color(rolledIt ? "\(rollNumber)" : "unknown")))
                .buttonStyle(PrimaryButtonStyle())
            }
            .padding(.bottom, 16)
        }
        .statusBar(hidden: true)
        #elseif os(macOS)
        ZStack {
            Rectangle()
                .fill(Color("dark"))
                 .frame(maxWidth: .infinity, maxHeight: .infinity)

            VStack {
                Spacer()
                
                Image(rolledIt ? "\(rollNumber)" : "unknown")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipped()
                
                Spacer()
                
                Button("Roll The Dice") {
                    let randomNumber = Int.random(in: 1 ..< 7)
                    rollNumber = randomNumber
                    rolledIt = true
                }
                .foregroundColor(Color("dark"))
                .background(Capsule().fill(Color(rolledIt ? "\(rollNumber)" : "unknown")))
                .buttonStyle(PrimaryButtonStyle())
            }
            .padding(16)
            .frame(width: 300, height: 450)
        }
        #endif
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.custom("TTFirsNeue-Bold", size: 24))
            .padding(.vertical, 24)
            .padding(.horizontal, 48)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
