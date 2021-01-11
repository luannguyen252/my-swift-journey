import SwiftUI

struct ContentView: View {
    @State private var isFullScreen = false
    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: true) {
                if !isFullScreen {
                    CardView()
                    
                }
                ListCardView(isFullScreen: $isFullScreen)
                    .onTapGesture{
                        withAnimation(.spring()) {
                            self.isFullScreen.toggle()
                        }
                }
                if !isFullScreen {
                    CardView()
                }
            }
            .navigationBarTitle("Swift UI Cards!")
            .navigationBarHidden(isFullScreen ? true: false)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        LinearGradient(gradient:Gradient(colors:[Color.blue,Color.red]),startPoint:.topLeading, endPoint: .bottomTrailing)
            .cornerRadius(12)
            .padding()
            .frame(height:200)
    }
}

struct ListCardView: View {
    @Binding var isFullScreen: Bool
    var body: some View {
        VStack {
            HStack {
                Text("The Daily List")
                    .padding(.top ,isFullScreen ? 44:0)
                Spacer()
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Where Gamers")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Find Community")
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                Spacer()
            }
            ForEach(0 ..< 4) { _ in
                CellView()
            }
        }
        .padding()
        .background(Color(.systemBlue))
        .cornerRadius(12)
        .padding(isFullScreen ? 0: 16)
        .frame(width: UIScreen.main.bounds.width,height: isFullScreen ? UIScreen.main.bounds.height:572 )
        .offset(x: 0, y: isFullScreen ? -44:0)
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct CellView: View {
    var body: some View {
        HStack {
            LinearGradient(gradient:Gradient(colors:[Color.blue,Color.red]),startPoint:.topLeading, endPoint: .bottomTrailing)
                .frame(width:72,height:72)
                .cornerRadius(12)
            VStack(alignment:.leading) {
                Text("Twitch:Lives\nGame Streaming")
                Text( "Watch games and stuff")
            }
            Spacer()
            VStack {
                NavigationLink(destination:Text("Coming soon?")) {
                    Text("GET")
                        .font(.system(.title,design:.serif))
                        .padding(.vertical,8.0)
                        .padding(.horizontal)
                        .background(Color(.systemGray4))
                        .clipShape(Capsule())
                }
                Text("In-App Purchases")
                    .font(.caption)
                    .padding(.top,8.0)
            }
        }
    }
}
