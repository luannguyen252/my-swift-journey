import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack {
                GeometryReader { geo  in
                    Image("thumb5").resizable()
                        .offset(y: geo.frame(in: .global).minY > 0 ? -geo.frame(in: .global).minY : 0)
                        .frame(height:geo.frame(in: .global).minY > 0 ? geo.frame(in: .global).minY + 300 : 300)
                       Spacer()
                }
                .frame(height: 300)
            }
            ForEach(0 ..< 18) { _ in
                HStack {
                    Image("profile").resizable().frame(width:50,height:50).clipShape(Circle())
                    VStack {
                        Text("Luan Nguyen").fontWeight(.heavy)
                        Text("UX Engineer").fontWeight(.regular)
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

