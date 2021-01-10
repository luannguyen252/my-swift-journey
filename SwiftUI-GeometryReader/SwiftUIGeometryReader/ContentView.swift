import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Thumbnail()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Thumbnail : View {
    var body : some View {
        return VStack {
            HStack(spacing: 50) {
                ForEach(1..<5) { item in
                    GeometryReader { geometry in
                        Image("\(item)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 20) / 40), axis: (x: 20, y: 20, z: 20))
                    }
                    .frame(width: 370, height: 400)
                    .padding(20)
                }
            }
        }
    }
}
