import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Favourites: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                Image("eminem")
                    .resizable().frame(width: 80, height: 80, alignment: .center)
                    .cornerRadius(15)
                VStack(alignment: .leading, spacing: 12) {
                    Text("I'm Leaving Heaven")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text("Eminem")
                        .foregroundColor(.gray)
                }
                Spacer(minLength: 0)
            }
            
            HStack(spacing: 15) {
                Image("edsheeran")
                    .resizable().frame(width: 80, height: 80, alignment: .center)
                    .cornerRadius(15)
                VStack(alignment: .leading, spacing: 12) {
                        Text("Perfect")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                         Text("Ed Sheeran")
                            .foregroundColor(.gray)
                }
                Spacer(minLength: 0)
            }
            
            HStack(spacing: 15) {
                Image("skylergrey")
                    .resizable().frame(width: 80, height: 80, alignment: .center)
                    .cornerRadius(15)
                VStack(alignment: .leading, spacing: 12) {
                    Text("Kill For You")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text("Skyler Grey")
                        .foregroundColor(.gray)
                }
                Spacer(minLength: 0)
            }
        }
        .padding(.all)
    }
}

// All Other Views To Add or Remove
struct Queue: View {
    var body: some View {
        VStack{
            Text("Hello")
        }
    }
}

struct Playlists: View {
    var body: some View {
        VStack{
            Text("Hello")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
