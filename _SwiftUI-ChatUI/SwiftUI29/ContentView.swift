import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopView()
            BottomView()
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopView: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.6).edgesIgnoringSafeArea(.top)
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    Text("Chat")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        print("Magnifyingglass is pressed!")
                    }) {
                        Image(systemName: "magnifyingglass").resizable().frame(width: 32, height: 32).foregroundColor(.white)
                    }
                    Button(action: {
                        print("Ellipsis Circle is pressed!")
                    }) {
                        Image(systemName: "ellipsis.circle").resizable().frame(width: 32, height: 32).foregroundColor(.white).foregroundColor(.white)
                    }
                }
                .padding()
                MiddleView().clipShape(Rounded())
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}

struct MiddleView: View {
    var body: some View {
        GeometryReader { geo in
            List(0 ..< 20) { _ in
                HStack {
                    Image("profile").resizable().frame(width: 50, height: 50).aspectRatio(contentMode: ContentMode.fit).clipShape(Circle())
                    VStack(alignment: .leading, spacing: 16){
                        Text("SwiftUI").fontWeight(.heavy)
                        Text("Build Apps. Less Code.").fontWeight(.medium).lineLimit(1)
                    }
                    Spacer()
                    VStack {
                        Text("00:00 AM").fontWeight(.heavy)
                        Spacer()
                    }
                }
                .padding()
            }
        }
    }
}

struct BottomView: View {
    var body: some View {
        HStack(spacing: 200) {
            Button(action: {
                print("Message Fill is pressed!")
            }) {
                Image(systemName: "message.fill").resizable().frame(width: 32, height: 32).foregroundColor(.blue).opacity(0.6)
            }
            Button(action: {
                print("Person Fill is pressed!")
            }) {
                Image(systemName: "person.fill").resizable().frame(width: 32, height: 32).foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct Rounded: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft], cornerRadii: CGSize(width: 56, height: 56))
        return Path(path.cgPath)
    }
}
