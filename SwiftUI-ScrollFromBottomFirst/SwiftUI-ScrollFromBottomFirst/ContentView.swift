import SwiftUI

struct ContentView: View {
    let data = ["5", "4", "3", "2", "1"]
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                ForEach(data, id: \.self) { datum in
                    Text("\(datum) Message")
                        .font(.largeTitle)
                        // .scaleEffect(y: -1)
                        .rotationEffect(Angle.degrees(180))
                }
            }
            // .scaleEffect(y: -1)
            .rotationEffect(Angle.degrees(180))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
