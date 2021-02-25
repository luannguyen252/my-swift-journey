import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var opacity: Double = 0
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // First parallax scroll
                    GeometryReader { reader in
                        VStack {
                            Image("avatar6")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                // Default width
                                .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY > 0 ? reader.frame(in: .global).minY + (UIScreen.main.bounds.height / 2.2) : UIScreen.main.bounds.height / 2.2)
                                // Adjusting view postion when scrolls
                                .offset(y: -reader.frame(in: .global).minY)
                            
                                // NavBar change
                                .onChange(of: reader.frame(in: .global).minY) { value in
                                    // Checking if top is reached
                                    let offset = value + (UIScreen.main.bounds.height / 2.2)
                                    
                                    if offset < 80 {
                                        // Ranging from 0 - 80
                                        if offset > 0 {
                                            // Calcluating opacity
                                            let opacity_value = (80 - offset) / 80
                                            self.opacity = Double(opacity_value)
                                            return
                                        }
                                        // Else means full opactiy
                                        self.opacity = 1
                                    } else {
                                        
                                        self.opacity = 0
                                    }
                                }
                        }
                    }
                    // Setting default height
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    // List of songs
                    VStack(spacing: 16) {
                        ForEach(albums,id: \.album_name) { album in
                            HStack(spacing: 16) {
                                Image("\(album.album_cover)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 56, height: 56)
                                    .cornerRadius(16)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("\(album.album_name)")
                                        .font(.custom("TTFirsNeue-Bold", size: 18))
                                        .foregroundColor(Color("light"))
                                    
                                    Text("\(album.album_author)")
                                        .font(.custom("TTFirsNeue-Regular", size: 14))
                                        .foregroundColor(Color("dark4"))
                                }
                                
                                Spacer(minLength: 0)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                    .background(Color("dark"))
                }
            }
            
            HStack {
                Button(action: {
                    print("Home is pressed.")
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24))
                            .foregroundColor(Color("light"))
                        
                        Text("Home")
                            .font(.custom("TTFirsNeue-Bold", size: 18))
                            .foregroundColor(Color("light"))
                    }
                }
                
                Spacer(minLength: 0)
            }
            .padding()
            // .foregroundColor(opacity > 0.6 ? Color("dark") : Color("light"))
            // Since top edge is ignored
            .padding(.top, edges!.top)
            .background(Color("purple2").opacity(opacity))
            .shadow(color: Color("purple2").opacity(opacity > 0.5 ? 0.1 : 0), radius: 5, x: 0, y: 5)
        }
        .ignoresSafeArea(.all, edges: .top)
        .statusBar(hidden: true)
    }
}

// Album Data Model
struct Album {
    var album_name: String
    var album_author: String
    var album_cover: String
}

// Album Data
var albums = [
    Album(album_name: "SwiftUI for Designers 1", album_author: "Luan Nguyen", album_cover: "avatar1"),
    Album(album_name: "SwiftUI for Designers 2", album_author: "Luan Nguyen", album_cover: "avatar2"),
    Album(album_name: "SwiftUI for Designers 3", album_author: "Luan Nguyen", album_cover: "avatar3"),
    Album(album_name: "SwiftUI for Designers 4", album_author: "Luan Nguyen", album_cover: "avatar4"),
    Album(album_name: "SwiftUI for Designers 5", album_author: "Luan Nguyen", album_cover: "avatar5"),
    Album(album_name: "SwiftUI for Designers 6", album_author: "Luan Nguyen", album_cover: "avatar6"),
    Album(album_name: "SwiftUI for Designers 7", album_author: "Luan Nguyen", album_cover: "avatar7"),
    Album(album_name: "SwiftUI for Designers 8", album_author: "Luan Nguyen", album_cover: "avatar8"),
    Album(album_name: "SwiftUI for Designers 9", album_author: "Luan Nguyen", album_cover: "avatar1"),
    Album(album_name: "SwiftUI for Designers 10", album_author: "Luan Nguyen", album_cover: "avatar2"),
    Album(album_name: "SwiftUI for Designers 11", album_author: "Luan Nguyen", album_cover: "avatar3"),
    Album(album_name: "SwiftUI for Designers 12", album_author: "Luan Nguyen", album_cover: "avatar4"),
    Album(album_name: "SwiftUI for Designers 13", album_author: "Luan Nguyen", album_cover: "avatar5"),
    Album(album_name: "SwiftUI for Designers 14", album_author: "Luan Nguyen", album_cover: "avatar6"),
    Album(album_name: "SwiftUI for Designers 15", album_author: "Luan Nguyen", album_cover: "avatar7"),
    Album(album_name: "SwiftUI for Designers 16", album_author: "Luan Nguyen", album_cover: "avatar8"),
]
